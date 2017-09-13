package com.xiaosuokeji.aocai.home.model;

import java.util.ArrayList;

/**
 * Created by gustinlau on 08/09/2017.
 */
public class Type {
    private Long id;
    private String name;
    private Type upType;
    private String icon;
    private ArrayList<Type>children;

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

    public Type getUpType() {
        return upType;
    }

    public void setUpType(Type upType) {
        this.upType = upType;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public ArrayList<Type> getChildren() {
        return children;
    }

    public void setChildren(ArrayList<Type> children) {
        this.children = children;
    }
}
