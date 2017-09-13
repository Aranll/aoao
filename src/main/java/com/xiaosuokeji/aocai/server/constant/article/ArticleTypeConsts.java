package com.xiaosuokeji.aocai.server.constant.article;

import com.xiaosuokeji.framework.xsjframework.model.StatusPair;

/**
 * 文章类型Constant<br/>
 * Created by xuxiaowei on 2017/8/25.
 */
public class ArticleTypeConsts {

    public static final StatusPair ARTICLE_TYPE_EXIST = StatusPair.build(700, "文章类型已存在");

    public static final StatusPair ARTICLE_TYPE_USED = StatusPair.build(701, "文章类型被使用");

    public static final StatusPair ARTICLE_TYPE_NOT_EXIST = StatusPair.build(702, "文章类型不存在");

    public static final StatusPair ARTICLE_TYPE_NOT_DELABLE = StatusPair.build(721, "默认文章类型不能删除");
}
