package com.xiaosuokeji.aocai.admin.model.system;

import com.xiaosuokeji.aocai.admin.model.base.PaginationModel;

import java.util.Map;

/**
 * Created by Aranl_lin on 2017/9/5.
 */
public class Staff extends PaginationModel {

    /**
     * createTime : 2017-09-04 19:03:08
     * updateTime : 2017-09-05 10:47:30
     * id : 2
     * username : 管理员
     * password : e10adc3949ba59abbe56e057f20f883e
     * name : 张三
     * mobile : 11111111111
     * status : 1
     */

    private String createTime;
    private String updateTime;
    private Long id;
    private String username;
    private String password;
    private String name;
    private String mobile;
    private Integer status;
    private Map dynamic;

    public Map getDynamic() {
        return dynamic;
    }

    public void setDynamic(Map dynamic) {
        this.dynamic = dynamic;
    }

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(String createTime) {
        this.createTime = createTime;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }
}
