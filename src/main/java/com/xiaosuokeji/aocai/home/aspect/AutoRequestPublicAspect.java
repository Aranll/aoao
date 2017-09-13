package com.xiaosuokeji.aocai.home.aspect;


import com.google.gson.reflect.TypeToken;
import com.xiaosuokeji.aocai.admin.util.GsonUtils;
import com.xiaosuokeji.aocai.home.enumeration.API;
import com.xiaosuokeji.aocai.home.model.Config;
import com.xiaosuokeji.aocai.home.model.Link;
import com.xiaosuokeji.aocai.home.util.WebUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by gustinlau on 10/09/2017.
 */
@Component("homeAutoRequestPublicAspect")
@Aspect
public class AutoRequestPublicAspect {

    @Pointcut("execution(* com.xiaosuokeji.aocai.home.controller.*.*(..))")
    public void aspect() {
    }

    @After(value = "aspect()&&@annotation(requestMapping)")
    public void pagination(JoinPoint pjp, RequestMapping requestMapping) throws Throwable {
        Object[] args = pjp.getArgs();
        Model model = null;
        for (Object arg : args) {
            if (arg instanceof Model) {
                model = (Model) arg;
                break;
            }
        }
        //参数检测
        if (model == null) {
            throw new Exception("方法使用了@Pagination注解却没有引入Model参数");
        }
        JSONObject response;
        //logo
        response=WebUtils.doRawRequest(API.APP_CONFIG_GET,"{\"key\":\"websiteLogo\"}",true);
        if(response.getBoolean("status")){
            model.addAttribute("config_logo", GsonUtils.fromJson(response.getJSONObject("data").toString(), Config.class));
        }
        //备案
        response=WebUtils.doRawRequest(API.APP_CONFIG_GET,"{\"key\":\"recordInfo\"}",true);
        if(response.getBoolean("status")){
            model.addAttribute("config_recordInfo", GsonUtils.fromJson(response.getJSONObject("data").toString(), Config.class));
        }
        //网站名称
        response=WebUtils.doRawRequest(API.APP_CONFIG_GET,"{\"key\":\"websiteName\"}",true);
        if(response.getBoolean("status")){
            model.addAttribute("config_websiteName", GsonUtils.fromJson(response.getJSONObject("data").toString(), Config.class));
        }
        //底部二维码
        response=WebUtils.doRawRequest(API.APP_CONFIG_GET,"{\"key\":\"bottomCode\"}",true);
        if(response.getBoolean("status")){
            model.addAttribute("config_bottomCode", GsonUtils.fromJson(response.getJSONObject("data").toString(), Config.class));
        }
        //网站描述
        response=WebUtils.doRawRequest(API.APP_CONFIG_GET,"{\"key\":\"websiteInfo\"}",true);
        if(response.getBoolean("status")){
            model.addAttribute("config_websiteInfo", GsonUtils.fromJson(response.getJSONObject("data").toString(), Config.class));
        }
        //客服二维码
        response=WebUtils.doRawRequest(API.APP_CONFIG_GET,"{\"key\":\"customerCode\"}",true);
        if(response.getBoolean("status")){
            model.addAttribute("config_customerCode", GsonUtils.fromJson(response.getJSONObject("data").toString(), Config.class));
        }

        //客服
        response= WebUtils.doRawRequest(API.APP_LINK_LIST,"{\"type\": {\"id\": 3}}",true);
        if(response.getBoolean("status")){
            model.addAttribute("config_kefu", GsonUtils.fromJson(response.getJSONObject("data").getJSONArray("list").toString(), new TypeToken<List<Link>>() {}.getType()));
        }
        //菜单
        response= WebUtils.doRawRequest(API.APP_LINK_LIST,"{\"type\": {\"id\": 1}}",true);
        if(response.getBoolean("status")){
            model.addAttribute("config_menu", GsonUtils.fromJson(response.getJSONObject("data").getJSONArray("list").toString(), new TypeToken<List<Link>>() {}.getType()));
        }

    }
}
