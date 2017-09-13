package com.xiaosuokeji.aocai.admin.enumeration;

import org.springframework.http.HttpMethod;

/**
 * Created by gustinlau on 04/09/2017.
 */
public enum API {

////    //  2.1 获取用户
//    WX_ACCESS_TOKEN_GET("https://api.weixin.qq.com/cgi-bin/token", HttpMethod.GET),

    //2.1新增文章类型
    ARTICLE_TYPE_SAVE("/api/admin/v1/article/type/save"),
    //   2.2删除文章类型
    ARTICLE_TYPE_REMOVE("/api/admin/v1/article/type/remove"),
    //    2.3更新文章类型
    ARTICLE_TYPE_UPDATE("/api/admin/v1/article/type/update"),
    //    2.4获取文章类型
    ARTICLE_TYPE_GET("/api/admin/v1/article/type/get"),
    //    2.5获取文章类型列表
    ARTICLE_TYPE_LIST("/api/admin/v1/article/type/list"),
    //    2.6获取文章类型组合
    ARTICLE_TYPE_COMBO_LIST("/api/admin/v1/article/type/combo/list"),
    //    2.7获取文章类型组合树
    ARTICLE_TYPE_COMBO("/api/admin/v1/article/type/combo"),
    //2.8新增文章
    ARTICLE_SAVE("/api/admin/v1/article/save"),
    //2.9删除文章
    ARTICLE_REMOVE("/api/admin/v1/article/remove"),
    //2.10更新文章
    ARTICLE_UPDATE("/api/admin/v1/article/update"),
    //2.11获取文章
    ARTICLE_GET("/api/admin/v1/article/get"),
    //2.12获取文章列表
    ARTICLE_LIST("/api/admin/v1/article/list"),

    //3.1 新增轮播图类型
    BANNER_TYPE_SAVE("/api/admin/v1/banner/type/save"),
    //3.2 删除轮播图类型
    BANNER_TYPE_REMOVE("/api/admin/v1/banner/type/remove"),
    //3.3 更新轮播图类型
    BANNER_TYPE_UPDATE("/api/admin/v1/banner/type/update"),
    //3.4 获取轮播图类型
    BANNER_TYPE_GET("/api/admin/v1/banner/type/get"),
    //3.5 获取轮播图类型列表
    BANNER_TYPE_LIST("/api/admin/v1/banner/type/list"),
    //3.6 获取轮播图类型组合
    BANNER_TYPE_COMBO("/api/admin/v1/banner/type/combo"),
    //3.7 新增轮播图
    BANNER_SAVE("/api/admin/v1/banner/save"),
    //3.8 删除轮播图
    BANNER_REMOVE("/api/admin/v1/banner/remove"),
    //3.9 更新轮播图
    BANNER_UPDATE("/api/admin/v1/banner/update"),
    //3.10 获取轮播图
    BANNER_GET("/api/admin/v1/banner/get"),
    //3.11 获取轮播图列表
    BANNER_LIST("/api/admin/v1/banner/list"),

    //    4.1 新增链接类型
    LINK_TYPE_SAVE("/api/admin/v1/link/type/save"),
    //            4.2 删除链接类型
    LINK_TYPE_REMOVE("/api/admin/v1/link/type/remove"),
    //            4.3 更新链接类型
    LINK_TYPE_UPDATE("/api/admin/v1/link/type/update"),
    //            4.4 取链接类型
    LINK_TYPE_GET("/api/admin/v1/link/type/get"),
    //4.5 获取链接类型列表
    LINK_TYPE_LIST("/api/admin/v1/link/type/list"),
    //            4.6 获取链接类型组合
    LINK_TYPE_COMBO("/api/admin/v1/link/type/combo"),
    //            4.7 新增链接
    LINK_SAVE("/api/admin/v1/link/save"),
    //            4.8 删除链接
    LINK_REMOVE("/api/admin/v1/link/remove"),
    //            4.9 更新链接
    LINK_UPDATE("/api/admin/v1/link/update"),
    //            4.10 获取链接
    LINK_GET("/api/admin/v1/link/get"),
    //            4.11 获取链接列表
    LINK_LIST("/api/admin/v1/link/list"),

    //    5.1 新增系统配置
    SYSTEM_CONFIG_SAVE("/api/admin/v1/system/config/save"),
    //    5.2 删除系统配置
    SYSTEM_CONFIG_REMOVE("/api/admin/v1/system/config/remove"),
    //    5.3 更新系统配置
    SYSTEM_CONFIG_UPDATE("/api/admin/v1/system/config/update"),
    //    5.4 获取系统配置
    SYSTEM_CONFIG_GET("/api/admin/v1/system/config/get"),
    //    5.5 获取系统配置列表
    SYSTEM_CONFIG_LIST("/api/admin/v1/system/config/list"),
    //    6.1 新增员工
    SYSTEM_STAFF_SAVE("/api/admin/v1/staff/save"),
    //    6.2 删除员工
    SYSTEM_STAFF_REMOVE("/api/admin/v1/staff/remove"),
    //    6.3 更新员工
    SYSTEM_STAFF_UPDATE("/api/admin/v1/staff/update"),
    //    6.4 获取员工
    SYSTEM_STAFF_GET("/api/admin/v1/staff/get"),
    //    6.5 获取员工列表
    SYSTEM_STAFF_LIST("/api/admin/v1/staff/list"),
    //    6.6 员工的登录
    SYSTEM_STAFF_LOGIN("/api/admin/v1/staff/login");

    private String url;
    private HttpMethod method;

    API(String url) {
        this.url = url;
        this.method = HttpMethod.POST;
    }

    API(String url, HttpMethod method) {
        this.url = url;
        this.method = method;
    }

    public String url() {
        return url;
    }

    public HttpMethod method() {
        return method;
    }
}
