<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<rapid:override name="title">
   Showcase Board - Your Article List
</rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/
        .layui-input {
            display: inline-block;
            width: 33.333% !important;
        }

        .layui-input-block {
            margin: 0px 10px;
        }


    </style>
</rapid:override>

<rapid:override name="content">
    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
          <a><cite>Article List</cite></a>
        </span>
    </blockquote>

    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">Posted (${totalArticleCount})</li>
            <li>Draft (${totalDraftCount})</li>
        </ul>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <form id="articleForm" method="post">
                    <div class="layui-form-item">
                        <div class="layui-input-block">
                            <input type="text" name="query" placeholder="Input Key Words" autocomplete="off" class="layui-input">
                            <button class="layui-btn" lay-filter="formDemo" onclick="queryArticleByUser()">Search</button>
                            <button  disabled="disabled" id="patchDelete"
                           		class="layui-btn layui-btn-disabled" lay-filter="formDemo" style="float: right;"
								onclick="confirmDeleteArticleBatchByUser()">Patch Delete
                            </button>
                        </div>
                    </div>
                    <input type="hidden" name="currentUrl" id="currentUrl" value="">
                    <table class="layui-table">
                        <colgroup>
                            <col width="50">
                            <col width="50">
                            <col width="300">
                            <col width="200">
                            <col width="200">
                            <col width="50">
                            <col width="150">
                            <col width="100">
                        </colgroup>
                        <thead>
                        <tr>
                            <th><input type="checkbox" id="allSelect" onclick="javascript:DoCheck()"></th>
                            <th>ID</th>
                            <th>Title</th>
                            <th>Category</th>
                            <th>Tag</th>
                            <td>Order</td>
                            <th>Post Time</th>
                            <th>Operation</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${publishedArticleListVoList}" var="a">
                            <c:if test="${a.articleCustom.articleStatus==1}">
                                <tr>
                                    <td><input type="checkbox" name="ids" value="${a.articleCustom.articleId}"></td>
                                    <td>${a.articleCustom.articleId}</td>
                                    <td>
                                        <a href="/article/${a.articleCustom.articleId}">
                                               ${a.articleCustom.articleTitle}

                                        </a></td>
                                    <td>
                                        <c:forEach items="${a.categoryCustomList}" var="c">
                                            <a href="/category/${c.categoryId}">${c.categoryName}</a>
                                            &nbsp;
                                        </c:forEach>
                                    </td>

                                    <td>
                                        <c:forEach items="${a.tagCustomList}" var="t">
                                            <a href="/tag/${t.tagId}"
                                               >${t.tagName}</a>
                                            &nbsp;
                                        </c:forEach>
                                    </td>
                                    <td>${a.articleCustom.articleOrder}</td>
                                    <td>
                                        <fmt:formatDate value="${a.articleCustom.articlePostTime}"
                                                        pattern="yyyy-MM-dd HH:mm"/>
                                    </td>
                                    <td>
                                        <a href="/manage/article/edit/${a.articleCustom.articleId}"
                                           class="layui-btn layui-btn-mini">Edit</a>
                                        <a href="javascript:void(0)"
                                           onclick="deleteArticleByUser(${a.articleCustom.articleId})"
                                           class="layui-btn layui-btn-danger layui-btn-mini">Delete</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </form>

                <c:if test="${publishedArticleListVoList.size()!=0}">
                    <%--分页 start--%>
                <nav class="navigation pagination" role="navigation">
                    <div class="nav-links">
                        <c:choose>
                            <c:when test="${publishedArticleListVoList[0].page.totalPageCount <= 3 }">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="${publishedArticleListVoList[0].page.totalPageCount }"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="begin" value="${publishedArticleListVoList[0].page.pageNow-1 }"/>
                                <c:set var="end" value="${publishedArticleListVoList[0].page.pageNow + 2}"/>
                                <c:if test="${begin < 2 }">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="3"/>
                                </c:if>
                                <c:if test="${end > publishedArticleListVoList[0].page.totalPageCount }">
                                    <c:set var="begin" value="${publishedArticleListVoList[0].page.totalPageCount-2 }"/>
                                    <c:set var="end" value="${publishedArticleListVoList[0].page.totalPageCount }"/>
                                </c:if>
                            </c:otherwise>
                        </c:choose>
                            <%--上一页 --%>
                        <c:choose>
                            <c:when test="${publishedArticleListVoList[0].page.pageNow eq 1 }">
                                <%--当前页为第一页，隐藏上一页按钮--%>
                            </c:when>
                            <c:otherwise>
                                <a class="page-numbers"
                                   href="/manage/article/p/${publishedArticleListVoList[0].page.pageNow-1}">
                                    <i class="layui-icon">&#xe603;</i>
                                </a>
                            </c:otherwise>
                        </c:choose>
                            <%--显示第一页的页码--%>
                        <c:if test="${begin >= 2 }">
                            <a class="page-numbers" href="/manage/article/p/1">1</a>
                        </c:if>
                            <%--显示点点点--%>
                        <c:if test="${begin  > 2 }">
                            <span class="page-numbers dots">…</span>
                        </c:if>
                            <%--打印 页码--%>
                        <c:forEach begin="${begin }" end="${end }" var="i">
                            <c:choose>
                                <c:when test="${i eq publishedArticleListVoList[0].page.pageNow }">
                                    <a class="page-numbers current">${i}</a>
                                </c:when>
                                <c:otherwise>
                                    <a class="page-numbers"
                                       href="/manage/article/p/${i}">${i}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                            <%-- 显示点点点 --%>
                        <c:if test="${end < publishedArticleListVoList[0].page.totalPageCount-1 }">
                            <span class="page-numbers dots">…</span>
                        </c:if>
                            <%-- 显示最后一页的数字 --%>
                        <c:if test="${end < publishedArticleListVoList[0].page.totalPageCount }">
                            <a href="/manage/article/p/${publishedArticleListVoList[0].page.totalPageCount}">
                                    ${publishedArticleListVoList[0].page.totalPageCount}
                            </a>
                        </c:if>
                            <%--下一页 --%>
                        <c:choose>
                            <c:when test="${publishedArticleListVoList[0].page.pageNow eq publishedArticleListVoList[0].page.totalPageCount }">
                            </c:when>
                            <c:otherwise>
                                <a class="page-numbers"
                                   href="/manage/article/p/${publishedArticleListVoList[0].page.pageNow+1}">
                                    <i class="layui-icon">&#xe602;</i>
                                </a>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </nav>
                    <%--分页 end--%>
                </c:if>
            </div>
            <div class="layui-tab-item">
                <table class="layui-table">
                    <colgroup>
                        <col width="50">
                        <col width="300">
                        <col width="200">
                        <col width="200">
                        <col width="200">
                        <col width="100">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>Title</th>
                        <th>Category</th>
                        <th>Tag</th>
                        <th>Post Time</th>
                        <th>Operation</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${draftArticleList}" var="a">
                        <tr>
                            <td>${a.articleCustom.articleId}</td>
                            <td>
                            	${a.articleCustom.articleTitle}
                            	<%-- <a href="/article/${a.articleCustom.articleId}"
                                   >
                                    ${a.articleCustom.articleTitle}
                            	</a> --%>
                            </td>
                            <td>
                                <c:forEach items="${a.categoryCustomList}" var="c">
                                    <a href="/category/${c.categoryId}"
                                      >${c.categoryName}</a>
                                    &nbsp;
                                </c:forEach>
                            </td>

                            <td>
                                <c:forEach items="${a.tagCustomList}" var="t">
                                    <a href="/tag/${t.tagId}"
                                       >${t.tagName}</a>
                                    &nbsp;
                                </c:forEach>
                            </td>

                            <td>
                                <fmt:formatDate value="${a.articleCustom.articlePostTime}"
                                                pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td>
                                <a href="/manage/article/edit/${a.articleCustom.articleId}"
                                   class="layui-btn layui-btn-mini">Edit</a>
                                <a href="javascript:void(0)"
                                   onclick="deleteArticleByUser(${a.articleCustom.articleId})"
                                   class="layui-btn layui-btn-danger layui-btn-mini">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</rapid:override>
<rapid:override name="footer-script">
</rapid:override>
<%@ include file="framework.jsp" %>
