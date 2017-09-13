package com.xiaosuokeji.aocai.admin.controller;



import com.xiaosuokeji.aocai.admin.enumeration.API;
import com.xiaosuokeji.aocai.admin.model.system.Config;
import com.xiaosuokeji.aocai.admin.model.system.Staff;
import com.xiaosuokeji.aocai.admin.util.GsonUtils;
import com.xiaosuokeji.aocai.admin.util.WebUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

import static com.xiaosuokeji.aocai.admin.enumeration.API.SYSTEM_STAFF_LOGIN;

/**
 * Created by gustinlau on 04/08/2017.
 */
@Controller("adminLoginController")
@RequestMapping("/admin")
public class LoginController {

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletRequest request) {
        //logo
        JSONObject response = com.xiaosuokeji.aocai.home.util.WebUtils.doRawRequest(com.xiaosuokeji.aocai.home.enumeration.API.APP_CONFIG_GET, "{\"key\":\"websiteLogo\"}", true);
        if (response.getBoolean("status")) {
            request.getSession().setAttribute("config_logo", GsonUtils.fromJson(response.getJSONObject("data").toString(), Config.class));
        }
        return "admin/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String doLogin(HttpServletRequest request, Staff staff) {

        JSONObject result = WebUtils.doRawRequest(API.SYSTEM_STAFF_LOGIN, staff);
        if (result.getBoolean("status")) {
            request.getSession().setAttribute("session_staff", GsonUtils.fromJson(result.getJSONObject("data").toString(), Staff.class));
        }
        return result.toString();
    }

    @RequestMapping(value = "/logout",method = RequestMethod.POST)
    @ResponseBody
    public String logout(HttpServletRequest request){
        request.getSession().removeAttribute("token");
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("status",true);
        return jsonObject.toString();
    }
}
