package com.xiaosuokeji.aocai.admin.controller.article;

import com.xiaosuokeji.aocai.admin.annotation.Index;
import com.xiaosuokeji.aocai.admin.annotation.Pagination;
import com.xiaosuokeji.aocai.admin.enumeration.API;
import com.xiaosuokeji.aocai.admin.model.article.Banner;
import com.xiaosuokeji.aocai.admin.oss.model.SecurityToken;
import com.xiaosuokeji.aocai.admin.oss.server.SecurityTokenServer;
import com.xiaosuokeji.aocai.admin.util.WebUtils;
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
@Controller("adminBannerController")
@RequestMapping(value = "admin/banner")
public class BannerController {

    @Autowired
    private SecurityTokenServer securityTokenServer;

    @RequestMapping(value = "/banner",method = RequestMethod.GET)
    @Pagination(items = "banners",api=API.BANNER_LIST,itemClass = Banner.class)
    @Index
    public String index(Model model, HttpServletRequest request,Banner banner){
        model.addAttribute("banner",banner);
        model.addAttribute("dynamic",banner.getDynamic());
        SecurityToken token=securityTokenServer.getToken();
        model.addAttribute("token",token);
        return "admin/banner/banner";
    }

    @RequestMapping(value = "/banner/save",method = RequestMethod.POST)
    @ResponseBody
    public String saveBanner(Model model, HttpServletRequest request, Banner banner){
        return WebUtils.doRawRequest(API.BANNER_SAVE,banner).toString();
    }

    @RequestMapping(value = "/banner/update",method = RequestMethod.POST)
    @ResponseBody
    public String updateBanner(Model model, HttpServletRequest request, Banner banner){
        if( banner.getUrl()!=null&&banner.getUrl().length()==0){
            banner.setUrl(null);
        }
        return WebUtils.doRawRequest(API.BANNER_UPDATE,banner).toString();
    }
    @RequestMapping(value = "/banner/remove",method = RequestMethod.POST)
    @ResponseBody
    public String removeBanner(Model model, HttpServletRequest request, Banner banner){
        return WebUtils.doRawRequest(API.BANNER_REMOVE,banner).toString();
    }
    @RequestMapping(value = "/banner/get",method = RequestMethod.POST)
    @ResponseBody
    public String getBanner(Model model, HttpServletRequest request, Banner banner){
        return WebUtils.doRawRequest(API.BANNER_GET,banner).toString();
    }

    @RequestMapping(value="/banner/combo/tree",method = RequestMethod.POST)
    @ResponseBody
    public String getTreeBanner(Banner banner){
        return WebUtils.doRawRequest(API.BANNER_TYPE_COMBO,banner).toString();
    }
}

