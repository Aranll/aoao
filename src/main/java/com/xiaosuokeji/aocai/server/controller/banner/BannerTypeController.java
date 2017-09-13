package com.xiaosuokeji.aocai.server.controller.banner;

import com.xiaosuokeji.aocai.server.annotation.XSAuth;
import com.xiaosuokeji.aocai.server.model.banner.BannerType;
import com.xiaosuokeji.aocai.server.service.intf.banner.BannerTypeService;
import com.xiaosuokeji.framework.xsjframework.annotation.XSProxy;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.ServiceResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 轮播图Controller<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
@Controller
@RequestMapping(value = "/api")
@XSProxy
public class BannerTypeController {

    @Autowired
    private BannerTypeService bannerTypeService;

    @RequestMapping(value = "/admin/v1/banner/type/save", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult saveType(@Validated(BannerType.Save.class) @RequestBody BannerType bannerType)
            throws BusinessException {
        bannerTypeService.save(bannerType);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/banner/type/remove", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult removeType(@RequestBody BannerType bannerType) throws BusinessException {
        bannerTypeService.remove(bannerType);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/banner/type/update", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult updateType(@Validated(BannerType.Update.class) @RequestBody BannerType bannerType)
            throws BusinessException {
        bannerTypeService.update(bannerType);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/banner/type/get", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult getType(@RequestBody BannerType bannerType) throws BusinessException {
        return ServiceResult.build().data(bannerTypeService.get(bannerType));
    }

    @RequestMapping(value = "/admin/v1/banner/type/list", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listAndCountType(@RequestBody BannerType bannerType) {
        return ServiceResult.build().data(bannerTypeService.listAndCount(bannerType));
    }

    @RequestMapping(value = "/admin/v1/banner/type/combo", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listTypeCombo(@RequestBody BannerType bannerType) {
        return ServiceResult.build().data(bannerTypeService.listCombo(bannerType));
    }

    @RequestMapping(value = "/app/v1/banner/type/combo", method = RequestMethod.POST)
    @XSProxy
    public ServiceResult listTypeCombo4App(@RequestBody BannerType bannerType) {
        bannerType.setShowable(1);
        return ServiceResult.build().data(bannerTypeService.listCombo(bannerType));
    }
}
