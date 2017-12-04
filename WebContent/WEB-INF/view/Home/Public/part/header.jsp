<%--
    博客顶部部分
    包括：顶部菜单，主要菜单(包括Search按钮)，面包屑
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%--导航 start--%>
<header id="masthead" class="site-header">
    <%--顶部菜单 start--%>
    <nav id="top-header">
        <div class="top-nav">
            <div class="user-login" style="float:left;" >
             <a class="inner" href="/">
              <img width="100" height="40" src="/img/dzone.png" alt="DZone" />
              </a>
            </div>
            <div class="menu-topmenu-container" style="padding-top:10px;padding-bottom:10px;float:right;">
                   <c:choose>
                    <c:when test="${sessionScope.customer==null}">
                        <a  href="/user" style="font-size: 19px;font-weight: 300;vertical-align: middle;color: #0288d1;padding-right: 5px;display: inline-block;">Login</a>
                    </c:when>
                    <c:otherwise>
                      <p style="font-size: 19px;
    color: #939598;
    font-weight: 300;
    vertical-align: middle;
    display: inline-block;">
                      Welcome, <a href="/user" style="font-size: 19px;font-weight: 300;vertical-align: middle;color: #0288d1;padding-right: 5px;padding-bottom:4px;display: inline-block;">${sessionScope.customer.userNickname}</a>
                      | <a href="/user/logout" style="font-size: 19px;font-weight: 300;vertical-align: middle;color: #0288d1;padding-right: 5px;padding-bottom:4px;display: inline-block;">Log out</a></p>
                      
                    </c:otherwise>
                </c:choose>
            </div>
            <div style="clear:both;"></div>
        </div> 
    </nav><!-- #top-header -->
    <%--顶部菜单 end--%>

    <%--主要菜单 satrt--%>
    <div id="menu-box">
        <div id="top-menu">
            <div id="site-nav-wrap">
                <div id="sidr-close">
                    <a href="#sidr-close" class="toggle-sidr-close">×</a>
                </div>
                <nav id="site-nav" class="main-nav">
                    <a href="#sidr-main" id="navigation-toggle" class="bars">
                        <i class="fa fa-bars"></i>
                    </a>
                    <div class="menu-pcmenu-container">
                        <ul id="menu-pcmenu" class="down-menu nav-menu sf-js-enabled sf-arrows">

                            <li>
                                <a href="/">
                                    <i class="fa-home fa"></i>
                                    <span class="font-text">Home</span>
                                </a>
                            </li>

                            <c:forEach items="${categoryList}" var="category">
                                <c:if test="${category.categoryPid==0}">
                                    <li>
                                        <a href="/category/${category.categoryId}">
                                            <i class="${category.categoryIcon}"></i>
                                            <span class="font-text">${category.categoryName}&nbsp;</span>
                                        </a>
                                        <ul class="sub-menu">
                                            <c:forEach items="${categoryList}" var="cate">
                                                <c:if test="${cate.categoryPid==category.categoryId}">
                                                    <li>
                                                        <a href="/category/${cate.categoryId}">${cate.categoryName}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <%--主要菜单其余部分--%>
                            <c:forEach items="${menuCustomList}" var="m">
                                <c:if test="${m.menuLevel==2}">
                                    <li>
                                        <a href="${m.menuUrl}">
                                            <i class="${m.menuIcon}"></i>
                                            <span class="font-text">${m.menuName}&nbsp;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </div>
                </nav>
            </div>
              <span class="nav-search">
                    <i class="fa fa-search"></i>
              </span>
            
            <div class="clear"></div>
        </div><!-- #top-menu -->
    </div><!-- #menu-box -->
    <%--主要菜单 satrt--%>

</header><!-- #masthead -->
<%--导航 end start--%>

<%--Search框 start--%>
<div id="search-main">
    <div class="searchbar">
        <form method="get" id="searchform" action="/search">
                <span>
                    <input type="text" value="" name="query" id="s" placeholder="Input Search Content"required="">
                    <button type="submit" id="searchsubmit">Search</button>
                </span>
        </form>
    </div>
    <div class="clear"></div>
</div>
<%--Search框 end--%>

<rapid:block name="breadcrumb"></rapid:block>