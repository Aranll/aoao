package com.xiaosuokeji.aocai.admin.controller.link;

import com.google.gson.reflect.TypeToken;
import com.xiaosuokeji.aocai.admin.annotation.Index;
import com.xiaosuokeji.aocai.admin.enumeration.API;
import com.xiaosuokeji.aocai.admin.model.resource.Type;
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
import java.util.List;

/**
 * Created by Aranl_lin on 2017/9/4.
 */
@Controller("adminLinkTypeController")
@RequestMapping(value = "admin/link")
public class LinkTypeController {

    @Autowired
    private SecurityTokenServer securityTokenServer;

    @RequestMapping(value = "/type",method = RequestMethod.GET)
    @Index
    public String index(Model model, HttpServletRequest request,Type type){
        JSONObject response = WebUtils.doRawRequest(API.LINK_TYPE_LIST,type);
        if(response.getBoolean("status")){
            JSONObject data = response.getJSONObject("data");
            model.addAttribute("types", GsonUtils.fromJson(data.getJSONArray("list").toString(),new TypeToken<List<Type>>() {}.getType()));
        }
        SecurityToken token=securityTokenServer.getToken();
        model.addAttribute("token",token);
        return "admin/link/linkType";
    }

    @RequestMapping(value = "/type/get",method = RequestMethod.POST)
    @ResponseBody
    public String getType(Model model, HttpServletRequest request, Type type){
        return WebUtils.doRawRequest(API.LINK_TYPE_GET,type).toString();
    }

    @RequestMapping(value = "/type/save",method = RequestMethod.POST)
    @ResponseBody
    public String saveType(Model model, HttpServletRequest request, Type type){
        return WebUtils.doRawRequest(API.LINK_TYPE_SAVE,type).toString();
    }

    @RequestMapping(value = "/type/update",method = RequestMethod.POST)
    @ResponseBody
    public String updateType(Model model, HttpServletRequest request, Type type){
        return WebUtils.doRawRequest(API.LINK_TYPE_UPDATE,type).toString();
    }
    @RequestMapping(value = "/type/remove",method = RequestMethod.POST)
    @ResponseBody
    public String removeType(Model model, HttpServletRequest request, Type type){
        return WebUtils.doRawRequest(API.LINK_TYPE_REMOVE,type).toString();
    }

    @RequestMapping(value="/type/combo/tree",method = RequestMethod.POST)
    @ResponseBody
    public String getTreeType(Type type){
        return WebUtils.doRawRequest(API.LINK_TYPE_COMBO,type).toString();
    }
}

