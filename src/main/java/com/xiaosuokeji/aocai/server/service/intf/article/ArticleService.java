package com.xiaosuokeji.aocai.server.service.intf.article;

import com.xiaosuokeji.aocai.server.model.article.Article;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;

/**
 * 文章Service<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public interface ArticleService {

    /**
     * 保存文章
     * @param article 必填：type.id，title，contentType，url，content，image，seq，showable
     * @throws BusinessException 文章已存在
     */
    void save(Article article) throws BusinessException;

    /**
     * 删除文章
     * @param article 必填：id
     * @throws BusinessException 默认文章不能删除
     */
    void remove(Article article) throws BusinessException;

    /**
     * 更新文章
     * @param article 必填：id，可选更新项：type.id，title，contentType，url，content，image，seq，showable
     * @throws BusinessException 文章已存在
     */
    void update(Article article) throws BusinessException;

    /**
     * 获取单个文章
     * @param article 必填：id
     * @return 文章，字段：所有，type.id，type.name
     * @throws BusinessException 文章不存在
     */
    Article get(Article article) throws BusinessException;

    /**
     * 获取和统计多个文章<br/>
     * 支持排序和分页
     * @param article 可选条件：id（支持模糊），type.id，title（支持模糊），contentType，showable
     * @return 文章列表和数量，字段：所有，type.id，type.name
     */
    PageModel<Article> listAndCount(Article article);

    /**
     * 获取和统计多个文章<br/>
     * 支持排序和分页
     * @param article 可选条件：type.id
     * @return 文章列表和数量，字段：id，title
     */
    PageModel<Article> listCombo(Article article);
}
