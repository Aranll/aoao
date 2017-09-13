package com.xiaosuokeji.aocai.server.controller.link;

import com.xiaosuokeji.aocai.server.annotation.XSAuth;
import com.xiaosuokeji.aocai.server.model.link.LinkType;
import com.xiaosuokeji.aocai.server.service.intf.link.LinkTypeService;
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
 * 链接类型Controller<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
@Controller
@RequestMapping(value = "/api")
@XSProxy
public class LinkTypeController {

    @Autowired
    private LinkTypeService linkTypeService;

    @RequestMapping(value = "/admin/v1/link/type/save", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult saveType(@Validated(LinkType.Save.class) @RequestBody LinkType linkType)
            throws BusinessException {
        linkTypeService.save(linkType);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/link/type/remove", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult removeType(@RequestBody LinkType linkType) throws BusinessException {
        linkTypeService.remove(linkType);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/link/type/update", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult updateType(@Validated(LinkType.Update.class) @RequestBody LinkType linkType)
            throws BusinessException {
        linkTypeService.update(linkType);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/link/type/get", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult getType(@RequestBody LinkType linkType) throws BusinessException {
        return ServiceResult.build().data(linkTypeService.get(linkType));
    }

    @RequestMapping(value = "/admin/v1/link/type/list", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listAndCountType(@RequestBody LinkType linkType) {
        return ServiceResult.build().data(linkTypeService.listAndCount(linkType));
    }

    @RequestMapping(value = "/admin/v1/link/type/combo", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listTypeCombo(@RequestBody LinkType linkType) {
        return ServiceResult.build().data(linkTypeService.listCombo(linkType));
    }

    @RequestMapping(value = "/app/v1/link/type/combo", method = RequestMethod.POST)
    @XSProxy
    public ServiceResult listTypeCombo4App(@RequestBody LinkType linkType) {
        linkType.setShowable(1);
        return ServiceResult.build().data(linkTypeService.listCombo(linkType));
    }
}
