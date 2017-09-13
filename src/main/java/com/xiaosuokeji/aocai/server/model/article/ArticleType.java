package com.xiaosuokeji.aocai.server.model.article;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xiaosuokeji.aocai.server.model.base.BaseModel;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotNull;
import java.util.ArrayList;
import java.util.List;

/**
 * 文章类型<br/>
 * Created by xuxiaowei on 2017/8/24.
 */
public class ArticleType extends BaseModel {

    /**
     * id
     */
    @NotNull(message = "类型id不能为空", groups = Article.Save.class)
    private Long id;

    /**
     * 名称
     */
    @NotNull(message = "名称不能为空", groups = Save.class)
    @Length(min = 1, max = 20, message = "名称长度为1-20个字符", groups = {Save.class, Update.class})
    private String name;

    /**
     * 文章链接前缀
     */
    @NotNull(message = "文章链接前缀不能为空", groups = Save.class)
    @Length(min = 1, max = 200, message = "文章链接前缀长度为1-200个字符", groups = {Save.class, Update.class})
    private String urlPrefix;

    /**
     * 上级，上级id为0表示无上级
     */
    private ArticleType upType;

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
    @Length(max = 200, message = "图标长度至多为1-200个字符", groups = {Save.class, Update.class})
    private String icon;

    /**
     * 可删除，0否，1是
     */
    @JsonIgnore
    private Integer delable;

    /**
     * 子级列表
     */
    private List<ArticleType> children;

    public ArticleType() {}

    public ArticleType(Long id) {
        this.id = id;
    }

    public void addChild(ArticleType articleType) {
        if (this.children == null) {
            this.children = new ArrayList<>();
        }
        this.children.add(articleType);
    }

    public void removeChild(ArticleType articleType) {
        if (this.children != null) {
            this.children.remove(articleType);
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

    public String getUrlPrefix() {
        return urlPrefix;
    }

    public void setUrlPrefix(String urlPrefix) {
        this.urlPrefix = urlPrefix;
    }

    public ArticleType getUpType() {
        return upType;
    }

    public void setUpType(ArticleType upType) {
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

    public List<ArticleType> getChildren() {
        return children;
    }

    public void setChildren(List<ArticleType> children) {
        this.children = children;
    }
}
