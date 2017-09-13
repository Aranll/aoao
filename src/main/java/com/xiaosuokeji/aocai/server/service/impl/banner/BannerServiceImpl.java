package com.xiaosuokeji.aocai.server.service.impl.banner;

import com.xiaosuokeji.aocai.server.constant.banner.BannerConsts;
import com.xiaosuokeji.aocai.server.dao.banner.BannerDao;
import com.xiaosuokeji.aocai.server.model.banner.Banner;
import com.xiaosuokeji.aocai.server.service.intf.banner.BannerService;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;
import com.xiaosuokeji.framework.xsjframework.util.UuidUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 轮播图ServiceImpl<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
@Service
public class BannerServiceImpl implements BannerService {

    @Autowired
    private BannerDao bannerDao;

    @Override
    public void save(Banner banner) throws BusinessException {
        Banner existent = new Banner();
        existent.setName(banner.getName());
        if (bannerDao.count(existent).compareTo(0L) > 0) throw new BusinessException(BannerConsts.BANNER_EXIST);
        banner.setId(UuidUtil.generate());
        bannerDao.save(banner);
    }

    @Override
    public void remove(Banner banner) throws BusinessException {
        Banner existent = bannerDao.get(banner);
        if (existent.getDelable().equals(0)) {
            throw new BusinessException(BannerConsts.BANNER_NOT_DELABLE);
        }
        bannerDao.remove(banner);
    }

    @Override
    public void update(Banner banner) throws BusinessException {
        if (!StringUtils.isBlank(banner.getName())) {
            Banner existent = new Banner();
            existent.setName(banner.getName());
            List<Banner> existents = bannerDao.list(existent);
            if (existents.size() > 0) {
                 boolean isSelf = existents.get(0).getId().equals(banner.getId());
                 if (!isSelf) throw new BusinessException(BannerConsts.BANNER_EXIST);
            }
        }
        bannerDao.update(banner);
    }

    @Override
    public Banner get(Banner banner) throws BusinessException {
        Banner existent = bannerDao.get(banner);
        if (existent == null) throw new BusinessException(BannerConsts.BANNER_NOT_EXIST);
        return existent;
    }

    @Override
    public PageModel<Banner> listAndCount(Banner banner) {
        banner.setDefaultSort("create_time", "DESC");
        return PageModel.build(bannerDao.list(banner), bannerDao.count(banner));
    }

    @Override
    public PageModel<Banner> listCombo(Banner banner) {
        banner.setDefaultSort("seq", "DESC");
        return PageModel.build(bannerDao.listCombo(banner), bannerDao.count(banner));
    }
}
