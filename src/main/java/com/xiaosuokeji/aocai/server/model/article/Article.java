package com.xiaosuokeji.aocai.server.model.article;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.xiaosuokeji.aocai.server.model.base.BaseModel;
import org.hibernate.validator.constraints.Length;

import javax.validation.Valid;
import javax.validation.constraints.NotNull;

/**
 * 文章<br/>
 * Created by xuxiaowei on 2017/8/28.
 */
public class Article extends BaseModel {

    /**
     * id
     */
    private String id;

    /**
     * 文章类型
     */
    @NotNull(message = "类型不能为空", groups = Save.class)
    @Valid
    private ArticleType type;

    /**
     * 标题
     */
    @NotNull(message = "标题不能为空", groups = Save.class)
    @Length(min = 1, max = 50, message = "标题长度为1-50个字符", groups = {Save.class, Update.class})
    private String title;

    /**
     * 内容类型，0富文本，1链接
     */
    @NotNull(message = "内容类型不能为空", groups = Save.class)
    private Integer contentType;

    /**
     * 链接
     */
    @Length(max = 200, message = "链接长度最长为200个字符", groups = {Save.class, Update.class})
    private String url;

    /**
     * 内容
     */
    @Length(message = "内容长度过长", groups = {Save.class, Update.class})
    private String content;

    /**
     * 文章主图
     */
    @Length(max = 200, message = "文章主图长度最长为200个字符", groups = {Save.class, Update.class})
    private String image;

    /**
     * 顺序
     */
    @NotNull(message = "顺序不能为空", groups = Save.class)
    private Long seq;

    /**
     * 上下架状态，0下架，1上架
     */
    @NotNull(message = "上下架状态不能为空", groups = Save.class)
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

    public ArticleType getType() {
        return type;
    }

    public void setType(ArticleType type) {
        this.type = type;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getContentType() {
        return contentType;
    }

    public void setContentType(Integer contentType) {
        this.contentType = contentType;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
