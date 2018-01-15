package com.ios.controller.Common;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ios.util.UploadArticlePicture;

import javax.servlet.http.HttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@Controller
public class UploadFileController {
    //上传文件
    @RequestMapping(value = "/uploadFile")
    @ResponseBody
    public String uploadFile(HttpServletRequest request,@Param("file") MultipartFile file) throws IOException {
        
        String fileName = Long.toString(System.currentTimeMillis());
        
        //for get path
        InputStream is4Prop = null;
         
        //Get upload path
		Properties prop = new Properties();
		ClassLoader cl = UploadArticlePicture.class.getClassLoader();
		if  (cl !=  null ) {        
			is4Prop = cl.getResourceAsStream( "/path.properties" );        
    	}  else {        
    		is4Prop = ClassLoader.getSystemResourceAsStream( "/path.properties" );        
    	}    
		prop.load(is4Prop);
		String path = prop.getProperty("path");
		System.out.println("The backup path of img is : " + path);
		
		//upload
    	file.transferTo(new File(path + fileName + ".jpg"));
		System.out.println("upload file success! ");

        Map<String,Object> map = new HashMap<String,Object>();
        Map<String,Object> map2 = new HashMap<String,Object>();
        map.put("code",0);//0表示成功，1失败
        map.put("msg","上传成功");//提示消息
        map.put("data",map2);
        map2.put("src", "/img/thumbnail/random/" + fileName + ".jpg");//图片url
        map2.put("title",fileName);//图片名称，这个会显示在输入框里
        String result = new JSONObject(map).toString();
        System.out.println("upload file json: " + result);
        return result;

    }
}
