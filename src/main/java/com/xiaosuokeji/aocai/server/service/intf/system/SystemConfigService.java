package com.xiaosuokeji.aocai.server.service.intf.system;

import com.xiaosuokeji.aocai.server.model.system.SystemConfig;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;

/**
 * 系统配置Service<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public interface SystemConfigService {

    /**
     * 保存系统配置
     * @param systemConfig 必填：name，value，configType
     * @throws BusinessException 系统配置已存在
     */
    void save(SystemConfig systemConfig) throws BusinessException;

    /**
     * 删除系统配置
     * @param systemConfig 必填：id
     */
    void remove(SystemConfig systemConfig);

    /**
     * 更新系统配置
     * @param systemConfig 必填：id，可选更新项：name，value，configType
     * @throws BusinessException 系统配置已存在
     */
    void update(SystemConfig systemConfig) throws BusinessException;

    /**
     * 获取单个系统配置
     * @param systemConfig 必填：id
     * @return 系统配置，字段：所有
     */
    SystemConfig get(SystemConfig systemConfig) throws BusinessException;

    /**
     * 获取单个系统配置
     * @param systemConfig 必填：key
     * @return 系统配置，字段：所有
     */
    SystemConfig getByKey(SystemConfig systemConfig) throws BusinessException;

    /**
     * 获取和统计多个系统配置<br/>
     * 支持排序和分页
     * @param systemConfig 可选条件：id（支持模糊），name（支持模糊），configType
     * @return 系统配置列表和数量，字段：所有
     */
    PageModel<SystemConfig> listAndCount(SystemConfig systemConfig);
}
