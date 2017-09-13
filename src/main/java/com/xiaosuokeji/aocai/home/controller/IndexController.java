package com.xiaosuokeji.aocai.home.controller;

import com.xiaosuokeji.aocai.admin.util.GsonUtils;
import com.xiaosuokeji.aocai.home.enumeration.API;
import com.xiaosuokeji.aocai.home.model.Banner;
import com.xiaosuokeji.aocai.home.model.Link;
import com.xiaosuokeji.aocai.home.util.WebUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by gustinlau on 06/09/2017.
 */
@Controller("homeIndexController")
@RequestMapping("")
public class IndexController {

    @RequestMapping(value = {"","/index"},method = RequestMethod.GET)
    public String index(Model model)
    {
        model.addAttribute("current",0);

        JSONObject bannerResult= WebUtils.doRawRequest(API.APP_BANNER_LIST,"{\"type\": {\"id\": 2}}");
        if(bannerResult.getBoolean("status")){
            model.addAttribute("banners", GsonUtils.listFromJson(bannerResult.getJSONObject("data").getJSONArray("list").toString(), Banner.class));
        }

        JSONObject listResult= WebUtils.doRawRequest(API.APP_LINK_LIST,"{\"type\": {\"id\": 2}}",true);
        if(listResult.getBoolean("status")){
            model.addAttribute("links", GsonUtils.listFromJson(listResult.getJSONObject("data").getJSONArray("list").toString(), Link.class));
        }
        return "home/index";
    }
}
