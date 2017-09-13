package com.xiaosuokeji.aocai.server.constant.link;

import com.xiaosuokeji.framework.xsjframework.model.StatusPair;

/**
 * 链接类型Constant<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
public class LinkTypeConsts {

    public static final StatusPair LINK_TYPE_EXIST = StatusPair.build(710, "链接类型已存在");

    public static final StatusPair LINK_TYPE_USED = StatusPair.build(711, "链接类型被使用");

    public static final StatusPair LINK_TYPE_NOT_EXIST = StatusPair.build(712, "链接类型不存在");

    public static final StatusPair LINK_TYPE_NOT_DELABLE = StatusPair.build(725, "默认链接类型不能删除");
}
