package com.xiaosuokeji.aocai.admin.controller.link;

import com.xiaosuokeji.aocai.admin.annotation.Index;
import com.xiaosuokeji.aocai.admin.annotation.Pagination;
import com.xiaosuokeji.aocai.admin.enumeration.API;
import com.xiaosuokeji.aocai.admin.model.link.Link;
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
@Controller("adminLinkController")
@RequestMapping(value = "admin/link")
public class LinkController {
    @Autowired
    private SecurityTokenServer securityTokenServer;

    @RequestMapping(value = "/link",method = RequestMethod.GET)
    @Pagination(items = "links",api=API.LINK_LIST,itemClass = Link.class)
    @Index
    public String index(Model model, HttpServletRequest request, Link link){
        model.addAttribute("link",link);
        model.addAttribute("dynamic",link.getDynamic());
        SecurityToken token=securityTokenServer.getToken();
        model.addAttribute("token",token);
        return "admin/link/link";
    }

    @RequestMapping(value = "/link/save",method = RequestMethod.POST)
    @ResponseBody
    public String saveLink(Link link){
        if(link.getImage()!=null&&link.getImage().length()==0){
            link.setImage(null);
        }
        if(link.getUrl()!=null&&link.getUrl().length()==0){
            link.setUrl(null);
        }
        return WebUtils.doRawRequest(API.LINK_SAVE,link).toString();
    }

    @RequestMapping(value = "/link/update",method = RequestMethod.POST)
    @ResponseBody
    public String updateLink(Link link){
        if( link.getUrl()!=null&&link.getUrl().length()==0){
            link.setUrl(null);
        }
        return WebUtils.doRawRequest(API.LINK_UPDATE,link).toString();
    }
    @RequestMapping(value = "/link/remove",method = RequestMethod.POST)
    @ResponseBody
    public String removeLink(Link link){
        return WebUtils.doRawRequest(API.LINK_REMOVE,link).toString();
    }
    @RequestMapping(value = "/link/get",method = RequestMethod.POST)
    @ResponseBody
    public String getLink(Link link){
        return WebUtils.doRawRequest(API.LINK_GET,link).toString();
    }

    @RequestMapping(value="/link/combo/tree",method = RequestMethod.POST)
    @ResponseBody
    public String getTreeLink(Link link){
        return WebUtils.doRawRequest(API.LINK_TYPE_COMBO,link).toString();
    }
}

