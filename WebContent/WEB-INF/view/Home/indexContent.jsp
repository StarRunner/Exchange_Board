<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/myTag.tld" prefix="lyz" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<body>
                   <main id="main" class="site-main" role="main">
                <c:forEach items="${articleListVoList}" var="a">

                    <article  class="post type-post" style="float:left;width:33%">

                        <figure class="thumbnail">
                            <a href="/article/${a.articleCustom.articleId}">
                                <img width="280" height="210"
                                     src="/img/thumbnail/random/img_${a.articleCustom.articleId%400}.jpg"
                                     class="attachment-content size-content wp-post-image"
                                     alt="${a.articleCustom.articleTitle}">
                            </a>
                            <span class="cat">
                                <a href="/category/${a.categoryCustomList[a.categoryCustomList.size()-1].categoryId}">
                                        ${a.categoryCustomList[a.categoryCustomList.size()-1].categoryName}
                                </a>
                            </span>
                        </figure>

                        <header class="entry-header">
                            <h2 class="entry-title">
                                <a href="/article/${a.articleCustom.articleId}"
                                   rel="bookmark"  style="font-weight:unset;font-size:14px;">
                                        ${a.articleCustom.articleTitle}
                                </a>
                            </h2>
                        </header>

                        <div class="entry-content">
                            <span class="entry-meta" style="display:block; position:unset !important;line-height: 1.8; font-size: 11px;">
                                 <span style="display"block;">
                                     By: <span style="color: #009688;">
                                      ${a.articleCustom.articleAuthor}
                                    </span>
                                    on <span class="date" style="width: 100%;position:unset !important">
                                        <fmt:formatDate value="${a.articleCustom.articlePostTime}" pattern="yyyy-MM-dd"/>
                                    &nbsp;&nbsp;
                                    </span>
                                   </span>
                                    <span style="display:block;">
                                    <span class="views">
                                        <i class="fa fa-eye"></i>
                                            ${a.articleCustom.articleViewCount} views
                                    </span>
                                    <span class="comment">&nbsp;&nbsp;
                                        <a href="/article/${a.articleCustom.articleId}#comments" rel="external nofollow">
                                          <i class="fa fa-comment-o"></i>
                                            <c:choose>
                                                <c:when test="${a.articleCustom.articleCommentCount==0}">
                                                    Comment
                                                </c:when>
                                                <c:otherwise>
                                                    ${a.articleCustom.articleCommentCount}
                                                </c:otherwise>
                                            </c:choose>
                                        </a>
                                    </span>
                                   </span>
                                </span>
                            <div class="clear"></div>
                        </div><!-- .entry-content -->


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
</body>