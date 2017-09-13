package com.xiaosuokeji.aocai.server.controller.article;

import com.xiaosuokeji.aocai.server.annotation.XSAuth;
import com.xiaosuokeji.aocai.server.model.article.Article;
import com.xiaosuokeji.aocai.server.service.intf.article.ArticleService;
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
 * 文章Controller<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
@Controller
@RequestMapping(value = "/api")
@XSProxy
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "/admin/v1/article/save", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult save(@Validated(Article.Save.class) @RequestBody Article article)
            throws BusinessException {
        articleService.save(article);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/article/remove", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult remove(@RequestBody Article article) throws BusinessException {
        articleService.remove(article);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/article/update", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult update(@Validated(Article.Update.class) @RequestBody Article article)
            throws BusinessException {
        articleService.update(article);
        return ServiceResult.build();
    }

    @RequestMapping(value = "/admin/v1/article/get", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult get(@RequestBody Article article) throws BusinessException {
        return ServiceResult.build().data(articleService.get(article));
    }

    @RequestMapping(value = "/admin/v1/article/list", method = RequestMethod.POST)
    @XSProxy
    @XSAuth
    public ServiceResult listAndCount(@RequestBody Article article) {
        return ServiceResult.build().data(articleService.listAndCount(article));
    }

    @RequestMapping(value = "/app/v1/article/get", method = RequestMethod.POST)
    @XSProxy
    public ServiceResult getForApp(@RequestBody Article article) throws BusinessException {
        return ServiceResult.build().data(articleService.get(article));
    }

    @RequestMapping(value = "/app/v1/article/list", method = RequestMethod.POST)
    @XSProxy
    public ServiceResult listForApp(@RequestBody Article article) {
        article.setShowable(1);
        return ServiceResult.build().data(articleService.listCombo(article));
    }
}
