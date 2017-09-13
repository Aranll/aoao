package com.xiaosuokeji.aocai.server.model.system;

import com.xiaosuokeji.aocai.server.model.base.BaseModel;
import com.xiaosuokeji.aocai.server.model.link.Link;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;

/**
 * 系统配置<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public class SystemConfig extends BaseModel {

    /**
     * id
     */
    private String id;

    /**
     * 名称
     */
    @NotNull(message = "名称不能为空", groups = Save.class)
    @Length(min = 1, max = 20, message = "名称长度为1-20个字符", groups = {Save.class, Update.class})
    private String name;

    /**
     * 键
     */
    @NotNull(message = "键不能为空", groups = Save.class)
    @Length(min = 1, max = 50, message = "键长度为1-50个字符", groups = {Save.class, Update.class})
    private String key;

    /**
     * 值
     */
    @NotNull(message = "值不能为空", groups = Link.Save.class)
    @Length(min = 1, max = 200, message = "值长度为1-200个字符", groups = {Save.class, Update.class})
    private String value;

    /**
     * 配置类型，0文本，1图片
     */
    @NotNull(message = "配置类型不能为空", groups = Save.class)
    private Integer configType;

    public interface Save{}

    public interface Update{}

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public Integer getConfigType() {
        return configType;
    }

    public void setConfigType(Integer configType) {
        this.configType = configType;
    }
}
