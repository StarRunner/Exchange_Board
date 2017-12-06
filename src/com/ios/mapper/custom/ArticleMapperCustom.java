package com.ios.mapper.custom;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.ios.entity.custom.ArticleCustom;

import java.util.Date;
import java.util.List;

/**
 * Created by 言曌 on 2017/8/24.
 */

@Repository
public interface ArticleMapperCustom {
	//获取Article总数
	public Integer countArticle(@Param(value="status") Integer status) throws Exception;
	
	//获取指定user的Article总数
	public Integer countArticleByUser(@Param(value="status") Integer status,@Param(value="email")String email) throws Exception;
		
	//获得留言总数
	public Integer countArticleComment(@Param(value="status")Integer status) throws Exception;
	
	//获得浏览量总数
	public Integer countArticleView(@Param(value="status")Integer status) throws Exception;
	
	//获得所有Article(Article归档)
	public List<ArticleCustom> listArticle(@Param(value="status")Integer status) throws Exception;
	
	//获得所有指定user的Article(Article归档)
	public List<ArticleCustom> listArticleByUser(@Param(value="status")Integer status,@Param(value="email") String email) throws Exception;
	
	//根据id查询用户信息
	public ArticleCustom getArticleById(@Param(value="status")Integer status,@Param(value="id")Integer id) throws Exception;
	
	//分页操作
	public List<ArticleCustom> listArticleByPage(@Param(value="status") Integer status,@Param(value="startPos") Integer startPos, @Param(value="pageSize") Integer pageSize) throws Exception;
	
	//指定user的分页操作
	public List<ArticleCustom> listArticleByUserByPage(@Param(value="status") Integer status,@Param(value="startPos") Integer startPos, @Param(value="pageSize") Integer pageSize,@Param(value="email") String email) throws Exception;
		
	//Article结果查询结果的数量
	public Integer getSearchResultCount(@Param(value="status") Integer status,@Param(value="query")String query) throws Exception;
	
	//查询Article分页操作
	public List<ArticleCustom> listSearchResultByPage(@Param(value="status") Integer status,@Param(value="query") String query,@Param(value="startPos") Integer startPos,@Param(value="pageSize") Integer pageSize) throws Exception;
	
	//获得同分类的Article(相关Article)
	public List<ArticleCustom> listArticleWithSameCategory(
			@Param(value="status") Integer status,
			 @Param(value = "parentCategory") Integer parentCategory
			,@Param(value = "childCategory") Integer childCategory
			,@Param(value = "limit") Integer limit
	) throws Exception;
	
	//获得访问最多的Article(猜你喜欢)
	public List<ArticleCustom> listArticleByViewCount(@Param(value="status") Integer status,@Param(value = "limit") Integer limit) throws Exception;
	
	//获得上一篇Article
	public ArticleCustom getAfterArticle(@Param(value="status") Integer status,@Param(value="id") Integer id) throws Exception;
	
	//获得下一篇Article
	public ArticleCustom getPreArticle(@Param(value="status") Integer status,@Param(value="id") Integer id) throws Exception;
	
	//获得随机Article
	public List<ArticleCustom> listRandomArticle(@Param(value="status") Integer status,@Param(value = "limit") Integer limit) throws  Exception;

	//热评Article
	public List<ArticleCustom> listArticleByCommentCount(@Param(value="status") Integer status,@Param(value = "limit") Integer limit) throws Exception;

	//获得该分类的Article数
	public Integer countArticleByCategory(@Param(value="status") Integer status,@Param(value = "id") Integer id) throws Exception;

	//获得该分类的Article数
	public Integer countArticleByTag(@Param(value="status") Integer status,@Param(value = "id") Integer id) throws Exception;

	//更新Article的评论数
	public void updateCommentCount(@Param(value = "articleId") Integer articleId) throws Exception;

	//获得最后更新的记录
	public ArticleCustom getLastUpdateArticle() throws Exception;
	
	//Get Article id by update time in table article
	public ArticleCustom getArticleIdByUpdateTime(@Param(value="updateTime") String updateTime);
	
}



