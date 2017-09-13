package com.xiaosuokeji.aocai.admin.controller.article;

import com.xiaosuokeji.aocai.admin.annotation.Index;
import com.xiaosuokeji.aocai.admin.annotation.Pagination;
import com.xiaosuokeji.aocai.admin.enumeration.API;
import com.xiaosuokeji.aocai.admin.model.article.Article;
import com.xiaosuokeji.aocai.admin.oss.model.SecurityToken;
import com.xiaosuokeji.aocai.admin.oss.server.SecurityTokenServer;
import com.xiaosuokeji.aocai.admin.util.GsonUtils;
import com.xiaosuokeji.aocai.admin.util.WebUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Aranl_lin on 2017/9/4.
 */
@Controller("adminArticleController")
@RequestMapping(value = "admin/article")
public class ArticleController {

    @Autowired
    private SecurityTokenServer securityTokenServer;

    @RequestMapping(value = "/article",method = RequestMethod.GET)
    @Pagination(items = "articles",api=API.ARTICLE_LIST,itemClass = Article.class)
    @Index
    public String index(Model model, HttpServletRequest request,Article article){
        String redirectUrl = request.getRequestURI();
        String queryString = request.getQueryString();
        if(queryString!=null){
            redirectUrl+="?"+queryString;
        }
        model.addAttribute("redirectUrl",redirectUrl);
        model.addAttribute("article",article);
        model.addAttribute("dynamic",article.getDynamic());
        return "admin/article/article";
    }

    @RequestMapping(value = "/article/save",method = RequestMethod.GET)
    @Index
    public String saveArticle(HttpServletRequest request,Model model,String redirectUrl){
        model.addAttribute("redirectUrl",redirectUrl);
        SecurityToken token=securityTokenServer.getToken();
        model.addAttribute("token",token);
        return "admin/article/articleCreate";
    }

    @RequestMapping(value = "/article/save",method = RequestMethod.POST)
    @ResponseBody
    public String saveArticle(Model model, HttpServletRequest request, Article article){
        return WebUtils.doRawRequest(API.ARTICLE_SAVE,article).toString();
    }

    @RequestMapping(value = "/article/update",method = RequestMethod.GET)
    @Index
    public String getArticle(Model model,HttpServletRequest request,String redirectUrl, Article article){

        SecurityToken token=securityTokenServer.getToken();
        model.addAttribute("token",token);
        model.addAttribute("redirectUrl",redirectUrl);

        JSONObject allResponse = WebUtils.doRawRequest(API.ARTICLE_GET,article);
        if(allResponse.getBoolean("status")){
            model.addAttribute("article",GsonUtils.fromJson(allResponse.getJSONObject("data").toString(),Article.class));
        }

        return "admin/article/articleUpdate";
    }

    @RequestMapping(value = "/article/update",method = RequestMethod.POST)
    @ResponseBody
    public String updateArticle(Model model, HttpServletRequest request, Article article){
        return WebUtils.doRawRequest(API.ARTICLE_UPDATE,article).toString();
    }
    @RequestMapping(value = "/article/remove",method = RequestMethod.POST)
    @ResponseBody
    public String removeArticle(Model model, HttpServletRequest request, Article article){
        return WebUtils.doRawRequest(API.ARTICLE_REMOVE,article).toString();
    }

    @RequestMapping(value="/article/combo/tree",method = RequestMethod.POST)
    @ResponseBody
    public String getTreeArticle(Article article){
        return WebUtils.doRawRequest(API.ARTICLE_TYPE_COMBO,article).toString();
    }
}

