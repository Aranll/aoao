package com.xiaosuokeji.aocai.server.controller.link;

import com.xiaosuokeji.aocai.server.annotation.XSAuth;
import com.xiaosuokeji.aocai.server.model.link.Link;
import com.xiaosuokeji.aocai.server.service.intf.link.LinkService;
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
 * 链接Controller<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
@Controller
@RequestMapping(value = "/api")
@XSProxy
public class LinkController {

    @Autowired
    private LinkService linkService;

    @RequestMapping(value = "/admin/v1/link/save", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult save(@Validated(Link.Save.class) @RequestBody Link link)
            throws BusinessException {
        linkService.save(link);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/link/remove", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult remove(@RequestBody Link link) throws BusinessException {
        linkService.remove(link);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/link/update", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult update(@Validated(Link.Update.class) @RequestBody Link link)
            throws BusinessException {
        linkService.update(link);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/link/get", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult get(@RequestBody Link link) throws BusinessException {
        return ServiceResult.build().data(linkService.get(link));
    }

    @RequestMapping(value = "/admin/v1/link/list", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listAndCount(@RequestBody Link link) {
        return ServiceResult.build().data(linkService.listAndCount(link));
    }

    @RequestMapping(value = "/app/v1/link/get", method = RequestMethod.POST)
    @XSProxy
    public ServiceResult getForApp(@RequestBody Link link) throws BusinessException {
        return ServiceResult.build().data(linkService.get(link));
    }

    @RequestMapping(value = "/app/v1/link/list", method = RequestMethod.POST)
    @XSProxy
    public ServiceResult listComboForApp(@RequestBody Link link) {
        return ServiceResult.build().data(linkService.listCombo(link));
    }
}
