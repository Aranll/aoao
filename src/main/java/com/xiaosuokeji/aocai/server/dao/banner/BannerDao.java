package com.xiaosuokeji.aocai.server.dao.banner;

import com.xiaosuokeji.aocai.server.model.banner.Banner;

import java.util.List;

/**
 * 轮播图Dao<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public interface BannerDao {

    /**
     * 保存轮播图
     * @param banner 必填：id，name，url，image，seq，type.id，showable
     * @return 受影响行数
     */
    int save(Banner banner);

    /**
     * 删除轮播图
     * @param banner 必填：id
     * @return 受影响行数
     */
    int remove(Banner banner);

    /**
     * 更新轮播图
     * @param banner 必填：id，可选更新项：name，url，image，seq，type.id，showable
     * @return 受影响行数
     */
    int update(Banner banner);

    /**
     * 获取单个轮播图
     * @param banner 必填：id
     * @return 轮播图，字段：所有，type.id，type.name
     */
    Banner get(Banner banner);

    /**
     * 获取多个轮播图<br/>
     * 支持排序和分页
     * @param banner 可选条件：id（支持模糊），name（支持模糊），type.id，showable
     * @return 轮播图列表，字段：所有，type.id，type.name
     */
    List<Banner> list(Banner banner);

    /**
     * 获取多个轮播图<br/>
     * 支持排序和分页
     * @param banner 可选条件：type.id
     * @return 轮播图列表，字段：id，name，url，image
     */
    List<Banner> listCombo(Banner banner);

    /**
     * 统计轮播图数量
     * @param banner 可选条件：id（支持模糊），name（支持模糊），type.id，showable
     * @return 轮播图数量
     */
    Long count(Banner banner);
}
