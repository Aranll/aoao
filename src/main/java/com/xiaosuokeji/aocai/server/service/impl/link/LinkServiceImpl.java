package com.xiaosuokeji.aocai.server.service.impl.link;

import com.xiaosuokeji.aocai.server.constant.link.LinkConsts;
import com.xiaosuokeji.aocai.server.dao.link.LinkDao;
import com.xiaosuokeji.aocai.server.model.link.Link;
import com.xiaosuokeji.aocai.server.service.intf.link.LinkService;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;
import com.xiaosuokeji.framework.xsjframework.util.UuidUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 链接ServiceImpl<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
@Service
public class LinkServiceImpl implements LinkService {

    @Autowired
    private LinkDao linkDao;

    @Override
    public void save(Link link) throws BusinessException {
        link.setId(UuidUtil.generate());
        linkDao.save(link);
    }

    @Override
    public void remove(Link link) throws BusinessException {
        Link existent = linkDao.get(link);
        if (existent.getDelable().equals(0)) {
            throw new BusinessException(LinkConsts.LINK_NOT_DELABLE);
        }
        linkDao.remove(link);
    }

    @Override
    public void update(Link link) throws BusinessException {
        linkDao.update(link);
    }

    @Override
    public Link get(Link link) throws BusinessException {
        Link existent = linkDao.get(link);
        if (existent == null) throw new BusinessException(LinkConsts.LINK_NOT_EXIST);
        return existent;
    }

    @Override
    public PageModel<Link> listAndCount(Link link) {
        link.setDefaultSort("create_time", "DESC");
        return PageModel.build(linkDao.list(link), linkDao.count(link));
    }

    @Override
    public PageModel<Link> listCombo(Link link) {
        link.setDefaultSort("seq", "DESC");
        return PageModel.build(linkDao.listCombo(link), linkDao.count(link));
    }
}
