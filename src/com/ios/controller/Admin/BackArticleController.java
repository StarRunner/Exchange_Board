package com.ios.controller.Admin;

import com.ios.entity.Article;
import com.ios.entity.custom.*;
import com.ios.mapper.custom.ArticleMapperCustom;
import com.ios.service.ArticleService;
import com.ios.service.CategoryService;
import com.ios.service.TagService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;


@Controller
@RequestMapping("/admin/article")
public class BackArticleController {
    @Autowired
    private ArticleService articleService;

    @Autowired
    private TagService tagService;

    @Autowired
    private CategoryService categoryService;

    //后台Article列表显示
    @RequestMapping(value = "")
    public ModelAndView index() throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        //分页显示已发布Article
        Integer pageSize = 20;
        List<ArticleListVo> publishedArticleListVoList = articleService.listArticleByPage(1,null,pageSize);
        modelAndView.addObject("publishedArticleListVoList",publishedArticleListVoList);

        //不分页显示 草稿Article
        List<ArticleListVo> draftArticleList = articleService.listArticle(0);
        modelAndView.addObject("draftArticleList",draftArticleList);
        modelAndView.setViewName("Admin/Article/index");
        return modelAndView;
    }

    //Article分页显示
    @RequestMapping("/p/{pageNow}")
    public @ResponseBody  ModelAndView ArticleListByPageView(@PathVariable("pageNow") Integer pageNow) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        //分页显示已发布Article
        Integer pageSize = 20;
        List<ArticleListVo> publishedArticleListVoList = articleService.listArticleByPage(1,pageNow,pageSize);
        modelAndView.addObject("publishedArticleListVoList",publishedArticleListVoList);

        //不分页显示 草稿Article
        List<ArticleListVo> draftArticleList = articleService.listArticle(0);
        modelAndView.addObject("draftArticleList",draftArticleList);
        modelAndView.setViewName("Admin/Article/index");
        return modelAndView;
    }

    //后台添加Article页面显示
    @RequestMapping(value = "/insert")
    public ModelAndView insertArticleView() throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        List<CategoryCustom> categoryCustomList = categoryService.listCategory(1);
        List<TagCustom> tagCustomList = tagService.listTag(1);

        modelAndView.addObject("categoryCustomList",categoryCustomList);
        modelAndView.addObject("tagCustomList",tagCustomList);

        modelAndView.setViewName("Admin/Article/insert");
        return modelAndView;
    }
    
    @Autowired
    HttpServletRequest request;
    
    //后台添加Article提交操作
    @RequestMapping(value = "/insertSubmit",method = RequestMethod.POST)
    public String insertArticleSubmit(Article article, @RequestParam("file") CommonsMultipartFile file) throws Exception {
    	
    	/*
    	 *  Insert Article
    	 */
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	System.out.println(" ---- Start insert article ----");
    	Date utilDate=new Date(); 
    	
    	String timeStr = df.format(utilDate);
    	System.out.println("after format: " + timeStr);//2017-11-26 23:35:49
    	
    	String year = timeStr.substring(0, 4);
    	String month = timeStr.substring(5,7);
    	String day = timeStr.substring(8,10);
    	String hour = timeStr.substring(11, 13);
    	String minute = timeStr.substring(14, 16);
    	String second = timeStr.substring(17, 19);
    	Date date1Parsed = df.parse(year +"-" + month+ "-" + day+ " " + hour + ":" + minute + ":" + second);
    	System.out.println("date format : " + date1Parsed);
    	
    	Timestamp time = new Timestamp(date1Parsed.getTime());
    	System.out.println("Date: " + utilDate);
    	System.out.println("timestamp: " + time);//0201-01-02 00:00:03.0
    	
        article.setArticlePostTime(time);
        article.setArticleUpdateTime(time);
        article.setArticleIsComment(1);
        article.setArticleViewCount(0);
        article.setArticleLikeCount(0);
        article.setArticleCommentCount(0);
        article.setArticleStatus(1);
        article.setArticleOrder(1);
        System.out.println("Article.toString: " + article.toString());
        
        //insert
        articleService.insertArticle(article);
        System.out.println("Inser article finished.");
        
        //get article id
        
    	
        System.out.println(" Start get article id...");
        int articleId = 1;
        
        try {
        	articleId = articleService.getArticleByUpdateTime(timeStr).getArticleId();
		} catch (NullPointerException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
        
        //if articleId = 1, it means get article id failed.
        if (articleId==1) {
			System.out.println("Get article id failed. Try another way. ");
			System.out.println("Get last update article...");
			articleService.getLastUpdateArticle();
		}
        
        System.out.println("Get article id successed. ");
        System.out.println("Article id: " + articleId);
        
        /*
         *	Upload Video Picture 
         *
         *	1, get project path from properties file
         *	2, get Server path
         *	2, set img name
         *	3, write file to 2 pathes
         */
        System.out.println(" ---- Start upload video picture ----");
        Properties prop = new Properties();
        System.out.println("start get properties file which contains project root path");
        String imgDirInServer = "/img/thumbnail/random/";
        //get Server real path
        String serverDir = request.getSession().getServletContext().getRealPath(imgDirInServer);
        
        if (!serverDir.endsWith("\\")) {
        	System.out.println("Path doesn't contains \\, adding '\\' for server path...");
			serverDir = serverDir + "\\";
			System.out.println("'\\' added to server path : " + serverDir);
		}
        
        String fileName = "img_" + articleId;
        System.out.println("img name: " + fileName);
        System.out.println("server path: " + serverDir);
        System.out.println("final path: " + serverDir + fileName + ".jpg");
        try {
        	
			OutputStream os4Server = new FileOutputStream(serverDir + fileName + ".jpg");
        	InputStream is = file.getInputStream();
			
			int temp;
			while((temp=is.read())!=(-1)){
				os4Server.write(temp);
			}
			os4Server.flush();
			os4Server.close();
			is.close();
		} catch (FileNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
        return "redirect:/admin/article";
    }

    //后台添加Article提交操作
    @RequestMapping(value = "/insertDraftSubmit",method = RequestMethod.POST)
    public String insertArticleDraftSubmit(Article article) throws Exception {

        article.setArticlePostTime(new Date());
        article.setArticleUpdateTime(new Date());
        article.setArticleIsComment(1);
        article.setArticleViewCount(0);
        article.setArticleLikeCount(0);
        article.setArticleCommentCount(0);
        article.setArticleStatus(0);
        article.setArticleOrder(1);

        articleService.insertArticle(article);

        return "redirect:/admin/article";
    }


    //Search实现
    @RequestMapping("/search")
    @ResponseBody
    public ModelAndView SearchPageView(HttpServletRequest request,Model model) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        //设置每页显示的数量
        int pageSize = 20;
        String query = request.getParameter("query");
        List<ArticleSearchVo> articleSearchVoList = articleService.listSearchResultByPage(1,request,model,null,pageSize,query);
        modelAndView.addObject("articleSearchVoList", articleSearchVoList);
        modelAndView.setViewName("Admin/Article/search");
        return modelAndView;
    }

    //Search分页实现
    @RequestMapping("/p/{pageNow}/search")
    @ResponseBody
    public  ModelAndView SearchPageByPageView(HttpServletRequest request, Model model,@PathVariable("pageNow") Integer pageNow) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        //设置每页显示的数量
        int pageSize = 20;
        String query = request.getParameter("query");
        List<ArticleSearchVo> articleSearchVoList = articleService.listSearchResultByPage(1,request,model,pageNow,pageSize,query);
        modelAndView.addObject("articleSearchVoList", articleSearchVoList);
        modelAndView.setViewName("/Admin/Article/search");
        return modelAndView;
    }



    //删除Article
    @RequestMapping(value = "/delete/{id}")
    public void deleteArticle(@PathVariable("id") Integer id) throws Exception {
        //调用service批量删除
        articleService.deleteArticle(id);
    }

    //批量删除Article
    @RequestMapping(value = "/deleteBatch")
    public void deleteArticles(HttpServletRequest request) throws Exception {
        String str = request.getParameter("ids");
        String[] arr = str.split(",");
        Integer[] ids = new Integer[arr.length];
        for(int i=0;i<arr.length;i++) {
            ids[i] = Integer.valueOf(arr[i]);
        }
        //调用service批量删除
        articleService.deleteArticleBatch(ids);

    }

    //编辑Article页面显示
    @RequestMapping(value = "/edit/{id}")
    public ModelAndView editArticleView(@PathVariable("id") Integer id) throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        ArticleCustom articleCustom =  articleService.getArticleById(null,id);
        modelAndView.addObject("articleCustom",articleCustom);

        List<CategoryCustom> categoryCustomList = categoryService.listCategory(1);
        modelAndView.addObject("categoryCustomList",categoryCustomList);

        List<TagCustom> tagCustomList = tagService.listTag(1);
        modelAndView.addObject("tagCustomList",tagCustomList);


        modelAndView.setViewName("Admin/Article/edit");
        return modelAndView;
    }


    //编辑Article提交
    @RequestMapping(value = "/editSubmit",method = RequestMethod.POST)
    public String editArticleSubmit(ArticleCustom articleCustom) throws Exception {
        Integer id = articleCustom.getArticleId();
        articleCustom.setArticleUpdateTime(new Date());
        articleService.updateArticle(id,articleCustom);
        return "redirect:/admin/article";
    }



}



