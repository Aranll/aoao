package com.xiaosuokeji.aocai.server.service.intf.article;

import com.xiaosuokeji.aocai.server.model.article.ArticleType;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;

import java.util.List;

/**
 * 文章类型Service<br/>
 * Created by xuxiaowei on 2017/8/25.
 */
public interface ArticleTypeService {

    /**
     * 保存文章类型
     * @param articleType 必填：name，urlPrefix，upType.id，seq，icon
     * @throws BusinessException 文章类型已存在
     */
    void save(ArticleType articleType) throws BusinessException;

    /**
     * 删除文章类型
     * @param articleType 必填：id
     * @throws BusinessException 文章类型被使用，默认文章类型不能删除
     */
    void remove(ArticleType articleType) throws BusinessException;

    /**
     * 更新文章类型
     * @param articleType 必填：id，可选更新项：name，urlPrefix，upType.id，showable，seq，icon
     * @throws BusinessException 文章类型已存在
     */
    void update(ArticleType articleType) throws BusinessException;

    /**
     * 获取单个文章类型
     * @param articleType 必填：id
     * @return 文章类型，字段：所有
     * @throws BusinessException 文章类型不存在
     */
    ArticleType get(ArticleType articleType) throws BusinessException;

    /**
     * 获取和统计多个文章类型<br/>
     * 支持排序和分页
     * @param articleType 可选条件：id，name（支持模糊），upType.id，showable
     * @return 文章类型列表和数量，字段：所有
     */
    PageModel<ArticleType> listAndCount(ArticleType articleType);

    /**
     * 获取多个文章类型<br/>
     * 以树状结构组织<br/>
     * 支持排序和分页
     * @param articleType 可选条件：upType.id，showable
     * @return 文章类型列表，字段：id，name，upType.id，icon，children
     */
    List<ArticleType> listCombo(ArticleType articleType);
}
