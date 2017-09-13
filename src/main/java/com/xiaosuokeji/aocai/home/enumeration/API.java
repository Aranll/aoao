package com.xiaosuokeji.aocai.home.enumeration;

import org.springframework.http.HttpMethod;

/**
 * Created by gustinlau on 08/09/2017.
 */
public enum API {



    //   2.1 获取文章类型组合树
    APP_ARTICLE_TYPE_COMBO("/api/app/v1/article/type/combo"),
    //   2.2 获取文章
    APP_ARTICLE_GET("/api/app/v1/article/get"),
    //   2.3 获取文章列表
    APP_ARTICLE_LIST("/api/app/v1/article/list"),

    //   2.1 获取轮播图类型组合树
    APP_BANNER_TYPE_COMBO("/api/app/v1/banner/type/combo"),
    //   2.2 获取轮播图
    APP_BANNER_GET("/api/app/v1/banner/get"),
    //   2.3 获取轮播图列表
    APP_BANNER_LIST("/api/app/v1/banner/list"),

    //   3.1 获取链接类型组合树
    APP_LINK_TYPE_COMBO("/api/app/v1/link/type/combo/tree"),
    //   3.2 获取链接
    APP_LINK_GET("/api/app/v1/link/get"),
    //   3.3 获取链接列表
    APP_LINK_LIST("/api/app/v1/link/list"),

    //   4.1 获取系统配置
    APP_CONFIG_GET("/api/app/v1/system/config/get")

    ;

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
