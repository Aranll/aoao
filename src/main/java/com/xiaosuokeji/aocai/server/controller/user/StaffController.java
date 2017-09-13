package com.xiaosuokeji.aocai.server.controller.user;

import com.xiaosuokeji.aocai.server.annotation.XSAuth;
import com.xiaosuokeji.aocai.server.model.user.Staff;
import com.xiaosuokeji.aocai.server.service.intf.user.StaffService;
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
 * 员工Controller<br/>
 * Created by xuxiaowei on 2017/9/4.
 */
@Controller
@RequestMapping(value = "/api")
@XSProxy
public class StaffController {

    @Autowired
    private StaffService staffService;

    @RequestMapping(value = "/admin/v1/staff/save", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult save(@Validated(Staff.Save.class) @RequestBody Staff staff) throws Exception {
        staffService.save(staff);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/staff/remove", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult remove(@RequestBody Staff staff) {
        staffService.remove(staff);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/staff/update", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult update(@Validated(Staff.Update.class) @RequestBody Staff staff) throws Exception {
        staffService.update(staff);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/staff/get", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult get(@RequestBody Staff staff) throws BusinessException {
        return ServiceResult.build().data(staffService.get(staff));
    }

    @RequestMapping(value = "/admin/v1/staff/login", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult login(@Validated(Staff.Login.class) @RequestBody Staff staff) throws Exception {
        return ServiceResult.build().data(staffService.login(staff));
    }

    @RequestMapping(value = "/admin/v1/staff/list", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listAndCount(@RequestBody Staff staff) {
        return ServiceResult.build().data(staffService.listAndCount(staff));
    }
}
