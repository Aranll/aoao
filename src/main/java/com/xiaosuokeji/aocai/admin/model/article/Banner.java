package com.xiaosuokeji.aocai.admin.model.article;

import com.xiaosuokeji.aocai.admin.model.base.PaginationModel;

import java.util.Map;

/**
 * Created by Aranl_lin on 2017/9/9.
 */
public class Banner extends PaginationModel{

    /**
     * createTime : 2017-08-29 19:25:29
     * updateTime : 2017-08-29 19:25:48
     * id : 3c321e92202b49249a23c9b91d3d0a05
     * name : 首页广告图
     * url : http://www.xiaosuokeji.com
     * image : http://www.xiaosuokeji.com
     * seq : 0
     * type : {"id":3,"name":"首页悬浮广告"}
     * showable : 1
     */

    private String createTime;
    private String updateTime;
    private String id;
    private String name;
    private String url;
    private String image;
    private Long seq;
    private Object type;
    private Integer showable;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Object getType() {
        return type;
    }

    public void setType(Object type) {
        this.type = type;
    }

    public Integer getShowable() {
        return showable;
    }

    public void setShowable(Integer showable) {
        this.showable = showable;
    }

    public static class Object {
        /**
         * id : 3
         * name : 首页悬浮广告
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
