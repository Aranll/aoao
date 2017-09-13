package com.xiaosuokeji.aocai.server.service.intf.user;

import com.xiaosuokeji.aocai.server.model.user.Staff;
import com.xiaosuokeji.framework.xsjframework.exception.BusinessException;
import com.xiaosuokeji.framework.xsjframework.model.PageModel;

/**
 * 员工Service<br/>
 * Created by xuxiaowei on 2017/9/4.
 */
public interface StaffService {

    /**
     * 保存员工
     * @param staff 必填：username，password，name，mobile，status
     * @throws Exception 员工已存在
     */
    void save(Staff staff) throws Exception;

    /**
     * 删除员工
     * @param staff 必填：id
     * @return 受影响行数
     */
    void remove(Staff staff);

    /**
     * 更新员工
     * @param staff 必填：id，可选更新项：username，password，name，mobile，status
     * @throws BusinessException 员工已存在
     */
    void update(Staff staff) throws Exception;

    /**
     * 获取单个员工
     * @param staff 必填：id
     * @return 员工，字段：所有
     * @throws BusinessException 员工不存在
     */
    Staff get(Staff staff) throws BusinessException;

    /**
     * 获取单个员工
     * @param staff 必填：username
     * @return 员工，字段：所有
     * @throws BusinessException 员工不存在
     */
    Staff getByUsername(Staff staff) throws BusinessException;

    /**
     * 获取和统计多个员工<br/>
     * 支持排序和分页
     * @param staff 可选条件：id，usename（支持模糊），name（支持模糊），mobile（支持模糊），status
     * @return 员工列表和总数，字段：所有
     */
    PageModel<Staff> listAndCount(Staff staff);

    /**
     * 登录
     * @param staff 必填：username，password
     * @return 员工，字段：id，username，name，mobile，status
     * @throws BusinessException 员工不存在，密码错误，员工被禁用
     */
    Staff login(Staff staff) throws Exception;
}
