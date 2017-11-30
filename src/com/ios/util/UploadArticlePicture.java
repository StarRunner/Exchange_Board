package com.ios.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadArticlePicture {
	
	/*	
	 * 	Upload Article Picture function
	 * 
	 * 	1, get project path from properties file
	 *	2, get Server path
	 *	2, set img name
	 *	3, write file to 2 pathes
	 *	
	 *	@param Article id in Database, 
	 *	@param File which user want to upload
	 * 	@throws 
	 * 	@author Frank
	 */
	public void uploadArticlePicTool(int articleId, CommonsMultipartFile file, HttpServletRequest request){
		
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
		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
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
	
	public boolean uploadArticlePic2CustomPath(int articleId, CommonsMultipartFile file, HttpServletRequest request){
		
		
		//get Server path
        String imgDirInServer = "/img/thumbnail/random/";
        String serverDir = checkXiegang(request.getSession().getServletContext().getRealPath(imgDirInServer));
        
        String fileName = "img_" + articleId;
        System.out.println("img name: " + fileName);
        System.out.println("server path: " + serverDir);
        System.out.println("final path: " + serverDir + fileName + ".jpg");
			
    	//Upload pic
        boolean mResult = false;
        InputStream in = null;
        OutputStream out = null;
        OutputStream outBackup = null;
        
        InputStream is4Prop = null;
        
        try {
        	//Get custom path from properties file
    		Properties prop = new Properties();
    		    
    		//This way is 
    		ClassLoader cl = UploadArticlePicture.class.getClassLoader();
    		if  (cl !=  null ) {        
    			is4Prop = cl.getResourceAsStream( "/path.properties" );        
	    	}  else {        
	    		is4Prop = ClassLoader.getSystemResourceAsStream( "/path.properties" );        
	    	}    
			prop.load(is4Prop);
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
        	mResult = true;
			System.out.println("upload file success! ");
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			mResult = false;
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
		
        return mResult;
	}
	
	public Timestamp setTimeStamp(Date now) throws ParseException{
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    	String timeStr = df.format(now);//2017-11-26 23:35:49
    	String year = timeStr.substring(0, 4);
    	String month = timeStr.substring(5,7);
    	String day = timeStr.substring(8,10);
    	String hour = timeStr.substring(11, 13);
    	String minute = timeStr.substring(14, 16);
    	String second = timeStr.substring(17, 19);
    	Date date1Parsed = df.parse(year +"-" + month+ "-" + day+ " " + hour + ":" + minute + ":" + second);
    	System.out.println("date format : " + date1Parsed);
    	
    	Timestamp time = new Timestamp(date1Parsed.getTime());
    	
    	return time;
	}
}
