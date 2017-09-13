package com.xiaosuokeji.aocai.server.dao.link;

import com.xiaosuokeji.aocai.server.model.link.LinkType;

import java.util.List;

/**
 * 链接类型Dao<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
public interface LinkTypeDao {

    /**
     * 保存链接类型
     * @param linkType 必填：name，upType.id，showable，seq，icon
     * @return 受影响行数
     */
    int save(LinkType linkType);

    /**
     * 删除链接类型
     * @param linkType 必填：id
     * @return 受影响行数
     */
    int remove(LinkType linkType);

    /**
     * 更新链接类型
     * @param linkType 必填：id，可选更新项：name，upType.id，showable，seq，icon
     * @return 受影响行数
     */
    int update(LinkType linkType);

    /**
     * 更新链接类型上下架状态
     * @param linkType 必填：showable，可选条件：children[i].id
     * @return 受影响行数
     */
    int updateShowable(LinkType linkType);

    /**
     * 获取单个链接类型
     * @param linkType 必填：id
     * @return 链接类型，字段：所有
     */
    LinkType get(LinkType linkType);

    /**
     * 获取多个链接类型<br/>
     * 支持排序和分页
     * @param linkType 可选条件：id，name（支持模糊），upType.id，showable
     * @return 链接类型列表，字段：所有
     */
    List<LinkType> list(LinkType linkType);

    /**
     * 获取多个链接类型<br/>
     * 支持排序和分页
     * @param linkType 可选条件：showable
     * @return 链接类型列表，字段：id，name，icon
     */
    List<LinkType> listCombo(LinkType linkType);

    /**
     * 统计链接类型数量
     * @param linkType 可选条件：id，name（支持模糊），upType.id
     * @return 链接类型数量
     */
    Long count(LinkType linkType);
}
