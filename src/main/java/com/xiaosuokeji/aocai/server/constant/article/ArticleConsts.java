package com.xiaosuokeji.aocai.server.constant.article;

import com.xiaosuokeji.framework.xsjframework.model.StatusPair;

/**
 * 文章Constant<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public class ArticleConsts {

    public static final StatusPair ARTICLE_EXIST = StatusPair.build(703, "文章已存在");

    public static final StatusPair ARTICLE_NOT_EXIST = StatusPair.build(704, "文章不存在");

    public static final StatusPair ARTICLE_NOT_DELABLE = StatusPair.build(722, "默认文章不能删除");
}
