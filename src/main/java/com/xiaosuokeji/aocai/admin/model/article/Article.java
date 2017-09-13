package com.xiaosuokeji.aocai.admin.model.article;

import com.xiaosuokeji.aocai.admin.model.base.PaginationModel;

import java.util.Map;

/**
 * Created by Aranl_lin on 2017/9/6.
 */
public class Article extends PaginationModel {


    /**
     * createTime : 2017-08-29 17:20:03
     * updateTime : 2017-08-29 17:20:03
     * id : 6f677ea4f3ef45c19e5ffc7446a6be86
     * type : {"id":7,"name":"本地新闻"}
     * title : 中国互联网大会
     * contentType : 0
     * url : http://www.xiaosuokeji.com
     * content : http://www.xiaosuokeji.com
     * image : http://www.xiaosuokeji.com
     * seq : 0
     * showable : 1
     */

    private String id;
    private Object type;
    private String title;
    private Integer contentType;
    private String url;
    private String content;
    private String image;
    private Long seq;
    private Integer showable;
    private String createTime;
    private String updateTime;
    private Map<String,String> dynamic;

    public Map<String, String> getDynamic() {
        return dynamic;
    }

    public void setDynamic(Map<String, String> dynamic) {
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

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Object getType() {
        return type;
    }

    public void setType(Object type) {
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

    public static class Object {
        /**
         * id : 7
         * name : 本地新闻
         */
        private Long id;
        private String name;

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
    }
}
