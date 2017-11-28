package com.ios.entity.custom;

import com.ios.entity.Tag;

/**
 * Article标签的信息的扩展
 * Created by 言曌 on 2017/9/1.
 */
public class TagCustom extends Tag {
	//标签对应的Article数目
	private Integer articleCount;

	public Integer getArticleCount() {
		return articleCount;
	}

	public void setArticleCount(Integer articleCount) {
		this.articleCount = articleCount;
	}
}
