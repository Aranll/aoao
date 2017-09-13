package com.xiaosuokeji.aocai.home.aspect;

import com.xiaosuokeji.aocai.admin.util.GsonUtils;
import com.xiaosuokeji.aocai.home.annotation.Pagination;
import com.xiaosuokeji.aocai.home.model.PaginationModel;
import com.xiaosuokeji.aocai.home.util.WebUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by GustinLau on 2017-04-07.
 */
@Component("homePaginationAspect")
@Aspect
public class PaginationAspect {

    private static final String PAGE = "page";           //分页输出参数

    private static final String LAST = "尾页";
    private static final String FIRST = "首页";
    private static final String NEXT = "下一页";
    private static final String BEFORE = "上一页";

    private static final Long SHOW_PER_PAGE = 7L;              //最大可选页码
    private static final Long PAGE_SIDE = 2L;                  //最后两名可选页码


    @Pointcut("execution(* com.xiaosuokeji.aocai.home.controller.*.*(..))")
    public void aspect() {
    }

    @Around(value = "aspect()&&@annotation(pagination)")
    public Object pagination(ProceedingJoinPoint pjp, Pagination pagination) throws Throwable {

        //获取参数
        HttpServletRequest request = null;
        Model model = null;
        Object[] args = pjp.getArgs();
        PaginationModel paginationModel = null;
        for (Object arg : args) {
            if (arg instanceof Model) {
                model = (Model) arg;
                continue;
            }
            if (arg instanceof HttpServletRequest) {
                request = (HttpServletRequest) arg;
                continue;
            }
            if (arg instanceof PaginationModel) {
                paginationModel = (PaginationModel) arg;
            }
        }
        //参数检测
        if (model == null) {
            throw new Exception("方法使用了@Pagination注解却没有引入Model参数");
        }
        if (request == null) {
            throw new Exception("方法使用了@Pagination注解却没有引入HttpServletRequest参数");
        }
        if (paginationModel == null) {
            throw new Exception("方法使用了@Pagination注解却没有引入PaginationParams类型参数");
        }
        Object result = pjp.proceed();

        //获取分页值
        Long page, limit;

        page = paginationModel.getPage();

        limit = Long.parseLong(pagination.limit());
        paginationModel.setLimit(limit);
        //向接口发起请求
        JSONObject response;

        response = WebUtils.doRawRequest(pagination.api(), paginationModel);
        //检测返回数据
        if (!response.getBoolean("status")) {
            throw new Exception(response.getString("msg"));
        }

        JSONObject data = response.getJSONObject("data");

        //分页总数
        float total;
        long maxPage;
        total = Float.parseFloat(data.get("total").toString());
        maxPage = (int) Math.ceil(total / limit);

        //当页数超出时需要再次请求
        if (maxPage > 0 && page > maxPage) {
            paginationModel.setPage(maxPage);

            //向接口发起请求
            response = WebUtils.doRawRequest(pagination.api(), paginationModel);
            data = response.getJSONObject("data");
            //分页总数
            total = Float.parseFloat(data.get("total").toString());
            maxPage = (int) Math.ceil(total / limit);
        }

        model.addAttribute(pagination.items() + "_total", (int) total);
        JSONArray list = data.getJSONArray("list");
        List resultList = new ArrayList();
        for (Object obj : list) {
            resultList.add(GsonUtils.objectFromJson(obj.toString(),pagination.itemClass()));
        }
        model.addAttribute(pagination.items(), resultList);
        model.addAttribute("listTotal",data.get("total"));
        model.addAttribute("maxPage",maxPage);
        model.addAttribute("currentPage",paginationModel.getPage());
        //确定分页
        if (maxPage > 1) {
            model.addAttribute("isPagination", true);
            String url = request.getRequestURL().toString() + "?";

            String queryString = parmasMap2String(request);

            String first;
            if (page <= 1) {
                first = "<li class=\"disabled\"><a title=\"" + FIRST + "\">"+FIRST+"</a></li>" +
                        "<li class=\"disabled\"><a title=\"" + BEFORE + "\">"+BEFORE+"</a></li>";
            } else {
                first = "<li><a href=\"" + url + PAGE + "=1" + queryString + "\">" + FIRST + "</a></li>" +
                        "<li><a href=\"" + url + PAGE + "=" + String.valueOf(page - 1) + queryString + "\"  title=\"" + BEFORE + "\">"+BEFORE+"</a></li>";
            }

            String last;
            if (page >= maxPage) {
                last = "<li class=\"disabled\"><a title=\"" + NEXT + "\">"+NEXT+"</a></li>" +
                        "<li class=\"disabled\"><a title=\"" + LAST + "\">"+LAST+"</a></li>";
            } else {
                last = "<li><a href=\"" + url + PAGE + "=" + String.valueOf(page + 1) + queryString + "\" title=\"" + NEXT + "\">"+ NEXT +"</a></li>" +
                        "<li><a href=\"" + url + PAGE + "=" + maxPage + queryString + "\" title=\"" + LAST + "\">"+ LAST +"</a></li>";
            }

            StringBuilder center = new StringBuilder();
            if (maxPage <= SHOW_PER_PAGE) {
                for (long i = 1; i <= maxPage; i++) {
                    if (i == page)
                        center.append("<li class=\"active\" ><a>").append(String.valueOf(i)).append("</a></li>");
                    else
                        center.append("<li><a href=\"").append(url).append(PAGE).append("=").append(String.valueOf(i)).append(queryString).append("\">").append(String.valueOf(i)).append("</a></li>");
                }
            } else {
                if (page >= SHOW_PER_PAGE && (maxPage - page) >= SHOW_PER_PAGE) {
                    center = new StringBuilder("<li><a>...</a></li>");
                    for (long i = page - PAGE_SIDE; i <= page + PAGE_SIDE; i++) {
                        if (i == page)
                            center.append("<li class=\"active\" ><a title=\"第").append(i).append("页\">").append(String.valueOf(i)).append("</a></li>");
                        else
                            center.append("<li><a href=\"").append(url).append(PAGE).append("=").append(String.valueOf(i)).append(queryString).append("\" title=\"第").append(i).append("页\">").append(String.valueOf(i)).append("</a></li>");
                    }
                    center.append("<li><a>...</a></li>");
                } else if (page >= SHOW_PER_PAGE) {
                    center = new StringBuilder("<li><a>...</a></li>");
                    for (long i = maxPage - SHOW_PER_PAGE; i <= maxPage; i++) {
                        if (i == page)
                            center.append("<li class=\"active\" ><a title=\"第").append(i).append("页\">").append(String.valueOf(i)).append("</a></li>");
                        else
                            center.append("<li><a href=\"").append(url).append(PAGE).append("=").append(String.valueOf(i)).append(queryString).append("\" title=\"第").append(i).append("页\">").append(String.valueOf(i)).append("</a></li>");
                    }
                } else {
                    for (int i = 1; i <= SHOW_PER_PAGE; i++) {
                        if (i == page)
                            center.append("<li class=\"active\" ><a title=\"第").append(i).append("页\">").append(String.valueOf(i)).append("</a></li>");
                        else
                            center.append("<li><a href=\"").append(url).append(PAGE).append("=").append(String.valueOf(i)).append(queryString).append("\" title=\"第").append(i).append("页\">").append(String.valueOf(i)).append("</a></li>");
                    }
                    center.append("<li><a>...</a></li>");
                }
            }
            model.addAttribute("pagination", first + center + last);
        } else {
            model.addAttribute("isPagination", false);
        }

        return result;
    }

    private String parmasMap2String(HttpServletRequest request) {
        Map<String, String[]> params = request.getParameterMap();
        StringBuilder str = new StringBuilder();
        for (Map.Entry<String, String[]> entry : params.entrySet()) {
            if (entry.getKey().equals(PAGE))
                continue;
            str.append("&").append(entry.getKey()).append("=").append(entry.getValue()[0]);
        }
        return "" + str;
    }
}
