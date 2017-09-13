package com.xiaosuokeji.aocai.server.controller.system;

import com.xiaosuokeji.aocai.server.annotation.XSAuth;
import com.xiaosuokeji.aocai.server.model.system.SystemConfig;
import com.xiaosuokeji.aocai.server.service.intf.system.SystemConfigService;
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
 * 系统配置Controller<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
@Controller
@RequestMapping(value = "/api")
@XSProxy
public class SystemConfigController {

    @Autowired
    private SystemConfigService systemConfigService;

    @RequestMapping(value = "/admin/v1/system/config/save", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult save(@Validated(SystemConfig.Save.class) @RequestBody SystemConfig systemConfig)
            throws BusinessException {
        systemConfigService.save(systemConfig);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/system/config/remove", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult remove(@RequestBody SystemConfig systemConfig) {
        systemConfigService.remove(systemConfig);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/system/config/update", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult update(@Validated(SystemConfig.Update.class) @RequestBody SystemConfig systemConfig)
            throws BusinessException {
        systemConfigService.update(systemConfig);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/system/config/get", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult get(@RequestBody SystemConfig systemConfig) throws BusinessException {
        return ServiceResult.build().data(systemConfigService.get(systemConfig));
    }

    @RequestMapping(value = "/admin/v1/system/config/list", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listAndCount(@RequestBody SystemConfig systemConfig) {
        return ServiceResult.build().data(systemConfigService.listAndCount(systemConfig));
    }

    @RequestMapping(value = "/app/v1/system/config/get", method = RequestMethod.POST)
    @XSProxy
    public ServiceResult getForApp(@RequestBody SystemConfig systemConfig) throws BusinessException {
        return ServiceResult.build().data(systemConfigService.getByKey(systemConfig));
    }
}
