package com.xiaosuokeji.aocai.server.constant.banner;

import com.xiaosuokeji.framework.xsjframework.model.StatusPair;

/**
 * 轮播图Constant<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
public class BannerTypeConsts {

    public static final StatusPair BANNER_TYPE_EXIST = StatusPair.build(705, "轮播图类型已存在");

    public static final StatusPair BANNER_TYPE_USED = StatusPair.build(706, "轮播图类型被使用");

    public static final StatusPair BANNER_TYPE_NOT_EXIST = StatusPair.build(707, "轮播图类型不存在");

    public static final StatusPair BANNER_TYPE_NOT_DELABLE = StatusPair.build(723, "默认轮播图类型不能删除");
}
