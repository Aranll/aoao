package com.xiaosuokeji.aocai.server.service.intf.banner;

import com.xiaosuokeji.aocai.server.model.banner.Banner;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;

/**
 * 轮播图Service<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public interface BannerService {

    /**
     * 保存轮播图
     * @param banner 必填：name，url，image，seq，type.id，showable
     * @throws BusinessException 轮播图已存在
     */
    void save(Banner banner) throws BusinessException;

    /**
     * 删除轮播图
     * @param banner 必填：id
     * @throws BusinessException 默认轮播图不能删除
     */
    void remove(Banner banner) throws BusinessException;

    /**
     * 更新轮播图
     * @param banner 必填：id，可选更新项：name，url，image，seq，type.id，showable
     * @throws BusinessException 轮播图已存在
     */
    void update(Banner banner) throws BusinessException;

    /**
     * 获取单个轮播图
     * @param banner 必填：id
     * @return 轮播图，字段：所有，type.id，type.name
     * @throws BusinessException 轮播图不存在
     */
    Banner get(Banner banner) throws BusinessException;

    /**
     * 获取和统计多个轮播图<br/>
     * 支持排序和分页
     * @param banner 可选条件：id（支持模糊），name（支持模糊），type.id，showable
     * @return 轮播图列表和数量，字段：所有，type.id，type.name
     */
    PageModel<Banner> listAndCount(Banner banner);

    /**
     * 获取和统计多个轮播图<br/>
     * 支持排序和分页
     * @param banner 可选条件：type.id
     * @return 轮播图列表和数量，字段：id，name，url，image
     */
    PageModel<Banner> listCombo(Banner banner);
}
