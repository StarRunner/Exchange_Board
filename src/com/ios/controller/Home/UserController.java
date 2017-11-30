package com.ios.controller.Home;

import static com.ios.util.Functions.getIpAddr;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import swat.ReturnCode;
import swat.cwa;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ios.entity.User;

import com.ios.service.ArticleService;
import com.ios.service.CommentService;
import com.ios.service.LinkService;
import com.ios.service.UserService;
/**
 * 用户的controller
 * Created by 言曌 on 2017/8/24.
 */
@Controller
public class UserController {
	    @Autowired
	    private UserService userService;

	    @Autowired
	    private ArticleService articleService;

	    @Autowired
	    private CommentService commentService;

	    @Autowired
	    private LinkService linkService;

	    @ModelAttribute
	    public void init(Model model) throws Exception {

	    }

	    //后台Home
	    @RequestMapping("/user")
	    public ModelAndView index() throws Exception {
	        ModelAndView modelAndView = new ModelAndView();
	        //Article列表
//	        List<ArticleListVo> articleCustomList = articleService.listArticle(null);
//	        modelAndView.addObject("articleCustomList",articleCustomList);
//	        //评论列表
//	        List<CommentListVo> commentListVoList = commentService.listCommentVo(null);
//	        modelAndView.addObject("commentListVoList",commentListVoList);
//	        //评论数
//	        Integer allCommentCount = commentService.countComment(null);
//	        Integer approvedCommentCount = commentService.countComment(1);
//	        Integer hiddenCommentCount = commentService.countComment(0);
//	        modelAndView.addObject("allCommentCount",allCommentCount);
//	        modelAndView.addObject("approvedCommentCount",approvedCommentCount);
//	        modelAndView.addObject("hiddenCommentCount",hiddenCommentCount);

	        modelAndView.setViewName("/Home/index");
	        return modelAndView;
	    }

	    //登录页面显示
	    @RequestMapping("/user/login")
	    public ModelAndView loginView() {
	        ModelAndView modelAndView = new ModelAndView();
	        modelAndView.setViewName("/Home/login");
	        return modelAndView;
	    }

	    //登录验证
	    @RequestMapping(value = "/user/loginVerify",method = RequestMethod.POST)
	    @ResponseBody
	    public String loginVerify(HttpServletRequest request, HttpServletResponse response) throws Exception {
	        Map<String, Object> map = new HashMap<String, Object>();

	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String rememberme = request.getParameter("rememberme");
	        User customer=new User();
	        ReturnCode returnCode = cwa.authenticate("9.17.186.253" , username, password);

	        if (returnCode.getCode() == 0){ 
                //登录成功
	            map.put("code",1);
	            map.put("msg","");
	            customer.setUserName(username);
	            customer.setUserPass(password);
	            //添加session
	            request.getSession().setAttribute("customer", customer);
	            //添加cookie
	            if(rememberme!=null) {
	                //创建两个Cookie对象
	                Cookie nameCookie = new Cookie("username", username);
	                //设置Cookie的有效期为3天
	                nameCookie.setMaxAge(60 * 60 * 24 * 3);
	                Cookie pwdCookie = new Cookie("password", password);
	                pwdCookie.setMaxAge(60 * 60 * 24 * 3);
	                response.addCookie(nameCookie);
	                response.addCookie(pwdCookie);
	           
            }
	        }

            else{
	            map.put("code",0);
	            map.put("msg","Your username or password was entered incorrectly");
            }
	        String result = new JSONObject(map).toString();
	        return result;
	        }

	    //退出登录
	    @RequestMapping(value = "/user/logout")
	    public String logout(HttpSession session) throws Exception {
	        session.removeAttribute("customer");
	        session.invalidate();
	        return "redirect:/";
	    }


	}

