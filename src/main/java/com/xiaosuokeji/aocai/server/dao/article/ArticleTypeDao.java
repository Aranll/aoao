package com.xiaosuokeji.aocai.server.dao.article;

import com.xiaosuokeji.aocai.server.model.article.ArticleType;

import java.util.List;

/**
 * 文章类型Dao<br/>
 * Created by xuxiaowei on 2017/8/24.
 */
public interface ArticleTypeDao {

    /**
     * 保存文章类型
     * @param articleType 必填：name，urlPrefix，upType.id，showable，seq，icon
     * @return 受影响行数
     */
    int save(ArticleType articleType);

    /**
     * 删除文章类型
     * @param articleType 必填：id
     * @return 受影响行数
     */
    int remove(ArticleType articleType);

    /**
     * 更新文章类型
     * @param articleType 必填：id，可选更新项：name，urlPrefix，upType.id，showable，seq，icon
     * @return 受影响行数
     */
    int update(ArticleType articleType);

    /**
     * 更新文章类型上下架状态
     * @param articleType 必填：showable，可选条件：children[i].id
     * @return 受影响行数
     */
    int updateShowable(ArticleType articleType);

    /**
     * 获取单个文章类型
     * @param articleType 必填：id
     * @return 文章类型，字段：所有
     */
    ArticleType get(ArticleType articleType);

    /**
     * 获取多个文章类型<br/>
     * 支持排序和分页
     * @param articleType 可选条件：id，name（支持模糊），upType.id，showable
     * @return 文章类型列表，字段：所有
     */
    List<ArticleType> list(ArticleType articleType);

    /**
     * 获取多个文章类型<br/>
     * 支持排序和分页
     * @param articleType 可选条件：showable
     * @return 文章类型列表，字段：id，name，upType.id，icon
     */
    List<ArticleType> listCombo(ArticleType articleType);

    /**
     * 统计文章类型数量
     * @param articleType 可选条件：id，name（支持模糊），upType.id，showable
     * @return 文章类型数量
     */
    Long count(ArticleType articleType);
}
