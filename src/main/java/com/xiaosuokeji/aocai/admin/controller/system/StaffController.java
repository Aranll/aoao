package com.xiaosuokeji.aocai.admin.controller.system;

import com.xiaosuokeji.aocai.admin.annotation.Index;
import com.xiaosuokeji.aocai.admin.annotation.Pagination;
import com.xiaosuokeji.aocai.admin.enumeration.API;
import com.xiaosuokeji.aocai.admin.model.system.Staff;
import com.xiaosuokeji.aocai.admin.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Aranl_lin on 2017/9/5.
 */
@Controller("adminStaffController")
@RequestMapping(value = "/admin/system/staff")
public class StaffController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    @Pagination(items = "staffs", api = API.SYSTEM_STAFF_LIST, itemClass = Staff.class)
    @Index
    public String index(Model model, HttpServletRequest request, Staff staff) {
        model.addAttribute("id", staff.getId());
        model.addAttribute("status", staff.getStatus());
        model.addAttribute("dynamic",staff.getDynamic());
        return "admin/system/staff";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public String create(Staff staff) {
        if(staff.getMobile()!=null&&staff.getMobile().length()==0){
            staff.setMobile(null);
        }
        return WebUtils.doRawRequest(API.SYSTEM_STAFF_SAVE, staff).toString();
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public String update(Staff staff) {
        if(staff.getPassword()!=null&&staff.getPassword().length()==0){
            staff.setPassword(null);
        }
        if(staff.getMobile()!=null&&staff.getMobile().length()==0){
            staff.setMobile(null);
        }
        return WebUtils.doRawRequest(API.SYSTEM_STAFF_UPDATE, staff).toString();
    }

    @RequestMapping(value = "/get", method = RequestMethod.POST)
    @ResponseBody
    public String find(Staff staff) {
        return WebUtils.doRawRequest(API.SYSTEM_STAFF_GET, staff).toString();
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    @ResponseBody
    public String delete(Staff staff) {
        return WebUtils.doRawRequest(API.SYSTEM_STAFF_REMOVE, staff).toString();
    }

}
