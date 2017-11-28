package com.ios.entity.custom;

import com.ios.entity.User;

/**
 * 用户信息的扩展
 * Created by 言曌 on 2017/8/24.
 */
public class UserCustom extends User {
    //用户的Article数
    private Integer articleCount;

    public Integer getArticleCount() {
        return articleCount;
    }

    public void setArticleCount(Integer articleCount) {
        this.articleCount = articleCount;
    }
}
