package com.ios.util;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadArticlePicture {
	
	/*	
	 * 	Upload Article Picture function
	 * 
	 * 	1, set img name
	 * 	2, get Server path 
	 *	3, transfer file to path
	 *	
	 *	@param Article id in Database, 
	 *	@param File which user want to upload
	 * 	@throws 
	 * 	@author Frank
	 */
	public boolean uploadArticlePic2CustomPath(int articleId, CommonsMultipartFile file, HttpServletRequest request) throws IllegalStateException, IOException{
		
		//get upload path
        String fileName = "img_" + Integer.toString(articleId);
        System.out.println("img name: " + fileName);
        
        //Get path
        InputStream is4Prop = null;
		Properties prop = new Properties();
		ClassLoader cl = UploadArticlePicture.class.getClassLoader();
		if  (cl !=  null ) {        
			is4Prop = cl.getResourceAsStream( "/path.properties" );        
    	}  else {        
    		is4Prop = ClassLoader.getSystemResourceAsStream( "/path.properties" );        
    	} 
		prop.load(is4Prop);
		String serverPath = prop.getProperty("serverpath");
		String backupPath = prop.getProperty("backuppath");
		
		if (!file.isEmpty()) {
			byte[] bytes = file.getBytes();
			BufferedOutputStream serverStream =
                    new BufferedOutputStream(new FileOutputStream(new File(serverPath + fileName + ".jpg")));
			serverStream.write(bytes);
			serverStream.close();
			System.out.println("upload img successfully");
			
			BufferedOutputStream backupStream =
                    new BufferedOutputStream(new FileOutputStream(new File(backupPath + fileName + ".jpg")));
			backupStream.write(bytes);
			backupStream.close();
			System.out.println("upload backup img successfully");
	    	
			return true;
		}
		
		return false;
        
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
