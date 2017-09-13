package com.xiaosuokeji.aocai.server.dao.banner;

import com.xiaosuokeji.aocai.server.model.banner.BannerType;

import java.util.List;

/**
 * 轮播图类型Dao<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
public interface BannerTypeDao {

    /**
     * 保存轮播图类型
     * @param bannerType 必填：name，upType.id，showable，seq
     * @return 受影响行数
     */
    int save(BannerType bannerType);

    /**
     * 删除轮播图类型
     * @param bannerType 必填：id
     * @return 受影响行数
     */
    int remove(BannerType bannerType);

    /**
     * 更新轮播图类型
     * @param bannerType 必填：id，可选更新项：name，upType.id，showable，seq
     * @return 受影响行数
     */
    int update(BannerType bannerType);

    /**
     * 更新轮播图类型上下架状态
     * @param bannerType 必填：showable，可选条件：children[i].id
     * @return 受影响行数
     */
    int updateShowable(BannerType bannerType);

    /**
     * 获取单个轮播图类型
     * @param bannerType 必填：id
     * @return 轮播图类型，字段：所有
     */
    BannerType get(BannerType bannerType);

    /**
     * 获取多个轮播图类型<br/>
     * 支持排序和分页
     * @param bannerType 可选条件：id，name（支持模糊），upType.id，showable
     * @return 轮播图类型列表，字段：所有
     */
    List<BannerType> list(BannerType bannerType);

    /**
     * 获取多个轮播图类型<br/>
     * 支持排序和分页
     * @param bannerType 可选条件：showable
     * @return 轮播图类型列表，字段：id，name，upType.id
     */
    List<BannerType> listCombo(BannerType bannerType);

    /**
     * 统计轮播图类型数量
     * @param bannerType 可选条件：id，name（支持模糊），upType.id，showable
     * @return 轮播图类型数量
     */
    Long count(BannerType bannerType);
}
