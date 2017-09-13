package com.xiaosuokeji.aocai.server.controller.article;

import com.xiaosuokeji.aocai.server.annotation.XSAuth;
import com.xiaosuokeji.aocai.server.model.article.ArticleType;
import com.xiaosuokeji.aocai.server.service.intf.article.ArticleTypeService;
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
 * 文章类型Controller<br/>
 * Created by xuxiaowei on 2017/8/25.
 */
@Controller
@RequestMapping(value = "/api")
@XSProxy
public class ArticleTypeController {

    @Autowired
    private ArticleTypeService articleTypeService;

    @RequestMapping(value = "/admin/v1/article/type/save", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult saveType(@Validated(ArticleType.Save.class) @RequestBody ArticleType articleType)
            throws BusinessException {
        articleTypeService.save(articleType);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/article/type/remove", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult removeType(@RequestBody ArticleType articleType) throws BusinessException {
        articleTypeService.remove(articleType);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/article/type/update", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult updateType(@Validated(ArticleType.Update.class) @RequestBody ArticleType articleType)
            throws BusinessException {
        articleTypeService.update(articleType);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/article/type/get", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult getType(@RequestBody ArticleType articleType) throws BusinessException {
        return ServiceResult.build().data(articleTypeService.get(articleType));
    }

    @RequestMapping(value = "/admin/v1/article/type/list", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listAndCountType(@RequestBody ArticleType articleType) {
        return ServiceResult.build().data(articleTypeService.listAndCount(articleType));
    }

    @RequestMapping(value = "/admin/v1/article/type/combo", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listTypeCombo(@RequestBody ArticleType articleType) {
        return ServiceResult.build().data(articleTypeService.listCombo(articleType));
    }

    @RequestMapping(value = "/app/v1/article/type/combo", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listTypeCombo4App(@RequestBody ArticleType articleType) {
        articleType.setShowable(1);
        return ServiceResult.build().data(articleTypeService.listCombo(articleType));
    }
}
