package com.xiaosuokeji.aocai.server.dao.user;

import com.xiaosuokeji.aocai.server.model.user.Staff;

import java.util.List;

/**
 * 员工Dao<br/>
 * Created by xuxiaowei on 2017/9/4.
 */
public interface StaffDao {

    /**
     * 保存员工
     * @param staff 必填：username，password，name，mobile，status
     * @return 受影响行数
     */
    int save(Staff staff);

    /**
     * 删除员工
     * @param staff 必填：id
     * @return 受影响行数
     */
    int remove(Staff staff);

    /**
     * 更新员工
     * @param staff 必填：id，可选更新项：username，password，name，mobile，status
     * @return 受影响行数
     */
    int update(Staff staff);

    /**
     * 获取单个员工
     * @param staff 必填：id
     * @return 员工，字段：所有
     */
    Staff get(Staff staff);

    /**
     * 获取单个员工
     * @param staff 必填：username
     * @return 员工，字段：所有
     */
    Staff getByUsername(Staff staff);

    /**
     * 获取多个员工<br/>
     * 支持排序和分页
     * @param staff 可选条件：id，usename（支持模糊），name（支持模糊），mobile（支持模糊），status
     * @return 员工列表，字段：所有
     */
    List<Staff> list(Staff staff);

    /**
     * 统计员工数量
     * @param staff 可选条件：id，usename（支持模糊），name（支持模糊），mobile（支持模糊），status
     * @return 员工数量
     */
    Long count(Staff staff);
}
