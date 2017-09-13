package com.xiaosuokeji.aocai.server.model.user;

import com.xiaosuokeji.aocai.server.model.base.BaseModel;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * 员工<br/>
 * Created by xuxiaowei on 2017/9/4.
 */
public class Staff extends BaseModel {

    /**
     * id
     */
    private Long id;

    /**
     * 用户名
     */
    @NotNull(message = "用户名不能为空", groups = Save.class)
    @Length(min = 1, max = 20, message = "用户名长度为1-20个字符", groups = {Save.class, Update.class, Login.class})
    private String username;

    /**
     * 密码
     */
    @NotNull(message = "密码不能为空", groups = Save.class)
    @Length(min = 1, max = 20, message = "密码长度为1-20个字符", groups = {Save.class, Update.class, Login.class})
    private String password;

    /**
     * 姓名
     */
    @NotNull(message = "姓名不能为空", groups = Save.class)
    @Length(min = 1, max = 20, message = "姓名长度为1-20个字符", groups = {Save.class, Update.class})
    private String name;

    /**
     * 手机号
     */
    @Pattern(regexp = "^1[0-9]{10}$", message = "手机号格式为11位数字且第一位为1", groups = {Save.class, Update.class})
    private String mobile;

    /**
     * 状态，0禁用，1正常
     */
    @NotNull(message = "状态不能为空", groups = Save.class)
    private Integer status;

    public interface Save {}

    public interface Update {}

    public interface Login {}

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
