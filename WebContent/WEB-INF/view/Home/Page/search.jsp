<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/myTag.tld" prefix="lyz" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>


<rapid:override name="title">
    <title>Search result</title>
</rapid:override>

<rapid:override name="breadcrumb">
    <nav class="breadcrumb">
        <a class="crumbs" href="/">
            <i class="fa fa-home"></i>Home</a>
            <i class="fa fa-angle-right"></i>
        Search ${articleSearchVoList.get(0).query} and find ${articleSearchVoList.get(0).page.totalCount}  relative Article.
    </nav>
</rapid:override>

    <rapid:override name="left">
        <div id="primary" class="content-area">

            <main id="main" class="site-main" role="main">
                <c:forEach items="${articleSearchVoList}" var="a">
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
											<li><a href="#"> ${a.articleCustom.articleAuthor}</a></li>
											<li><a href="#"><fmt:formatDate value="${a.articleCustom.articlePostTime}" pattern="yyyy-MM-dd"/></a></li>
											<li><a href="#">${a.articleCustom.articleViewCount} views</a></li>
											<li class="last"><a href="/article/${a.articleCustom.articleId}#comments">Leave a comment</a></li>
										</ul>
									</div>
								</div>
							</div>
							<div class="col-2-3 bg-white left"  style="width:66.6%">
								<div class="wrap-col">
									<div class="main-post">
										<h2 class="title"><a href="/article/${a.articleCustom.articleId}">${a.articleCustom.articleTitle}</a></h2>
										<p>${a.articleCustom.articleContent}</p>
									</div>	
								</div>
							</div>
							<div style="clear:both;"></div>
						</div>
					</article>
                </c:forEach>
            </main>
         
           <c:if test="${articleSearchVoList[0].page.totalCount!=0}">
                <%--分页 start--%>
                <nav class="navigation pagination" role="navigation">
                    <div class="nav-links">
                        <c:choose>
                            <c:when test="${articleSearchVoList[0].page.totalPageCount <= 3 }">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="${articleSearchVoList[0].page.totalPageCount }"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="begin" value="${articleSearchVoList[0].page.pageNow-1 }"/>
                                <c:set var="end" value="${articleSearchVoList[0].page.pageNow + 2}"/>
                                <c:if test="${begin < 2 }">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="3"/>
                                </c:if>
                                <c:if test="${end > articleSearchVoList[0].page.totalPageCount }">
                                    <c:set var="begin" value="${articleSearchVoList[0].page.totalPageCount-2 }"/>
                                    <c:set var="end" value="${articleSearchVoList[0].page.totalPageCount }"/>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                        <%--上一页 --%>
                        <c:choose>
                            <c:when test="${articleSearchVoList[0].page.pageNow eq 1 }">
                                <%--当前页为第一页，隐藏上一页按钮--%>
                            </c:when>
                            <c:otherwise>
                                <a class="page-numbers"
                                   href="/p/${articleSearchVoList[0].page.pageNow-1}/search?query=${articleSearchVoList[0].query}">
                                    <span class="fa fa-angle-left"></span>
                                </a>
                            </c:otherwise>
                        </c:choose>
                        <%--显示第一页的页码--%>
                        <c:if test="${begin >= 2 }">
                            <a class="page-numbers"
                               href="/p/1/search?query=${articleSearchVoList[0].query}">1</a>
                        </c:if>
                        <%--显示点点点--%>
                        <c:if test="${begin  > 2 }">
                            <span class="page-numbers dots">…</span>
                        </c:if>
                        <%--打印 页码--%>
                        <c:forEach begin="${begin }" end="${end }" var="i">
                            <c:choose>
                                <c:when test="${i eq articleSearchVoList[0].page.pageNow }">
                                    <a class="page-numbers current">${i}</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="page-numbers"
                                       href="/p/${i}/search?query=${articleSearchVoList[0].query}">${i }</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <%-- 显示点点点 --%>
                        <c:if test="${end < articleSearchVoList[0].page.totalPageCount-1 }">
                            <span class="page-numbers dots">…</span>
                        </c:if>
                        <%-- 显示最后一页的数字 --%>
                        <c:if test="${end < articleSearchVoList[0].page.totalPageCount }">
                            <a href="/p/${articleSearchVoList[0].page.totalPageCount}/search?query=${articleSearchVoList[0].query}">
                                    ${articleSearchVoList[0].page.totalPageCount}
                            </a>
                        </c:if>
                        <%--下一页 --%>
                        <c:choose>
                            <c:when test="${articleSearchVoList[0].page.pageNow eq articleSearchVoList[0].page.totalPageCount }">
                                <%--到了尾页隐藏，下一页按钮--%>
                            </c:when>
                            <c:otherwise>
                                <%--如果没查询到结果，隐藏最后一个>--%>
                                <c:if test="${articleSearchVoList[0].page.totalPageCount>0}">
                                    <a class="page-numbers"
                                       href="/p/${articleSearchVoList[0].page.pageNow+1}/search?query=${articleSearchVoList[0].query}">
                                        <span class="fa fa-angle-right"></span>
                                    </a>
                                </c:if>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </nav>
                <%--分页 end--%>
            </c:if>
        </div>
    </rapid:override>



<%@ include file="../Public/framework.jsp" %>