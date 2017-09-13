package com.xiaosuokeji.aocai.server.service.impl.banner;

import com.xiaosuokeji.aocai.server.constant.banner.BannerTypeConsts;
import com.xiaosuokeji.aocai.server.dao.banner.BannerDao;
import com.xiaosuokeji.aocai.server.dao.banner.BannerTypeDao;
import com.xiaosuokeji.aocai.server.model.banner.Banner;
import com.xiaosuokeji.aocai.server.model.banner.BannerType;
import com.xiaosuokeji.aocai.server.service.intf.banner.BannerTypeService;
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
 * 轮播图ServiceImpl<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
@Service
public class BannerTypeServiceImpl implements BannerTypeService {

    @Autowired
    private BannerTypeDao bannerTypeDao;

    @Autowired
    private BannerDao bannerDao;

    @Override
    public void save(BannerType bannerType) throws BusinessException {
        BannerType existent = new BannerType();
        existent.setName(bannerType.getName());
        if (bannerTypeDao.count(existent).compareTo(0L) > 0) {
            throw new BusinessException(BannerTypeConsts.BANNER_TYPE_EXIST);
        }
        if (bannerType.getUpType() == null || bannerType.getUpType().getId() == null) {
            BannerType upType = new BannerType(0L);
            bannerType.setUpType(upType);
        }
        if (!bannerType.getUpType().getId().equals(0L)) {
            BannerType upType = bannerTypeDao.get(bannerType.getUpType());
            bannerType.setShowable(upType.getShowable());
        }
        bannerTypeDao.save(bannerType);
    }

    @Override
    public void remove(BannerType bannerType) throws BusinessException {
        BannerType existent = bannerTypeDao.get(bannerType);
        if (existent.getDelable().equals(0)) {
            throw new BusinessException(BannerTypeConsts.BANNER_TYPE_NOT_DELABLE);
        }
        existent = new BannerType();
        existent.setUpType(bannerType);
        if (bannerTypeDao.count(existent).compareTo(0L) > 0) {
            throw new BusinessException(BannerTypeConsts.BANNER_TYPE_USED);
        }
        Banner banner = new Banner();
        banner.setType(bannerType);
        if (bannerDao.count(banner).compareTo(0L) > 0L) {
            throw new BusinessException(BannerTypeConsts.BANNER_TYPE_USED);
        }
        bannerTypeDao.remove(bannerType);
    }

    @Override
    @Transactional
    public void update(BannerType bannerType) throws BusinessException {
        if (!StringUtils.isBlank(bannerType.getName())) {
            BannerType existent = new BannerType();
            existent.setName(bannerType.getName());
            List<BannerType> existents = bannerTypeDao.list(existent);
            if (existents.size() > 0) {
                boolean isSelf = existents.get(0).getId().equals(bannerType.getId());
                if (!isSelf) throw new BusinessException(BannerTypeConsts.BANNER_TYPE_EXIST);
            }
        }
        if (bannerType.getShowable() != null) {
            List<BannerType> bannerTypes = deepSearch(buildTree(bannerTypeDao.list(new BannerType())), bannerType);
            bannerType.setChildren(bannerTypes);
            bannerTypeDao.updateShowable(bannerType);
        }
        bannerTypeDao.update(bannerType);
    }

    @Override
    public BannerType get(BannerType bannerType) throws BusinessException {
        BannerType existent = bannerTypeDao.get(bannerType);
        if (existent == null) throw new BusinessException(BannerTypeConsts.BANNER_TYPE_NOT_EXIST);
        return existent;
    }

    @Override
    public PageModel<BannerType> listAndCount(BannerType bannerType) {
        bannerType.setDefaultSort("create_time", "DESC");
        return PageModel.build(bannerTypeDao.list(bannerType), bannerTypeDao.count(bannerType));
    }

    @Override
    public List<BannerType> listCombo(BannerType bannerType) {
        bannerType.setDefaultSort("seq", "DESC");
        List<BannerType> list = bannerTypeDao.listCombo(bannerType);
        Map<Long, BannerType> tree = buildTree(list);
        List<BannerType> result = new ArrayList<>();
        if (bannerType.getId() != null) {
            result.add(tree.get(bannerType.getId()));
        }
        else {
            Long parentId = 0L;
            if (bannerType.getUpType() != null && bannerType.getUpType().getId() != null) {
                parentId = bannerType.getUpType().getId();
            }
            for (BannerType item : list) {
                Long upTypeId = item.getUpType().getId();
                if (upTypeId.equals(parentId)) {
                    result.add(item);
                }
            }
        }
        return result;
    }

    private Map<Long, BannerType> buildTree(List<BannerType> list) {
        Map<Long, BannerType> tree = new HashMap<>();
        for (BannerType item : list) {
            tree.put(item.getId(), item);
        }
        for (BannerType item : list) {
            boolean hasParent = item.getUpType() != null && item.getUpType().getId() != null
                    && tree.get(item.getUpType().getId()) != null;
            if (hasParent) {
                tree.get(item.getUpType().getId()).addChild(item);
            }
        }
        return tree;
    }

    private List<BannerType> deepSearch(Map<Long, BannerType> tree, BannerType node) {
        if (node == null || node.getId() == null) {
            return new ArrayList<>();
        }
        BannerType root = tree.get(node.getId());
        List<BannerType> nodes = new ArrayList<>();
        deepSearch(root, nodes);
        return nodes;
    }

    private void deepSearch(BannerType root, List<BannerType> nodes) {
        if (root != null) {
            nodes.add(root);
            if (root.getChildren() != null && root.getChildren().size() > 0) {
                for (BannerType item : root.getChildren()) {
                    deepSearch(item, nodes);
                }
            }
        }
    }
}
