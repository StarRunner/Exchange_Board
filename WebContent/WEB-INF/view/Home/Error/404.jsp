<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/myTag.tld" prefix="lyz" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>NO page found！</title>
    <link rel="stylesheet" href="/css/style.css">

    <link rel="stylesheet" type="text/css" href="/plugin/404/main.css">
    <style>

    </style>
</head>
<body>
<div id="page" class="site" style="transform: none;" >


    <div id="content" class="site-content" style="transform: none;" >

        <div id="primary" class="content-area">
            <main id="main" class="site-main" role="main">

                <header id="header_404">
                    <h1><span class="icon">!</span>404<span class="sub">page not found</span></h1>
                </header>
                <div id="content_404">
                    <h2>There is no such page!</h2>
                    <p>Please retry to request the page!</p>
                    <div class="utilities">
                        <center>
                        <form name="formsearch" action="/search" id="formkeyword">
                            <div class="input-container">
                                <input type="text" class="left" name="query" size="24" value="Search..." onfocus="if(this.value=='Search...'){this.value='';}" onblur="if(this.value==''){this.value='Search...';}" id="inputString" onkeyup="lookup(this.value);" onblur="fill();" placeholder="Search..." />
                                <button id="search"></button>
                            </div>
                        </form>
                        <div id="btn">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a class="button" href="/">return Home</a>
                            <div class="clear"></div>
                        </div>
                        </center>
                    </div>
                </div>
            </main><!-- .site-main -->

        </div>


        <div class="clear"></div>
    </div st><!-- .site-content -->

</div>
</body>
</html>
