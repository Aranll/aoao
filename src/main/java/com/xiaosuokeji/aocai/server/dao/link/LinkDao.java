package com.xiaosuokeji.aocai.server.dao.link;

import com.xiaosuokeji.aocai.server.model.link.Link;

import java.util.List;

/**
 * 链接Dao<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public interface LinkDao {

    /**
     * 保存链接
     * @param link 必填：id，name，type.id，url，image，seq，showable
     * @return 受影响行数
     */
    int save(Link link);

    /**
     * 删除链接
     * @param link 必填：id
     * @return 受影响行数
     */
    int remove(Link link);

    /**
     * 更新链接
     * @param link 必填：id，可选更新项：name，type.id，url，image，seq，showable
     * @return 受影响行数
     */
    int update(Link link);

    /**
     * 获取单个链接
     * @param link 必填：id
     * @return 链接，字段：所有，type.id，type.name
     */
    Link get(Link link);

    /**
     * 获取多个链接<br/>
     * 支持排序和分页
     * @param link 可选条件：id（支持模糊），name（支持模糊），type.id，showable
     * @return 链接列表，字段：所有，type.id，type.name
     */
    List<Link> list(Link link);

    /**
     * 获取多个链接<br/>
     * 支持排序和分页
     * @param link 可选条件：type.id
     * @return 链接列表，字段：id，name，url，image
     */
    List<Link> listCombo(Link link);

    /**
     * 统计链接数量
     * @param link 可选条件：id（支持模糊），name（支持模糊），type.id，showable
     * @return 链接数量
     */
    Long count(Link link);
}
