package com.xiaosuokeji.aocai.server.service.intf.banner;

import com.xiaosuokeji.aocai.server.model.banner.BannerType;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;

import java.util.List;

/**
 * 轮播图Service<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
public interface BannerTypeService {

    /**
     * 保存轮播图类型
     * @param bannerType 必填：name，upType.id，showable，seq
     * @throws BusinessException 轮播图类型已存在
     */
    void save(BannerType bannerType) throws BusinessException;

    /**
     * 删除轮播图类型
     * @param bannerType 必填：id
     * @throws BusinessException 轮播图类型被使用
     */
    void remove(BannerType bannerType) throws BusinessException;

    /**
     * 更新轮播图类型
     * @param bannerType 必填：id，可选更新项：name，upType.id，showable，seq
     * @throws BusinessException 轮播图类型已存在
     */
    void update(BannerType bannerType) throws BusinessException;

    /**
     * 获取单个轮播图类型
     * @param bannerType 必填：id
     * @return 轮播图类型，字段：所有
     * @throws BusinessException 轮播图类型不存在
     */
    BannerType get(BannerType bannerType) throws BusinessException;

    /**
     * 获取和统计多个轮播图类型<br/>
     * 支持排序和分页
     * @param bannerType 可选条件：id，name（支持模糊），upType.id
     * @return 轮播图类型列表和数量，字段：所有
     */
    PageModel<BannerType> listAndCount(BannerType bannerType);

    /**
     * 获取多个轮播图类型<br/>
     * 以树状结构组织<br/>
     * 支持排序和分页
     * @param bannerType 可选条件：upType.id，showable
     * @return 轮播图类型列表，字段：id，name，upType.id，children
     */
    List<BannerType> listCombo(BannerType bannerType);
}
