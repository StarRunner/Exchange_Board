package com.ios.service;

import com.ios.entity.Article;
import com.ios.entity.custom.ArticleCustom;
import com.ios.entity.custom.ArticleDetailVo;
import com.ios.entity.custom.ArticleListVo;
import com.ios.entity.custom.ArticleSearchVo;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;

import java.util.Date;
import java.sql.Timestamp;
import java.util.List;

/**
 * Created by 言曌 on 2017/8/24.
 */
public interface ArticleService {
	//获取Article总数
	public Integer countArticle(Integer status) throws Exception;
	
	//获取评论总数
	public Integer countArticleComment(Integer status) throws Exception;
	
	//获得浏览量总数
	public Integer countArticleView(Integer status) throws Exception;
	
	//获得所有Article不分页
	public List<ArticleListVo> listArticle(Integer status) throws Exception;
	
	//根据id获得Article
	public ArticleCustom getArticleById(Integer status,Integer id) throws Exception;

	//修改Article信息
	public void updateArticle(Integer id, Article article) throws Exception;

	//批量删除Article
	public void deleteArticleBatch(Integer[] ids) throws  Exception;

	//删除Article
	public void deleteArticle(Integer id) throws Exception;

	//分页显示()
	public List<ArticleListVo> listArticleByPage(Integer status,Integer pageNow,Integer pageSize) throws Exception;
	
	//Article详情页面显示
	public ArticleDetailVo getArticleDetailById(Integer id) throws Exception;
	
	//Article查询分页显示
	public List<ArticleSearchVo> listSearchResultByPage(Integer status,HttpServletRequest request, Model model, Integer pageNow, Integer pageSize, String s) throws Exception;
 
	//获得相关Article
	public List<ArticleCustom> listArticleWithSameCategory(Integer status,Integer parentCategoryId,Integer childCategoryId, Integer limit) throws Exception;
	
	//获取访问量较多的Article
	public List<ArticleCustom> listArticleByViewCount(Integer status,Integer limit) throws Exception;
	
	//获得上一篇Article
	public ArticleCustom getAfterArticle(Integer status,Integer id) throws Exception;
	
	//获得下一篇Article
	public ArticleCustom getPreArticle(Integer status,Integer id) throws Exception;
	
	//获得随机Article
	public List<ArticleCustom> listRandomArticle(Integer status,Integer limit) throws  Exception;
	
	//获得评论数较多的Article
	public List<ArticleCustom> listArticleByCommentCount(Integer status,Integer limit) throws Exception;

	//添加Article
	public void insertArticle(Article article) throws Exception;

	//获得某个分类的Article数
	public Integer countArticleWithCategory(Integer status,Integer id) throws Exception;

	//获得某个标签的Article数
	public Integer countArticleWithTag(Integer status,Integer id) throws Exception;

	//更新Article的评论数
	public void updateCommentCount(Integer articleId) throws Exception;

	//获得最后更新记录
	public ArticleCustom getLastUpdateArticle() throws Exception;
	
	//get article by update time
	public ArticleCustom getArticleByUpdateTime(String content) throws Exception;
}
