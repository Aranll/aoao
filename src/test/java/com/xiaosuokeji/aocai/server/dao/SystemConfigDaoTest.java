package com.xiaosuokeji.aocai.server.dao;

import com.xiaosuokeji.aocai.server.dao.system.SystemConfigDao;
import com.xiaosuokeji.aocai.server.model.system.SystemConfig;
import com.xiaosuokeji.framework.xsjframework.util.UuidUtil;
import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractTransactionalJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by xuxiaowei on 2017/9/7.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring.xml")
public class SystemConfigDaoTest implements SystemConfigDao {

    @Autowired
    private SystemConfigDao systemConfigDao;

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
        update(systemConfig);
        get(systemConfig);
        getByKey(systemConfig);
        list(systemConfig);
        count(systemConfig);
        remove(systemConfig);
    }

    @Override
    public int save(SystemConfig systemConfig) {
        int effects = systemConfigDao.save(systemConfig);
        Assert.assertEquals("Dao-SystemConfig-Save", 1, effects);
        return effects;
    }

    @Override
    public int remove(SystemConfig systemConfig) {
        int effects = systemConfigDao.remove(systemConfig);
        Assert.assertEquals("Dao-SystemConfig-Remove", 1, effects);
        return effects;
    }

    @Override
    public int update(SystemConfig systemConfig) {
        int effects = systemConfigDao.update(systemConfig);
        Assert.assertEquals("Dao-SystemConfig-Update", 1, effects);
        return effects;
    }

    @Override
    public SystemConfig get(SystemConfig systemConfig) {
        SystemConfig existent = systemConfigDao.get(systemConfig);
        Assert.assertNotNull("Dao-SystemConfig-Get", existent);
        return existent;
    }

    @Override
    public SystemConfig getByKey(SystemConfig systemConfig) {
        SystemConfig existent = systemConfigDao.getByKey(systemConfig);
        Assert.assertNotNull("Dao-SystemConfig-GetByKey", existent);
        return existent;
    }

    @Override
    public List<SystemConfig> list(SystemConfig systemConfig) {
        List<SystemConfig> existents = systemConfigDao.list(systemConfig);
        Assert.assertNotEquals("Dao-SystemConfig-List", 0, existents.size());
        return existents;
    }

    @Override
    public Long count(SystemConfig systemConfig) {
        Long count = systemConfigDao.count(systemConfig);
        Assert.assertNotEquals("Dao-SystemConfig-Count", 0, count.longValue());
        return count;
    }
}
