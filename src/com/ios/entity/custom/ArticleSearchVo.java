package com.ios.entity.custom;


import java.util.List;

import com.ios.util.others.Page;

/**
 * 用于封装Search的Article列表，包括Article信息，作者信息，分类信息，标签信息，Search信息
 * Created by 言曌 on 2017/8/24.
 */
public class ArticleSearchVo {
	//Article信息
	private ArticleCustom articleCustom;
	
	//Article对应的分类
	private List<CategoryCustom> categoryCustomList;
	
	//Article对应的标签
	private List<TagCustom> tagCustomList;

	//作者信息
	private UserCustom userCustom;

	//Article分页信息
	private Page page;

	//Search关键词
	private String query;

	public String getQuery() {
		return query;
	}

	public UserCustom getUserCustom() {
		return userCustom;
	}

	public void setUserCustom(UserCustom userCustom) {
		this.userCustom = userCustom;
	}

	public void setQuery(String query) {
		this.query = query;
	}


	public ArticleCustom getArticleCustom() {
		return articleCustom;
	}
	
	public void setArticleCustom(ArticleCustom articleCustom) {
		this.articleCustom = articleCustom;
	}

	public List<CategoryCustom> getCategoryCustomList() {
		return categoryCustomList;
	}

	public void setCategoryCustomList(List<CategoryCustom> categoryCustomList) {
		this.categoryCustomList = categoryCustomList;
	}

	public List<TagCustom> getTagCustomList() {
		return tagCustomList;
	}

	public void setTagCustomList(List<TagCustom> tagCustomList) {
		this.tagCustomList = tagCustomList;
	}

	public Page getPage() {
		return page;
	}
	
	public void setPage(Page page) {
		this.page = page;
	}
}
