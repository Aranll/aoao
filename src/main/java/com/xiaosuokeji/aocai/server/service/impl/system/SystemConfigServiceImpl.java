package com.xiaosuokeji.aocai.server.service.impl.system;

import com.xiaosuokeji.aocai.server.constant.system.SystemConfigConsts;
import com.xiaosuokeji.aocai.server.dao.system.SystemConfigDao;
import com.xiaosuokeji.aocai.server.model.system.SystemConfig;
import com.xiaosuokeji.aocai.server.service.intf.system.SystemConfigService;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;
import com.xiaosuokeji.framework.xsjframework.util.UuidUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 系统配置ServiceImpl<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
@Service
public class SystemConfigServiceImpl implements SystemConfigService {

    @Autowired
    private SystemConfigDao systemConfigDao;

    @Override
    public void save(SystemConfig systemConfig) throws BusinessException {
        SystemConfig existent = new SystemConfig();
        existent.setKey(systemConfig.getKey());
        if (systemConfigDao.count(existent).compareTo(0L) > 0) throw new BusinessException(SystemConfigConsts.SYSTEM_CONFIG_EXIST);
        systemConfig.setId(UuidUtil.generate());
        systemConfigDao.save(systemConfig);
    }

    @Override
    public void remove(SystemConfig systemConfig) {
        systemConfigDao.remove(systemConfig);
    }

    @Override
    public void update(SystemConfig systemConfig) throws BusinessException {
        if (!StringUtils.isBlank(systemConfig.getKey())) {
            SystemConfig existent = new SystemConfig();
            existent.setKey(systemConfig.getKey());
            List<SystemConfig> existents = systemConfigDao.list(existent);
            if (existents.size() > 0) {
                boolean isSelf = existents.get(0).getId().equals(systemConfig.getId());
                if (!isSelf) throw new BusinessException(SystemConfigConsts.SYSTEM_CONFIG_EXIST);
            }
        }
        systemConfigDao.update(systemConfig);
    }

    @Override
    public SystemConfig get(SystemConfig systemConfig) throws BusinessException {
        SystemConfig existent = systemConfigDao.get(systemConfig);
        if (existent == null) throw new BusinessException(SystemConfigConsts.SYSTEM_CONFIG_NOT_EXIST);
        return existent;
    }

    @Override
    public SystemConfig getByKey(SystemConfig systemConfig) throws BusinessException {
        SystemConfig existent = systemConfigDao.getByKey(systemConfig);
        if (existent == null) throw new BusinessException(SystemConfigConsts.SYSTEM_CONFIG_NOT_EXIST);
        return existent;
    }

    @Override
    public PageModel<SystemConfig> listAndCount(SystemConfig systemConfig) {
        return PageModel.build(systemConfigDao.list(systemConfig), systemConfigDao.count(systemConfig));
    }
}
