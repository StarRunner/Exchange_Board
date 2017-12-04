# Exchange_Board
1,Code Format:UTF-8
2,Set Upload File Path
	UploadFileController.java 
	String rootPath ="/"
3,DB Setting
	src/db.properties
	DB name:Exchange_Board
4,add column user_email to table article
ALTER TABLE article ADD `user_email` VARCHAR(50) DEFAULT NULL
	
	