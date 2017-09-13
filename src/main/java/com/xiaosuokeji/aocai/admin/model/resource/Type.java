package com.xiaosuokeji.aocai.admin.model.resource;

import com.xiaosuokeji.aocai.admin.model.base.PaginationModel;

import java.util.Map;

/**
 * Created by Aranl_lin on 2017/9/6.
 */
public class Type extends PaginationModel {

    private String createTime;
    private String updateTime;
    private Long id;
    private String name;
    private Object upType;
    private Map<String,String> dynamic;
    private Type children;
    private String urlPrefix;
    private Integer showable;
    private Long seq;
    private String icon;

    public Map<String, String> getDynamic() {
        return dynamic;
    }

    public void setDynamic(Map<String, String> dynamic) {
        this.dynamic = dynamic;
    }

    public String getUrlPrefix() {
        return urlPrefix;
    }

    public void setUrlPrefix(String urlPrefix) {
        this.urlPrefix = urlPrefix;
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

    public Type getChildren() {
        return children;
    }

    public void setChildren(Type children) {
        this.children = children;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Object getUpType() {
        return upType;
    }

    public void setUpType(Object upType) {
        this.upType = upType;
    }

    public static class Object {
        /**
         * id : 6
         */

        private Long id;

        public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }
    }
}
