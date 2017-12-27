package com.ios.controller.Common;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ios.util.UploadArticlePicture;

import javax.servlet.http.HttpServletRequest;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

@Controller
public class UploadFileController {
    //上传文件
    @RequestMapping(value = "/uploadFile")
    @ResponseBody
    public String uploadFile(HttpServletRequest request,@Param("file") MultipartFile file) throws IOException {
        
        //原始名称
        String originalFilename = file.getOriginalFilename();
        //新的文件名称
        String filesuffix = originalFilename.substring(originalFilename.lastIndexOf("."));
        String fileName = Long.toString(System.currentTimeMillis());

        //get Server path
        String imgDirInServer = "/img/thumbnail/random/";
        String serverDir = checkXiegang(request.getSession().getServletContext().getRealPath(imgDirInServer));
        
        System.out.println("img name: " + fileName);
        System.out.println("server path: " + serverDir);
        System.out.println("final path: " + serverDir + fileName + ".jpg");
			
    	//Upload pic
        InputStream in = null;
        OutputStream out = null;
        OutputStream outBackup = null;
        
        InputStream is4Prop = null;
        
        try {
        	//Get custom path from properties file
    		Properties prop = new Properties();
    		
    		ClassLoader cl = UploadArticlePicture.class.getClassLoader();
    		if  (cl !=  null ) {        
    			is4Prop = cl.getResourceAsStream( "/path.properties" );        
	    	}  else {        
	    		is4Prop = ClassLoader.getSystemResourceAsStream( "/path.properties" );        
	    	}    
			prop.load(is4Prop);
			//if path is null, will using next param
			String backupPath = prop.getProperty("path", "C:/temp/");
			System.out.println("The backup path of img is : " + backupPath);
    		
        	//upload pic to tomcat and backup folder
        	in = new BufferedInputStream(file.getInputStream());
        	out = new BufferedOutputStream(new FileOutputStream(serverDir + fileName + ".jpg"));
        	outBackup = new BufferedOutputStream(new FileOutputStream(backupPath + fileName + ".jpg"));
			
        	int len = 0;
        	while((len=in.read())!=(-1)){
				out.write(len);
				outBackup.write(len);
			}
			System.out.println("upload file success! ");
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (null!=in) {
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (null!=is4Prop) {
				try {
					in.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (null != out) {
				try {
					out.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (null != outBackup) {
				try {
					outBackup.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

        Map<String,Object> map = new HashMap<String,Object>();
        Map<String,Object> map2 = new HashMap<String,Object>();
        map.put("code",0);//0表示成功，1失败
        map.put("msg","上传成功");//提示消息
        map.put("data",map2);
        map2.put("src",imgDirInServer + fileName + ".jpg");//图片url
        map2.put("title",fileName);//图片名称，这个会显示在输入框里
        String result = new JSONObject(map).toString();
        System.out.println("upload file json: " + result);
        return result;

    }
    
    public static String checkXiegang(String sourceStr){
		if (!sourceStr.endsWith("\\")) {
        	System.out.println("Path doesn't contains \\, adding '\\' for server path...");
        	sourceStr = sourceStr + "\\";
			System.out.println("'\\' added to server path : " + sourceStr);
		}
		System.out.println("backup path: " + sourceStr);
		return sourceStr;
	}
}
