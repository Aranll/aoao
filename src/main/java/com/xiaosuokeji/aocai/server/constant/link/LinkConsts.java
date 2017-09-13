package com.xiaosuokeji.aocai.server.constant.link;

import com.xiaosuokeji.framework.xsjframework.model.StatusPair;

/**
 * 链接Constant<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public class LinkConsts {

    public static final StatusPair LINK_EXIST = StatusPair.build(713, "链接已存在");

    public static final StatusPair LINK_NOT_EXIST = StatusPair.build(714, "链接不存在");

    public static final StatusPair LINK_NOT_DELABLE = StatusPair.build(727, "默认链接不能删除");
}
