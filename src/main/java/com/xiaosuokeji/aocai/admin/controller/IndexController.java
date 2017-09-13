package com.xiaosuokeji.aocai.admin.controller;

import com.xiaosuokeji.aocai.admin.annotation.Index;
import com.xiaosuokeji.aocai.admin.util.GsonUtils;
import com.xiaosuokeji.aocai.home.enumeration.API;
import com.xiaosuokeji.aocai.home.model.Config;
import com.xiaosuokeji.aocai.home.util.WebUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by GustinLau on 2017-05-11.
 */
@Controller("adminIndexController")
@RequestMapping("/admin")
public class IndexController {

    @RequestMapping(value = {"","/index"},method = RequestMethod.GET)
    @Index
    public String index(HttpServletRequest request){
        return "admin/index";
    }
}
