package com.xiaosuokeji.aocai.server.service.intf.link;

import com.xiaosuokeji.aocai.server.model.link.LinkType;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;

import java.util.List;

/**
 * 链接类型Service<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
public interface LinkTypeService {

    /**
     * 保存链接类型
     * @param linkType 必填：name，upType.id，showable，seq，icon
     * @throws BusinessException 链接类型已存在
     */
    void save(LinkType linkType) throws BusinessException;

    /**
     * 删除链接类型
     * @param linkType 必填：id
     * @throws BusinessException 链接类型被使用，默认链接类型不能删除
     */
    void remove(LinkType linkType) throws BusinessException;

    /**
     * 更新链接类型
     * @param linkType 必填：id，可选更新项：name，upType.id，showable，seq，icon
     * @throws BusinessException 链接类型已存在
     */
    void update(LinkType linkType) throws BusinessException;

    /**
     * 获取单个链接类型
     * @param linkType 必填：id
     * @return 链接类型，字段：所有
     * @throws BusinessException 链接类型不存在
     */
    LinkType get(LinkType linkType) throws BusinessException;

    /**
     * 获取和统计多个链接类型<br/>
     * 支持排序和分页
     * @param linkType 可选条件：id，name（支持模糊），upType.id，showable
     * @return 链接类型列表和数量，字段：所有
     */
    PageModel<LinkType> listAndCount(LinkType linkType);

    /**
     * 获取多个链接类型<br/>
     * 支持排序和分页
     * @param linkType 可选条件：showable
     * @return 链接类型列表，字段：id，name，upType.id，icon，children
     */
    List<LinkType> listCombo(LinkType linkType);
}
