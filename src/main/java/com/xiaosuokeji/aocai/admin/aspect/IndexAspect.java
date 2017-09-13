package com.xiaosuokeji.aocai.admin.aspect;

import com.xiaosuokeji.aocai.admin.annotation.Index;
import com.xiaosuokeji.aocai.admin.util.GsonUtils;
import com.xiaosuokeji.aocai.home.enumeration.API;
import com.xiaosuokeji.aocai.home.model.Config;
import com.xiaosuokeji.aocai.home.util.WebUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.json.JSONObject;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by gustinlau on 08/06/2017.
 */
@Component("adminIndexAspect")
@Aspect
@Order(2)
public class IndexAspect {
    @Pointcut("execution(* com.xiaosuokeji.aocai.admin.controller.*.*(..))||execution(* com.xiaosuokeji.aocai.admin.controller.*.*.*(..))")
    public void aspect() {
    }

    @Around(value = "aspect()&&@annotation(index)")
    public Object index(ProceedingJoinPoint pjp, Index index) throws Throwable {

        Object result = pjp.proceed();

        HttpServletRequest request = null;

        Object[] args = pjp.getArgs();
        for (Object arg : args) {
            if (arg instanceof HttpServletRequest) {
                request = (HttpServletRequest) arg;
                break;
            }
        }
        if (request == null) {
            throw new Exception("方法使用了@Index注解却没有引入HttpServletRequest参数");
        }

        //logo
        JSONObject response= WebUtils.doRawRequest(API.APP_CONFIG_GET,"{\"key\":\"websiteLogo\"}",true);
        if(response.getBoolean("status")){
            request.getSession().setAttribute("config_logo", GsonUtils.fromJson(response.getJSONObject("data").toString(), Config.class));
        }

        HttpSession session = request.getSession();
        if (session.getAttribute("session_staff") == null) {
            return "redirect:/admin/login";
        } else {
            return result;
        }
    }
}
