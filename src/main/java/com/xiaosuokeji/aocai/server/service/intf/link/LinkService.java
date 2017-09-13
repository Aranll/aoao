package com.xiaosuokeji.aocai.server.service.intf.link;

import com.xiaosuokeji.aocai.server.model.link.Link;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;

/**
 * 链接Service<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public interface LinkService {

    /**
     * 保存链接
     * @param link 必填：name，type.id，url，image，seq，showable
     * @throws BusinessException 链接已存在
     */
    void save(Link link) throws BusinessException;

    /**
     * 删除链接
     * @param link 必填：id
     * @throws BusinessException 默认链接不能删除
     */
    void remove(Link link) throws BusinessException;

    /**
     * 更新链接
     * @param link 必填：id，可选更新项：name，type.id，url，image，seq，showable
     * @throws BusinessException 链接已存在
     */
    void update(Link link) throws BusinessException;

    /**
     * 获取单个链接
     * @param link 必填：id
     * @return 链接，字段：所有，type.id，type.name
     */
    Link get(Link link) throws BusinessException;

    /**
     * 获取和统计多个链接<br/>
     * 支持排序和分页
     * @param link 可选条件：id（支持模糊），name（支持模糊），type.id，showable
     * @return 链接列表和数量，字段：所有，type.id，type.name
     */
    PageModel<Link> listAndCount(Link link);

    /**
     * 获取多个链接<br/>
     * 支持排序和分页
     * @param link 可选条件：type.id
     * @return 链接列表，字段：id，name，url，image
     */
    PageModel<Link> listCombo(Link link);
}
