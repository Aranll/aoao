package com.xiaosuokeji.aocai.server.constant.user;

import com.xiaosuokeji.framework.xsjframework.model.StatusPair;

/**
 * 员工Constant<br/>
 * Created by xuxiaowei on 2017/9/4.
 */
public class StaffConsts {

    public static final StatusPair STAFF_EXIST = StatusPair.build(717, "员工已存在");

    public static final StatusPair STAFF_NOT_EXIST = StatusPair.build(718, "员工不存在");

    public static final StatusPair PASSWORD_ERROR = StatusPair.build(719, "密码错误");

    public static final StatusPair STAFF_NOT_ENABLE = StatusPair.build(720, "员工被禁用");
}