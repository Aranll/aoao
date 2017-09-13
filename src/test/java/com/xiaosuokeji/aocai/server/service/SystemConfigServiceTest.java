package com.xiaosuokeji.aocai.server.service;

import com.xiaosuokeji.aocai.server.constant.system.SystemConfigConsts;
import com.xiaosuokeji.aocai.server.model.system.SystemConfig;
import com.xiaosuokeji.aocai.server.service.intf.system.SystemConfigService;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;
import com.xiaosuokeji.framework.xsjframework.util.UuidUtil;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by xuxiaowei on 2017/9/7.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring.xml")
public class SystemConfigServiceTest implements SystemConfigService {

    @Autowired
    private SystemConfigService systemConfigService;

    @Test
    @Transactional
    public void test() {
        SystemConfig systemConfig = new SystemConfig();
        systemConfig.setId(UuidUtil.generate());
        systemConfig.setName("系统配置");
        systemConfig.setKey("systemConfig");
        systemConfig.setValue("enable");
        systemConfig.setConfigType(1);

        save(systemConfig);
    }

    @Override
    public void save(SystemConfig systemConfig) {
        try {
            systemConfigService.save(systemConfig);
        } catch (Exception e) {
            Assert.fail("Service-SystemConfig-Save");
        }
        try {
            systemConfigService.save(systemConfig);
        } catch (Exception e) {
            if (e instanceof BusinessException) {
                Assert.assertEquals("Service-SystemConfig-Save",
                        SystemConfigConsts.SYSTEM_CONFIG_EXIST.getCode().intValue(),
                        ((BusinessException) e).getStatusPair().getCode().intValue());
            }
            else {
                Assert.fail("Service-SystemConfig-Save");
            }
        }
    }

    @Override
    public void remove(SystemConfig systemConfig) {

    }

    @Override
    public void update(SystemConfig systemConfig) throws BusinessException {

    }

    @Override
    public SystemConfig get(SystemConfig systemConfig) throws BusinessException {
        return null;
    }

    @Override
    public SystemConfig getByKey(SystemConfig systemConfig) throws BusinessException {
        return null;
    }

    @Override
    public PageModel<SystemConfig> listAndCount(SystemConfig systemConfig) {
        return null;
    }
}
