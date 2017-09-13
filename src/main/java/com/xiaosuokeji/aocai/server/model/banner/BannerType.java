package com.xiaosuokeji.aocai.server.model.banner;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xiaosuokeji.aocai.server.model.base.BaseModel;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * 轮播图类型<br/>
 * Created by xuxiaowei on 2017/8/26.
 */
public class BannerType extends BaseModel {

    /**
     * id
     */
    @NotNull(message = "类型id不能为空", groups = Banner.Save.class)
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
    private BannerType upType;

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
     * 可删除，0否，1是
     */
    @JsonIgnore
    private Integer delable;

    /**
     * 子级列表
     */
    private List<BannerType> children;

    public BannerType() {}

    public BannerType(Long id) {
        this.id = id;
    }

    public void addChild(BannerType bannerType) {
        if (this.children == null) {
            this.children = new ArrayList<>();
        }
        this.children.add(bannerType);
    }

    public void removeChild(BannerType bannerType) {
        if (this.children != null) {
            this.children.remove(bannerType);
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

    public BannerType getUpType() {
        return upType;
    }

    public void setUpType(BannerType upType) {
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

    public Integer getDelable() {
        return delable;
    }

    public void setDelable(Integer delable) {
        this.delable = delable;
    }

    public List<BannerType> getChildren() {
        return children;
    }

    public void setChildren(List<BannerType> children) {
        this.children = children;
    }
}
