package com.xiaosuokeji.aocai.admin.controller.article;

import com.xiaosuokeji.aocai.admin.annotation.Index;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Aranl_lin on 2017/9/4.
 */
@Controller("adminArticleIndexController")
@RequestMapping("/admin/article")
public class IndexController {
    @RequestMapping(value = {"","/index"},method = RequestMethod.GET)
    @Index
    public String defaultIndex(HttpServletRequest request){
        return "/admin/article/index";
    }
}
