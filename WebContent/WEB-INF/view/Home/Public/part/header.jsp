<%--
    博客顶部部分
    包括：顶部菜单，主要菜单(包括Search按钮)，面包屑
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--导航 start--%>
<header id="masthead" class="site-header">

    <%--主要菜单 satrt--%>
    <div id="menu-box" style="border:0px; min-height: 86px;  z-index: 9999; width: 100%; position: relative; background: #323B44;">  
        <div id="top-menu">
         <div class="user-login" style="float:left;" >
             <a class="inner" href="/">
              <img width="260" height="70" style="margin-top: 10px;" src="/img/dzone.png" alt="DZone" />
              </a>
            </div>
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
                                <a href="/" style="text-decoration:none; cursor:pointer;">
                                    <i class="fa-home fa"></i>
                                    <span class="font-text title-font">Home</span>
                                </a>
                            </li>

                            <c:forEach items="${categoryList}" var="category">
                                <c:if test="${category.categoryPid==0}">
                                    <li>
                                        <a href="/category/${category.categoryId}" style="text-decoration:none; cursor:pointer;">
                                            <i class="${category.categoryIcon}"></i>
                                            <span class="font-text title-font">${category.categoryName}&nbsp;</span>
                                        </a>
                                        <ul class="sub-menu" style="border: 0px;">
                                            <c:forEach items="${categoryList}" var="cate">
                                                <c:if test="${cate.categoryPid==category.categoryId}">
                                                    <li>
                                                        <a href="/category/${cate.categoryId}" style="text-decoration:none; cursor:pointer;">${cate.categoryName}</a>
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
                                        <a href="${m.menuUrl}" style="text-decoration:none; cursor:pointer;">
                                            <i class="${m.menuIcon}"></i>
                                            <span class="font-text title-font">${m.menuName}&nbsp;</span>
                                        </a>
                                    </li>
                                </c:if>
                            </c:forEach>
                            <li>
                            	&nbsp;&nbsp;&nbsp;
                            </li>
                            
                            <!-- Search part -->
                            <li>
                            	<span class="nav-search" style="margin-top: 30px; width: 30px; ">
				              		<!-- <i class="fa fa-search"></i> -->
				              		<i class="layui-icon" style="font-size: 30px; color: #FFFFFF;">&#xe615;</i>
				              	</span>
				              	
                            </li>
                            <li>
                            	&nbsp;&nbsp;&nbsp;&nbsp;
                            </li>
                            <!-- Login and user information -->
                            <li>
                            	<c:choose>
				                    <c:when test="${sessionScope.customer==null}">
				                        <a style="text-decoration:none; cursor:pointer;"  href="/user">
		                                    <i class="fa"></i>
		                                    <span class="font-text title-font">Login</span>
		                                </a>
									</c:when>
				                    <c:otherwise>
				                    	<a style="text-decoration:none; cursor:pointer;" onmousemove="changeUnameIconUp()" onmouseout="changeUnameIconDown()" >
		                                    
		                                    <span class="font-text title-font" style="color: #FFFFFF;">${sessionScope.customer.userNickname}</span>
		                                	<i id="username" class="fa layui-icon">&nbsp;&#xe61a;</i>
		                                </a>
                                        <script type="text/javascript">
                                        	function changeUnameIconUp(){
                                        		document.getElementById("username").innerHTML="&nbsp;&#xe619;";
                                        	}
                                        	function changeUnameIconDown(){
                                        		document.getElementById("username").innerHTML="&nbsp;&#xe61a;";
                                        	}
                                        </script>
				                    	<ul class="sub-menu">
				                    		<li>
				                    			<a href="/manage/article" style="text-decoration:none; cursor:pointer;">
				                    				Add Article
				                    			</a>
				                    		</li>
				                    		<li>
				                    			<a href="/user/logout" style="text-decoration:none; cursor:pointer;">
				                    				Log out
				                    			</a>
				                    		</li>
				                    	</ul>                  
				                    </c:otherwise>
				                </c:choose>
                            </li>
                        </ul>
                        
                    </div>
                </nav>
            </div>
         
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