package com.xiaosuokeji.aocai.server.controller.banner;

import com.xiaosuokeji.aocai.server.annotation.XSAuth;
import com.xiaosuokeji.aocai.server.model.banner.Banner;
import com.xiaosuokeji.aocai.server.service.intf.banner.BannerService;
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
 * Created by xuxiaowei on 2017/8/28.
 */
@Controller
@RequestMapping(value = "/api")
@XSProxy
public class BannerController {

    @Autowired
    private BannerService bannerService;

    @RequestMapping(value = "/admin/v1/banner/save", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult save(@Validated(Banner.Save.class) @RequestBody Banner banner)
            throws BusinessException {
        bannerService.save(banner);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/banner/remove", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult remove(@RequestBody Banner banner) throws BusinessException {
        bannerService.remove(banner);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/banner/update", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult update(@Validated(Banner.Update.class) @RequestBody Banner banner)
            throws BusinessException {
        bannerService.update(banner);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/banner/get", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult get(@RequestBody Banner banner) throws BusinessException {
        return ServiceResult.build().data(bannerService.get(banner));
    }

    @RequestMapping(value = "/admin/v1/banner/list", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listAndCount(@RequestBody Banner banner) {
        return ServiceResult.build().data(bannerService.listAndCount(banner));
    }

    @RequestMapping(value = "/app/v1/banner/get", method = RequestMethod.POST)
    @XSProxy
    public ServiceResult getForApp(@RequestBody Banner banner) throws BusinessException {
        return ServiceResult.build().data(bannerService.get(banner));
    }

    @RequestMapping(value = "/app/v1/banner/list", method = RequestMethod.POST)
    @XSProxy
    public ServiceResult listComboForApp(@RequestBody Banner banner) {
        return ServiceResult.build().data(bannerService.listCombo(banner));
    }
}
