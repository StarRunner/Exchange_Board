package com.ios.controller.Home;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.ios.entity.Article;
import com.ios.entity.User;
import com.ios.entity.custom.ArticleCustom;
import com.ios.entity.custom.ArticleListVo;
import com.ios.entity.custom.ArticleSearchVo;
import com.ios.entity.custom.CategoryCustom;
import com.ios.entity.custom.TagCustom;
import com.ios.service.ArticleService;
import com.ios.service.CategoryService;
import com.ios.service.TagService;
import com.ios.util.UploadArticlePicture;


@Controller
@RequestMapping("/manage/article")
public class ManageArticleController {
    @Autowired
    private ArticleService articleService;

    @Autowired
    private TagService tagService;

    @Autowired
    private CategoryService categoryService;

    //后台Article列表显示
    @RequestMapping(value = "")
    public ModelAndView index(HttpSession session) throws Exception {
        ModelAndView modelAndView = new ModelAndView();

        User customer = (User)session.getAttribute("customer");
        if(customer == null){
//        	判断
        }
        String email = customer.getUserName();
        //分页显示已发布Article
        Integer pageSize = 20;
        List<ArticleListVo> publishedArticleListVoList = articleService.listArticleByUserByPage(1,email,null,pageSize);
        modelAndView.addObject("publishedArticleListVoList",publishedArticleListVoList);

        //不分页显示 草稿Article
        List<ArticleListVo> draftArticleList = articleService.getArticleByUserEmail(0,email);
        modelAndView.addObject("draftArticleList",draftArticleList);
        modelAndView.setViewName("Home/Manage/index");
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
        modelAndView.setViewName("Home/Manage/index");
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

        modelAndView.setViewName("Home/Manage/insert");
        return modelAndView;
    }
    
    @Autowired
    HttpServletRequest request;
    
    //后台添加Article提交操作
    @RequestMapping(value = "/insertSubmit",method = RequestMethod.POST)
    public String insertArticleSubmit(Article article, @RequestParam("file") CommonsMultipartFile file) throws Exception {
    	
    	UploadArticlePicture uploadFunction = new UploadArticlePicture();
    	
    	/*
    	 *  Insert Article
    	 */
    	System.out.println(" ---- Start insert article ----");
    	Date utilDate=new Date(); 
    	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String timeStr = df.format(utilDate);//2017-11-26 23:35:49
    	Timestamp time = uploadFunction.setTimeStamp(utilDate);
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
			articleId = articleService.getLastUpdateArticle().getArticleId();
		}
        System.out.println("Article id: " + articleId);
        
        /*
         *	Upload Video Picture 
         */
        System.out.println(" ---- Start upload video picture ----");
        
        Boolean b = uploadFunction.uploadArticlePic2CustomPath(articleId, file, request);
        
        return "redirect:/manage/article";
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

        return "redirect:/manage/article";
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
        modelAndView.setViewName("Home/Manage/search");
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
        modelAndView.setViewName("Home/Manage/search");
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
        
        modelAndView.setViewName("Home/Manage/edit");
        return modelAndView;
    }


    //编辑Article提交
    @RequestMapping(value = "/editSubmit",method = RequestMethod.POST)
    public String editArticleSubmit(ArticleCustom articleCustom, @RequestParam("file") CommonsMultipartFile file) throws Exception {
    	
    	UploadArticlePicture uploadFunction = new UploadArticlePicture();
    	Integer id = articleCustom.getArticleId();
        articleCustom.setArticleUpdateTime(new Date());
        articleService.updateArticle(id,articleCustom);
        
        uploadFunction.uploadArticlePic2CustomPath(id, file, request);
        
        return "redirect:/manage/article";
    }



}



