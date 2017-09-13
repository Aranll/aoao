package com.xiaosuokeji.aocai.admin.controller.system;

import com.google.gson.reflect.TypeToken;
import com.xiaosuokeji.aocai.admin.annotation.Index;
import com.xiaosuokeji.aocai.admin.enumeration.API;
import com.xiaosuokeji.aocai.admin.model.system.Config;
import com.xiaosuokeji.aocai.admin.oss.model.SecurityToken;
import com.xiaosuokeji.aocai.admin.oss.server.SecurityTokenServer;
import com.xiaosuokeji.aocai.admin.util.GsonUtils;
import com.xiaosuokeji.aocai.admin.util.WebUtils;
import net.sf.json.JSON;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Aranl_lin on 2017/9/4.
 */
@Controller("adminConfigController")
@RequestMapping(value = "admin/system")
public class ConfigController {

    @Autowired
    private SecurityTokenServer securityTokenServer;

    @RequestMapping(value = "/config",method = RequestMethod.GET)
    @Index
    public String index(Model model, HttpServletRequest request, Config config){
        JSONObject response = WebUtils.doRawRequest(API.SYSTEM_CONFIG_LIST,config);
        if(response.getBoolean("status")){
            JSONObject data = response.getJSONObject("data");
            model.addAttribute("configs", GsonUtils.fromJson(data.getJSONArray("list").toString(),new TypeToken<List<Config>>() {}.getType()));
        }
        SecurityToken token=securityTokenServer.getToken();
        model.addAttribute("token",token);
        return "admin/system/config";
    }

    @RequestMapping(value = "/config/get",method = RequestMethod.POST)
    @ResponseBody
    public String getConfig(Model model, HttpServletRequest request, Config config){
        return WebUtils.doRawRequest(API.SYSTEM_CONFIG_GET,config).toString();
    }

    @RequestMapping(value = "/config/save",method = RequestMethod.POST)
    @ResponseBody
    public String saveConfig(Model model, HttpServletRequest request, Config config){
        return WebUtils.doRawRequest(API.SYSTEM_CONFIG_SAVE,config).toString();
    }

    @RequestMapping(value = "/config/update",method = RequestMethod.POST)
    @ResponseBody
    public String updateConfig(Model model, HttpServletRequest request, Config config){
        return WebUtils.doRawRequest(API.SYSTEM_CONFIG_UPDATE,config).toString();
    }
    @RequestMapping(value = "/config/remove",method = RequestMethod.POST)
    @ResponseBody
    public String removeConfig(Model model, HttpServletRequest request, Config config){
        return WebUtils.doRawRequest(API.SYSTEM_CONFIG_REMOVE,config).toString();
    }
}

