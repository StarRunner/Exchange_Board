<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/myTag.tld" prefix="lyz" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<!-- This Script link should be here, else can't read it -->
<!-- <script src="/js/jquery.min.js"></script> -->

    <rapid:override name="breadcrumb">
    
    <!-- 透明 section -->
	<!-- <section id="ext_menu-j" data-rv-view="0">
    <nav class="navbar navbar-dropdown transparent navbar-fixed-top bg-color" style="border: 0px;">
        <div class="container">

            <div class="mbr-table">
                <div class="mbr-table-cell">
                    <div class="navbar-brand">
                        <a href="https://mobirise.com" class="navbar-logo">
                        <img src="/js/assets/images/logo.png" alt="Mobirise"></a>
                        <a class="navbar-caption" href="">ShowCase Board</a>
                    </div>
                </div>
                <div class="mbr-table-cell">
                    <button class="navbar-toggler pull-xs-right" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
                        <div class="hamburger-icon"></div>
                    </button>
                    <ul class="nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-xl" id="exCollapsingNavbar">
                    	<li class="nav-item dropdown open">
                    		<a class="nav-link link dropdown-toggle" href="https://mobirise.com/" data-toggle="dropdown-submenu" aria-expanded="true">
                    			OVERVIEW
                    		</a>
                    		<div class="dropdown-menu">
                    			<a class="dropdown-item" href="https://mobirise.com/">
                    				New Item
                    			</a>
                    		</div>
                    	</li>
                    	<li class="nav-item dropdown">
                    		<a class="nav-link link dropdown-toggle" href="https://mobirise.com/" data-toggle="dropdown-submenu" aria-expanded="false">
                    			FEATURES
                    		</a>
                    		<div class="dropdown-menu">
                    			<a class="dropdown-item" href="https://mobirise.com/">
                    				New Item
                    			</a>
                    			<a class="dropdown-item" href="https://mobirise.com/" aria-expanded="false">
                    				New Item
                    			</a>
                    		</div>
                    	</li>
                    	<li class="nav-item">
                    		<a class="nav-link link" href="https://mobirise.com/">
                    			HELP
                    		</a>
                    	</li>
                    	<li class="nav-item nav-btn">
                    		<a class="nav-link btn btn-white btn-white-outline" href="https://mobirise.com/">
                    			DOWNLOAD
                    		</a>
                    	</li>
                    	<li class="nav-item nav-btn">
                    		<a class="nav-link btn btn-primary" href="">
                    			BUY
                    		</a>
                    	</li>
                    	</ul>
                    	Close the tab
	                    <button hidden="" class="navbar-toggler navbar-close" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
	                        <div class="close-icon"></div>
	                    </button>

                </div>
            </div>

        </div>
    </nav>
	</section> -->
	<!-- MastHead section end -->
	<!-- Slide Section Start -->
	<section class="mbr-slider mbr-section mbr-section__container carousel slide mbr-section-nopadding mbr-after-navbar" data-ride="carousel" data-keyboard="false" data-wrap="true" data-pause="false" data-interval="4000" id="slider3-o" data-rv-view="14">
    <div>
        <div>
            <div>
                <ol class="carousel-indicators">
                    <li data-app-prevent-settings="" data-target="#slider3-o" class="active" data-slide-to="0">
                    </li>
                    <li data-app-prevent-settings="" data-target="#slider3-o" data-slide-to="1">
                    </li>
                    <li data-app-prevent-settings="" data-target="#slider3-o" data-slide-to="2">
                    </li>
                    <li data-app-prevent-settings="" data-target="#slider3-o" data-slide-to="3">
                    </li>
                    </ol>
                <div class="carousel-inner" style="height:716px;" role="listbox">
                    <div class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full active" data-bg-video-slide="false" style="background-image: url(/js/assets/images/man-back.jpg);">
                        <div class="mbr-table-cell">
                            <div class="mbr-overlay" style="opacity: 0.6; background-color: rgb(0, 0, 0);"></div>
                            <div class="container-slide container">
                                
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2 text-xs-center">
                                        <h2 class="mbr-section-title display-1">SHARE YOUR IDEA</h2>
                                        <p class="mbr-section-lead lead">Contribute your idea, your invovation, creative method, technoledge</p>

                                        <div class="mbr-section-btn"><a class="btn btn-lg btn-info" href="/manage/article">Start Here</a> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><div class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full" data-bg-video-slide="false" style="background-image: url(/js/assets/images/bridge.jpg);">
                        <div class="mbr-table-cell">
                            <div class="mbr-overlay"></div>
                            <div class="container-slide container">
                                
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-1">
                                        <h2 class="mbr-section-title display-1">INOVATION</h2>
                                        <p class="mbr-section-lead lead">We saw different ideas and innovations from others, but they are not yours, contribute yours here. Your thought may help 
                                        others and help our customer </p>

                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><div class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full" data-bg-video-slide="false" style="background-image: url(/js/assets/images/sparklers.jpg);">
                        <div class="mbr-table-cell">
                            <div class="mbr-overlay"></div>
                            <div class="container-slide container">
                                
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3 text-xs-right">
                                        <h2 style="text-align:left;" class="mbr-section-title display-1">WHAT CAN BE HERE</h2>
                                        <p style="text-align:left;" class="mbr-section-lead lead"> You can share anything you think is good idea! Such as advanced technoledge, creative method and even some big event for us. All these things can make our better</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div><div class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full" data-bg-video-slide="false" style="background-image: url(/js/assets/images/mbr-1611x1080.jpg);">
                        <div class="mbr-table-cell">
                            <div class="mbr-overlay"></div>
                            <div class="container-slide container">
                                
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-3 text-xs-right">
                                        <h2 style="text-align:left;" class="mbr-section-title display-1">COLLABORATION</h2>
                                        <p style="text-align:left;" class="mbr-section-lead lead"> </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <a data-app-prevent-settings="" class="left carousel-control" role="button" data-slide="prev" href="#slider3-o">
                    <span class="icon-prev" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a data-app-prevent-settings="" class="right carousel-control" role="button" data-slide="next" href="#slider3-o">
                    <span class="icon-next" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</section>

  <script src="/js/assets/web/assets/jquery/jquery.min.js"></script>
  <script src="/js/assets/tether/tether.min.js"></script>
  <script src="/js/assets/bootstrap/js/bootstrap.min.js"></script>
  <script src="/js/assets/bootstrap-carousel-swipe/bootstrap-carousel-swipe.js"></script>
  <script src="/js/assets/viewport-checker/jquery.viewportchecker.js"></script>
  <script src="/js/assets/dropdown/js/script.min.js"></script>
  <script src="/js/assets/touch-swipe/jquery.touch-swipe.min.js"></script>
  <script src="/js/assets/smooth-scroll/smooth-scroll.js"></script>
  <script src="/js/assets/theme/js/script.js"></script>
  <!-- End of style -->
        
	<div class="slogan bottom-pad-small">
            <div class="container_index">
            <!-- changed by Frank in Jul 13th, requirement by Sarah -->
               <!-- <div class="row" style='margin-right: -80px; margin-left: 110px;'>
                  <div class="slogan-content">
                     <div class="col-lg-9 col-md-9">
                        <h2 class="slogan-title">Post your idea and your POC here !</h2>
                     </div>
                     <div class="col-lg-3 col-md-3">
                        <div class="get-started">
                         <form name='manageArticle' action='/manage/article' method='post'>
						<input type='hidden' name='manageArticle' value='/manage/article'/>
						<button type="submit" class="btn btn-special btn-color pull-right">
                             		 	Share Your Idea Now!</button>
					</form>
					
                        </div>
                     </div>
                     <div class="clearfix"></div>
                  </div>
               </div> -->
            </div>
    </div>
    </rapid:override>

    <rapid:override name="left">
        <div id="primary" class="content-area">

            <main id="main" class="site-main" role="main">
                <c:forEach items="${articleListVoList}" var="a">

                        <article style="width: 50%; float: left; padding:10px">
						<div class="art-header">
						  <a href="/article/${a.articleCustom.articleId}">
                                <img width="280" height="280"
                                     src="/img/thumbnail/random/img_${a.articleCustom.articleId%400}.jpg"
                                     class="attachment-content size-content wp-post-image"
                                     alt="${a.articleCustom.articleTitle}">
                            </a>
						</div>
						<div class="art-content">
							<div class="col-1-3 right" style="width:33.3%">
								<div class="wrap-col">
									<div class="info">
										<ul class="clearfix bg-green">
											<li style="font-size:14px;color: #ffffff">${a.articleCustom.articleAuthor}</li>
											<li style="font-size:14px;color: #ffffff"><fmt:formatDate value="${a.articleCustom.articlePostTime}" pattern="yyyy-MM-dd"/></li>
											<li style="font-size:14px;color: #ffffff">${a.articleCustom.articleViewCount} views</li>
											<li class="last"><a href="/article/${a.articleCustom.articleId}#comments">Leave a comment</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-2-3 bg-white left"  style="width:66.6%">
								<div class="wrap-col">
									<div class="main-post">
										<h2 class="title"><a href="/article/${a.articleCustom.articleId}">${a.articleCustom.articleTitle}</a></h2>
										${a.articleCustom.articleContent}
									</div>	
								</div>
							</div>
							<div style="clear:both;"></div>
						</div>
					</article>
                </c:forEach>
            </main>
            <div style="clear:both;"></div>
            <c:if test="${articleListVoList[0].page.totalPageCount>1}">
            <nav class="navigation pagination" role="navigation">
                <div class="nav-links">
                    <c:choose>
                        <c:when test="${articleListVoList[0].page.totalPageCount <= 3 }">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${articleListVoList[0].page.totalPageCount }"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="begin" value="${articleListVoList[0].page.pageNow-1 }"/>
                            <c:set var="end" value="${articleListVoList[0].page.pageNow + 2}"/>
                            <c:if test="${begin < 2 }">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="3"/>
                            </c:if>
                            <c:if test="${end > articleListVoList[0].page.totalPageCount }">
                                <c:set var="begin" value="${articleListVoList[0].page.totalPageCount-2 }"/>
                                <c:set var="end" value="${articleListVoList[0].page.totalPageCount }"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>
                        <%--上一页 --%>
                    <c:choose>
                        <c:when test="${articleListVoList[0].page.pageNow eq 1 }">
                            <%--当前页为第一页，隐藏上一页按钮--%>
                        </c:when>
                        <c:otherwise>
                            <a class="page-numbers" href="javascript:doPage('p/${articleListVoList[0].page.pageNow-1}',${articleListVoList[0].page.pageNow-1});" >
                                <span class="fa fa-angle-left"></span>
                            </a>
                        </c:otherwise>
                    </c:choose>
                        <%--显示第一页的页码--%>
                    <c:if test="${begin >= 2 }">
                        <a class="page-numbers"  href="javascript:doPage('p/1',1);">1</a>
                    </c:if>
                        <%--显示点点点--%>
                    <c:if test="${begin  > 2 }">
                        <span class="page-numbers dots">…</span>
                    </c:if>
                        <%--打印 页码--%>
                    <c:forEach begin="${begin }" end="${end }" var="i">
                        <c:choose>
                            <c:when test="${i eq articleListVoList[0].page.pageNow }">
                                <a class="page-numbers current" >${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a  class="page-numbers" href="javascript:doPage('p/${i}',${i})">${i }</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                        <%-- 显示点点点 --%>
                    <c:if test="${end < articleListVoList[0].page.totalPageCount-1 }">
                        <span class="page-numbers dots">…</span>
                    </c:if>
                        <%-- 显示最后一页的数字 --%>
                    <c:if test="${end < articleListVoList[0].page.totalPageCount }">
                        <a  href="javascript:doPage('p/${articleListVoList[0].page.totalPageCount}',${articleListVoList[0].page.totalPageCount});">
                                ${articleListVoList[0].page.totalPageCount}
                        </a>
                    </c:if>
                        <%--下一页 --%>
                    <c:choose>
                        <c:when test="${articleListVoList[0].page.pageNow eq articleListVoList[0].page.totalPageCount }">
                            <%--到了尾页隐藏，下一页按钮--%>
                        </c:when>
                        <c:otherwise>
                           <a  href="javascript:doPage('p/${articleListVoList[0].page.pageNow+1}',${articleListVoList[0].page.pageNow+1});">
                                <span class="fa fa-angle-right"></span>
                            </a>
                        </c:otherwise>
                    </c:choose>

                </div>
            </nav>
                <%--分页 end--%>
            </c:if>
        </div>
    </rapid:override>
    <%--左侧区域 end--%>

    <%--侧边栏 start--%>
    <rapid:override name="right">
        <%@include file="Public/part/sidebar-2.jsp" %>
    </rapid:override>
    <%--侧边栏 end--%>

<%@ include file="Public/framework.jsp" %>
