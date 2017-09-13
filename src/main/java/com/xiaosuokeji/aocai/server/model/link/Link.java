package com.xiaosuokeji.aocai.server.model.link;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xiaosuokeji.aocai.server.model.base.BaseModel;
import org.hibernate.validator.constraints.Length;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 * 链接<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public class Link extends BaseModel {

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
     * 类型
     */
    @NotNull(message = "类型不能为空", groups = Save.class)
    @Valid
    private LinkType type;

    /**
     * 链接
     */
    @NotNull(message = "链接不能为空", groups = Save.class)
    @Length(min = 1, max = 200, message = "链接长度为1-200个字符", groups = {Save.class, Update.class})
    private String url;

    /**
     * 图片
     */
    @Length(min = 1, max = 200, message = "图片长度为1-200个字符", groups = {Save.class, Update.class})
    private String image;

    /**
     * 顺序
     */
    @NotNull(message = "顺序不能为空", groups = Save.class)
    private Long seq;

    /**
     * 前端展示，0否，1是
     */
    @NotNull(message = "前端展示不能为空", groups = Save.class)
    private Integer showable;

    /**
     * 可删除，0否，1是
     */
    @JsonIgnore
    private Integer delable;

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

    public LinkType getType() {
        return type;
    }

    public void setType(LinkType type) {
        this.type = type;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Long getSeq() {
        return seq;
    }

    public void setSeq(Long seq) {
        this.seq = seq;
    }

    public Integer getShowable() {
        return showable;
    }

    public void setShowable(Integer showable) {
        this.showable = showable;
    }

    public Integer getDelable() {
        return delable;
    }

    public void setDelable(Integer delable) {
        this.delable = delable;
    }
}
