<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="applicable-device" content="pc,mobile">
    <meta name="MobileOptimized" content="width"/>
    <meta name="HandheldFriendly" content="true"/>
    <link rel="shortcut icon" href="/img/logo.png">
    <link rel="stylesheet" href="/css/bootstrap.css">
    <rapid:block name="description">
        <meta name="description" content="${options.optionMetaDescrption}" />
    </rapid:block>
    <rapid:block name="keywords">
        <meta name="keywords" content="${options.optionMetaKeyword}" />
    </rapid:block>
    <rapid:block name="title">
        <title>
                ${options.optionSiteTitle}-${options.optionSiteDescrption}
        </title>
    </rapid:block>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/plugin/layui/css/layui.css">
    <link rel="stylesheet" href="/plugin/font-awesome/css/font-awesome.min.css">

    <script src="/js/jquery.min.js"></script>
    <script src="/js/superfish.js"></script>
    <script src="/js/script.js"></script>
    <script src="/plugin/layui/layui.all.js"></script>
    <script src="/plugin/layui/layui.js"></script>
	<script src="/js/ckeditor/ckeditor.js"></script>
	
  <!-- added for slider style in 01162018 -->
  <!-- <link rel="stylesheet" href="https://fonts.useso.com/css?family=Montserrat:400,700">
  <link rel="stylesheet" href="https://fonts.useso.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
  <link rel="stylesheet" href="https://fonts.useso.com/css?family=Lora:400,700,400italic,700italic&subset=latin">
   <link rel="stylesheet" href="/js/assets/bootstrap-material-design-font/css/material.css">-->
  <link rel="stylesheet" href="/js/assets/tether/tether.min.css">
  <link rel="stylesheet" href="/js/assets/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="/js/assets/dropdown/css/style.css">
  <link rel="stylesheet" href="/js/assets/animate.css/animate.min.css">
  <link rel="stylesheet" href="/js/assets/theme/css/style.css">
  <link rel="stylesheet" href="/js/assets/mobirise/css/mbr-additional.css" type="text/css">
  
</head>
<body>
<div id="page" class="site" style="transform: none;">
    <%@ include file="part/header.jsp" %>
    
    <div id="content" class="site-content" style="transform: none;">
        <rapid:block name="left"></rapid:block>
        <rapid:block name="right">
            <%@ include file="part/sidebar-1.jsp" %>
        </rapid:block>
    </div>
    <div class="clear"></div>
    <rapid:block name="link"></rapid:block>
    <%@ include file="part/footer.jsp"%>

</div>
    
<rapid:block name="footer-script"></rapid:block>

</body>
</html>