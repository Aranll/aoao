package com.xiaosuokeji.aocai.home.model;

/**
 * Created by gustinlau on 08/09/2017.
 */
public class Link {

    private String createTime;
    private String updateTime;
    private String id;
    private String name;
    private String url;
    private String image;
    private int seq;
    private Type type;
    private int showable;

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

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public Type getType() {
        return type;
    }

    public void setType(Type type) {
        this.type = type;
    }

    public int getShowable() {
        return showable;
    }

    public void setShowable(int showable) {
        this.showable = showable;
    }


}

