package com.xiaosuokeji.aocai.server.constant.banner;

import com.xiaosuokeji.framework.xsjframework.model.StatusPair;

/**
 * 轮播图Constant<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public class BannerConsts {

    public static final StatusPair BANNER_EXIST = StatusPair.build(708, "轮播图已存在");

    public static final StatusPair BANNER_NOT_EXIST = StatusPair.build(709, "轮播图不存在");

    public static final StatusPair BANNER_NOT_DELABLE = StatusPair.build(724, "默认轮播图不能删除");
}
