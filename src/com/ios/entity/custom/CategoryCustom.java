package com.ios.entity.custom;

import com.ios.entity.Category;


/**
 * Article分类目录的信息的扩展
 * Created by 言曌 on 2017/8/24.
 */
public class CategoryCustom extends Category {
    //分类对应的Article数
    private Integer articleCount;

    //分类的父分类名称
    private String categoryPname;

    public Integer getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(Integer articleCount) {
        this.articleCount = articleCount;
    }

    public String getCategoryPname() {
        return categoryPname;
    }

    public void setCategoryPname(String categoryPname) {
        this.categoryPname = categoryPname;
    }
}
