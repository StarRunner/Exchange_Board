package com.ios.util;

import java.io.File;
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
	public boolean uploadArticlePic2CustomPath(int articleId, CommonsMultipartFile file, HttpServletRequest request){
		
		
		//get upload path
        String fileName = "img_" + articleId;
        System.out.println("img name: " + fileName);
    	//Upload pic
        
        InputStream is4Prop = null;
        
    	//Get path
		Properties prop = new Properties();
		ClassLoader cl = UploadArticlePicture.class.getClassLoader();
		if  (cl !=  null ) {        
			is4Prop = cl.getResourceAsStream( "/path.properties" );        
    	}  else {        
    		is4Prop = ClassLoader.getSystemResourceAsStream( "/path.properties" );        
    	}  

	    try {
	    	
			prop.load(is4Prop);
			String backupPath = prop.getProperty("path");
			file.transferTo(new File(backupPath + fileName + ".jpg"));
    		System.out.println("transfer img successfully");
        	
		} catch (IOException e) {
			e.printStackTrace();
		}
		
        return true;
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
