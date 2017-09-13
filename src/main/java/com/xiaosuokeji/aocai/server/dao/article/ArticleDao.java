package com.xiaosuokeji.aocai.server.dao.article;

import com.xiaosuokeji.aocai.server.model.article.Article;

import java.util.List;

/**
 * 文章Dao<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public interface ArticleDao {

    /**
     * 保存文章
     * @param article 必填：id，type.id，title，contentType，url，content，image，seq，showable
     * @return 受影响行数
     */
    int save(Article article);

    /**
     * 删除文章
     * @param article 必填：id
     * @return 受影响行数
     */
    int remove(Article article);

    /**
     * 更新文章
     * @param article 必填：id，可选更新项：type.id，title，contentType，url，content，image，seq，showable
     * @return 受影响行数
     */
    int update(Article article);

    /**
     * 获取单个文章
     * @param article 必填：id
     * @return 文章，字段：所有，type.id，type.name
     */
    Article get(Article article);

    /**
     * 获取多个文章<br/>
     * 支持排序和分页
     * @param article 可选条件：id（支持模糊），type.id，title（支持模糊），contentType，showable
     * @return 文章列表，字段：所有，type.id，type.name
     */
    List<Article> list(Article article);

    /**
     * 获取多个文章<br/>
     * 支持排序和分页
     * @param article 可选条件：type.id
     * @return 文章列表，字段：id，title
     */
    List<Article> listCombo(Article article);

    /**
     * 统计文章数量
     * @param article 可选条件：id（支持模糊），type.id，title（支持模糊），contentType，showable
     * @return 文章数量
     */
    Long count(Article article);
}
