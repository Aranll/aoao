package com.xiaosuokeji.aocai.server.model.link;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xiaosuokeji.aocai.server.model.base.BaseModel;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * 链接类型<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
public class LinkType extends BaseModel {

    /**
     * id
     */
    @NotNull(message = "类型id不能为空", groups = Link.Save.class)
    private Long id;

    /**
     * 名称
     */
    @NotNull(message = "名称不能为空", groups = Save.class)
    @Length(min = 1, max = 20, message = "名称长度为1-20个字符", groups = {Save.class, Update.class})
    private String name;

    /**
     * 上级，上级id为0表示无上级
     */
    private LinkType upType;

    /**
     * 上下架状态，0下架，1上架
     */
    @NotNull(message = "上下架状态不能为空", groups = Save.class)
    private Integer showable;

    /**
     * 顺序
     */
    @NotNull(message = "顺序不能为空", groups = Save.class)
    private Long seq;

    /**
     * 图标
     */
    @Length(max = 200, message = "图标长度至多为200个字符", groups = {Save.class, Update.class})
    private String icon;

    /**
     * 可删除，0否，1是
     */
    @JsonIgnore
    private Integer delable;

    /**
     * 子级列表
     */
    private List<LinkType> children;

    public LinkType() {}

    public LinkType(Long id) {
        this.id = id;
    }

    public void addChild(LinkType linkType) {
        if (this.children == null) {
            this.children = new ArrayList<>();
        }
        this.children.add(linkType);
    }

    public void removeChild(LinkType linkType) {
        if (this.children != null) {
            this.children.remove(linkType);
        }
    }

    public interface Save{}

    public interface Update{}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LinkType getUpType() {
        return upType;
    }

    public void setUpType(LinkType upType) {
        this.upType = upType;
    }

    public Integer getShowable() {
        return showable;
    }

    public void setShowable(Integer showable) {
        this.showable = showable;
    }

    public Long getSeq() {
        return seq;
    }

    public void setSeq(Long seq) {
        this.seq = seq;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public Integer getDelable() {
        return delable;
    }

    public void setDelable(Integer delable) {
        this.delable = delable;
    }

    public List<LinkType> getChildren() {
        return children;
    }

    public void setChildren(List<LinkType> children) {
        this.children = children;
    }
}
