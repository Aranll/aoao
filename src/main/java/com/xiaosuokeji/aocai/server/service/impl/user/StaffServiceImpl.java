package com.xiaosuokeji.aocai.server.service.impl.user;

import com.xiaosuokeji.aocai.server.constant.user.StaffConsts;
import com.xiaosuokeji.aocai.server.dao.user.StaffDao;
import com.xiaosuokeji.aocai.server.model.user.Staff;
import com.xiaosuokeji.aocai.server.service.intf.user.StaffService;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;
import com.xiaosuokeji.framework.xsjframework.util.Md5Util;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 员工Service<br/>
 * Created by xuxiaowei on 2017/9/4.
 */
@Service
public class StaffServiceImpl implements StaffService {
    
    @Autowired
    private StaffDao staffDao;

    @Override
    public void save(Staff staff) throws Exception {
        Staff existent = new Staff();
        existent.setUsername(staff.getUsername());
        if (staffDao.count(existent).compareTo(0L) > 0) throw new BusinessException(StaffConsts.STAFF_EXIST);
        staff.setPassword(Md5Util.encode(staff.getPassword()));
        staffDao.save(staff);
    }

    @Override
    public void remove(Staff staff) {
        staffDao.remove(staff);
    }

    @Override
    public void update(Staff staff) throws Exception {
        if (!StringUtils.isBlank(staff.getUsername())) {
            Staff existent = new Staff();
            existent.setUsername(staff.getUsername());
            List<Staff> existents = staffDao.list(existent);
            if (existents.size() > 0) {
                boolean isSelf = existents.get(0).getId().equals(staff.getId());
                if (!isSelf) throw new BusinessException(StaffConsts.STAFF_EXIST);
            }
        }
        if (!StringUtils.isBlank(staff.getPassword())) {
            staff.setPassword(Md5Util.encode(staff.getPassword()));
        }
        staffDao.update(staff);
    }

    @Override
    public Staff get(Staff staff) throws BusinessException {
        Staff existent = staffDao.get(staff);
        if (existent == null) throw new BusinessException(StaffConsts.STAFF_NOT_EXIST);
        return existent;
    }

    @Override
    public Staff getByUsername(Staff staff) throws BusinessException {
        Staff existent = staffDao.getByUsername(staff);
        if (existent == null) throw new BusinessException(StaffConsts.STAFF_NOT_EXIST);
        return existent;
    }

    @Override
    public PageModel<Staff> listAndCount(Staff staff) {
        return PageModel.build(staffDao.list(staff), staffDao.count(staff));
    }

    @Override
    public Staff login(Staff staff) throws Exception {
        Staff existent = staffDao.getByUsername(staff);
        if (existent == null) {
            throw new BusinessException(StaffConsts.STAFF_NOT_EXIST);
        }
        if (!existent.getPassword().equals(Md5Util.encode(staff.getPassword()))) {
            throw new BusinessException(StaffConsts.PASSWORD_ERROR);
        }
        if (existent.getStatus().equals(0)) {
            throw new BusinessException(StaffConsts.STAFF_NOT_ENABLE);
        }
        existent.setPassword(null);
        return existent;
    }
}
