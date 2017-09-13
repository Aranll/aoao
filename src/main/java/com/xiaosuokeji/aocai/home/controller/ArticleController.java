package com.xiaosuokeji.aocai.home.controller;


import com.google.gson.reflect.TypeToken;
import com.xiaosuokeji.aocai.admin.util.GsonUtils;
import com.xiaosuokeji.aocai.home.annotation.Pagination;
import com.xiaosuokeji.aocai.home.enumeration.API;
import com.xiaosuokeji.aocai.home.model.Article;
import com.xiaosuokeji.aocai.home.model.Banner;
import com.xiaosuokeji.aocai.home.model.Type;
import com.xiaosuokeji.aocai.home.util.WebUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by gustinlau on 07/09/2017.
 */
@Controller("articleNewsController")
@RequestMapping("")
public class ArticleController {

    @RequestMapping("/news")
    @Pagination(api = API.APP_ARTICLE_LIST, items = "articles", itemClass = Article.class)
    public String news(HttpServletRequest request, Model model, Article article) {
        model.addAttribute("current", 1);

        JSONObject bannerResult= WebUtils.doRawRequest(API.APP_BANNER_LIST,"{\"type\": {\"id\": 3}}",true);
        if(bannerResult.getBoolean("status")){
            model.addAttribute("banners", GsonUtils.listFromJson(bannerResult.getJSONObject("data").getJSONArray("list").toString(), Banner.class));
        }

        Long typeId = null;
        if (article.getType() != null && article.getType().getId() != null) {
            typeId = article.getType().getId();
        }

        JSONObject articleType = WebUtils.doRawRequest(API.APP_ARTICLE_TYPE_COMBO, "{\"id\":2}",true);
        if (articleType.getBoolean("status")) {
            Type types = GsonUtils.fromJson(articleType.getJSONArray("data").getJSONObject(0).toString(), Type.class);
            if (article.getType() == null || article.getType().getId() == null) {
                if (types.getChildren().size() > 0)
                    typeId = types.getChildren().get(0).getId();
                Type type = new Type();
                type.setId(typeId);
                article.setType(type);
            }
            model.addAttribute("articleTypes", types);
        }
        model.addAttribute("currentTypeId", typeId);

        return "home/news";
    }


    @RequestMapping("/news/details")
    public String details(Model model,String id) {
        model.addAttribute("current", 1);
        JSONObject response = WebUtils.doRawRequest(API.APP_ARTICLE_GET, "{\"id\": \"" + id + "\"}");
        if (response.getBoolean("status")) {
            model.addAttribute("article", GsonUtils.fromJson(response.getJSONObject("data").toString(), Article.class));
        }
        return "home/newsDetails";
    }


    @RequestMapping("/about")
    public String about(Model model, String id) {
        model.addAttribute("current", 2);

        JSONObject bannerResult= WebUtils.doRawRequest(API.APP_BANNER_LIST,"{\"type\": {\"id\": 4}}",true);
        if(bannerResult.getBoolean("status")){
            model.addAttribute("banners", GsonUtils.listFromJson(bannerResult.getJSONObject("data").getJSONArray("list").toString(), Banner.class));
        }


        JSONObject articleList = WebUtils.doRawRequest(API.APP_ARTICLE_LIST, "{\"type\": {\"id\": 1},\"offset\": 0,\"limit\": 1000}",true);
        if (articleList.getBoolean("status")) {
            List<Article> articles = GsonUtils.objectFromJson(articleList.getJSONObject("data").getJSONArray("list").toString(), new TypeToken<List<Article>>() {
            }.getType());

            model.addAttribute("articles", articles);
            if (id == null || id.length() == 0) {
                if (articles.size() > 0)
                    id = articles.get(0).getId();
            }

            JSONObject respones = WebUtils.doRawRequest(API.APP_ARTICLE_GET, "{\"id\": \"" + id + "\"}");
            if (respones.getBoolean("status")) {
                model.addAttribute("atr", GsonUtils.fromJson(respones.getJSONObject("data").toString(), Article.class));
            }
            model.addAttribute("currentId", id);
        }

        return "home/about";
    }
}
