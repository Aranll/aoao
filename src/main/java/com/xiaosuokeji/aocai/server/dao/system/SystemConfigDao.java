package com.xiaosuokeji.aocai.server.dao.system;

import com.xiaosuokeji.aocai.server.model.system.SystemConfig;

import java.util.List;

/**
 * 系统配置Dao<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public interface SystemConfigDao {

    /**
     * 保存系统配置
     * @param systemConfig 必填：id，name，value，configType
     * @return 受影响行数
     */
    int save(SystemConfig systemConfig);

    /**
     * 删除系统配置
     * @param systemConfig 必填：id
     * @return 受影响行数
     */
    int remove(SystemConfig systemConfig);

    /**
     * 更新系统配置
     * @param systemConfig 必填：id，可选更新项：name，value，configType
     * @return 受影响行数
     */
    int update(SystemConfig systemConfig);

    /**
     * 获取单个系统配置
     * @param systemConfig 必填：id
     * @return 系统配置，字段：所有
     */
    SystemConfig get(SystemConfig systemConfig);

    /**
     * 获取单个系统配置
     * @param systemConfig 必填：key
     * @return 系统配置，字段：所有
     */
    SystemConfig getByKey(SystemConfig systemConfig);

    /**
     * 获取多个系统配置<br/>
     * 支持排序和分页
     * @param systemConfig 可选条件：id（支持模糊），name（支持模糊），configType
     * @return 系统配置列表，字段：所有
     */
    List<SystemConfig> list(SystemConfig systemConfig);

    /**
     * 统计系统配置数量
     * @param systemConfig 可选条件：id（支持模糊），name（支持模糊），configType
     * @return 系统配置数量
     */
    Long count(SystemConfig systemConfig);
}