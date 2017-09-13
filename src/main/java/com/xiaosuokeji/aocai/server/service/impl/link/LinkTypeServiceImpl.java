package com.xiaosuokeji.aocai.server.service.impl.link;

import com.xiaosuokeji.aocai.server.constant.link.LinkTypeConsts;
import com.xiaosuokeji.aocai.server.dao.link.LinkDao;
import com.xiaosuokeji.aocai.server.dao.link.LinkTypeDao;
import com.xiaosuokeji.aocai.server.model.link.Link;
import com.xiaosuokeji.aocai.server.model.link.LinkType;
import com.xiaosuokeji.aocai.server.service.intf.link.LinkTypeService;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 链接ServiceImpl<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
@Service
public class LinkTypeServiceImpl implements LinkTypeService {

    @Autowired
    private LinkTypeDao linkTypeDao;

    @Autowired
    private LinkDao linkDao;

    @Override
    public void save(LinkType linkType) throws BusinessException {
        LinkType existent = new LinkType();
        existent.setName(linkType.getName());
        if (linkTypeDao.count(existent).compareTo(0L) > 0) {
            throw new BusinessException(LinkTypeConsts.LINK_TYPE_EXIST);
        }
        if (linkType.getUpType() == null || linkType.getUpType().getId() == null) {
            LinkType upType = new LinkType(0L);
            linkType.setUpType(upType);
        }
        if (!linkType.getUpType().getId().equals(0L)) {
            LinkType upType = linkTypeDao.get(linkType.getUpType());
            linkType.setShowable(upType.getShowable());
        }
        linkTypeDao.save(linkType);
    }

    @Override
    public void remove(LinkType linkType) throws BusinessException {
        LinkType existent = linkTypeDao.get(linkType);
        if (existent.getDelable().equals(0)) {
            throw new BusinessException(LinkTypeConsts.LINK_TYPE_NOT_DELABLE);
        }
        existent = new LinkType();
        existent.setUpType(linkType);
        if (linkTypeDao.count(existent).compareTo(0L) > 0) {
            throw new BusinessException(LinkTypeConsts.LINK_TYPE_USED);
        }
        Link link = new Link();
        link.setType(linkType);
        if (linkDao.count(link).compareTo(0L) > 0) {
            throw new BusinessException(LinkTypeConsts.LINK_TYPE_USED);
        }
        linkTypeDao.remove(linkType);
    }

    @Override
    @Transactional
    public void update(LinkType linkType) throws BusinessException {
        if (!StringUtils.isBlank(linkType.getName())) {
            LinkType existent = new LinkType();
            existent.setName(linkType.getName());
            List<LinkType> existents = linkTypeDao.list(existent);
            if (existents.size() > 0) {
                boolean isSelf = existents.get(0).getId().equals(linkType.getId());
                if (!isSelf) throw new BusinessException(LinkTypeConsts.LINK_TYPE_EXIST);
            }
        }
        if (linkType.getShowable() != null) {
            List<LinkType> linkTypes = deepSearch(buildTree(linkTypeDao.list(new LinkType())), linkType);
            linkType.setChildren(linkTypes);
            linkTypeDao.updateShowable(linkType);
        }
        linkTypeDao.update(linkType);
    }

    @Override
    public LinkType get(LinkType linkType) throws BusinessException {
        LinkType existent = linkTypeDao.get(linkType);
        if (existent == null) throw new BusinessException(LinkTypeConsts.LINK_TYPE_NOT_EXIST);
        return existent;
    }

    @Override
    public PageModel<LinkType> listAndCount(LinkType linkType) {
        linkType.setDefaultSort("create_time", "DESC");
        return PageModel.build(linkTypeDao.list(linkType), linkTypeDao.count(linkType));
    }

    @Override
    public List<LinkType> listCombo(LinkType linkType) {
        linkType.setDefaultSort("seq", "DESC");
        List<LinkType> list = linkTypeDao.listCombo(linkType);
        Map<Long, LinkType> tree = buildTree(list);
        List<LinkType> result = new ArrayList<>();
        if (linkType.getId() != null) {
            result.add(tree.get(linkType.getId()));
        }
        else {
            Long parentId = 0L;
            if (linkType.getUpType() != null && linkType.getUpType().getId() != null) {
                parentId = linkType.getUpType().getId();
            }
            for (LinkType item : list) {
                Long upTypeId = item.getUpType().getId();
                if (upTypeId.equals(parentId)) {
                    result.add(item);
                }
            }
        }
        return result;
    }

    private Map<Long, LinkType> buildTree(List<LinkType> list) {
        Map<Long, LinkType> tree = new HashMap<>();
        for (LinkType item : list) {
            tree.put(item.getId(), item);
        }
        for (LinkType item : list) {
            boolean hasParent = item.getUpType() != null && item.getUpType().getId() != null
                    && tree.get(item.getUpType().getId()) != null;
            if (hasParent) {
                tree.get(item.getUpType().getId()).addChild(item);
            }
        }
        return tree;
    }

    private List<LinkType> deepSearch(Map<Long, LinkType> tree, LinkType node) {
        if (node == null || node.getId() == null) {
            return new ArrayList<>();
        }
        LinkType root = tree.get(node.getId());
        List<LinkType> nodes = new ArrayList<>();
        deepSearch(root, nodes);
        return nodes;
    }

    private void deepSearch(LinkType root, List<LinkType> nodes) {
        if (root != null) {
            nodes.add(root);
            if (root.getChildren() != null && root.getChildren().size() > 0) {
                for (LinkType item : root.getChildren()) {
                    deepSearch(item, nodes);
                }
            }
        }
    }
}
