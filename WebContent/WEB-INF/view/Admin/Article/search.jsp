<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>


<title>
    <rapid:block name="title">
        - SearchArticle
    </rapid:block>
</title>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/
        .layui-input {
            display: inline-block;
            width: 33.333%!important;
        }

        .layui-input-block {
            margin:0px 10px;
        }
    </style>
</rapid:override>
<rapid:override name="content">
    <blockquote class="layui-elem-quote">
         <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">Home</a>
              <a href="/admin/article">Article List</a>
              <a><cite>
                  Search ${articleSearchVoList[0].query} Find ${articleSearchVoList[0].page.totalCount} Message
                </cite>
              </a>
        </span>
    </blockquote>

    <form id="articleForm" method="post">
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="text" name="query" placeholder="Input Key Word" autocomplete="off" class="layui-input" >
                <button class="layui-btn" lay-filter="formDemo" onclick="queryArticle()">Search</button>
                <button class="layui-btn" lay-filter="formDemo" style="float: right;" onclick="confirmDeleteArticleBatch()">Patch Delete</button>
            </div>
        </div>
    <input type="hidden" name="currentUrl" id="currentUrl" value="">
    <c:choose>
        <%--查询结果不为0--%>
        <c:when test="${articleSearchVoList[0].page.totalCount!=0}">
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
                    <th><input type="checkbox" id="allSelect"  onclick="javascript:DoCheck()"></th>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Category</th>
                    <th>Tag</th>
                    <th>order</th>
                    <th>Post Date</th>
                    <th>Operation</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${articleSearchVoList}" var="a">
                    <tr>
                        <td><input type="checkbox" name="ids" value="${a.articleCustom.articleId}"></td>
                        <td>${a.articleCustom.articleId}</td>
                        <td><a href="/article/${a.articleCustom.articleId}" target="_blank">
                                ${fn:substring(a.articleCustom.articleTitle, 0,20 )}

                        </a></td>
                        <td>
                            <c:forEach items="${a.categoryCustomList}" var="c">
                                <a href="/category/${c.categoryId}" target="_blank">${c.categoryName}</a>
                                &nbsp;
                            </c:forEach>
                        </td>

                        <td>
                            <c:forEach items="${a.tagCustomList}" var="t">
                                <a href="/tag/${t.tagId}" target="_blank">${t.tagName}</a>
                                &nbsp;
                            </c:forEach>
                        </td>
                        <td>
                            ${a.articleCustom.articleOrder}
                        </td>
                        <td>
                            <fmt:formatDate value="${a.articleCustom.articlePostTime}" pattern="MM-dd-HH:mm"/>
                        </td>
                        <td>
                            <a href="/admin/article/edit/${a.articleCustom.articleId}"
                               class="layui-btn layui-btn-mini">Edit</a>
                            <a href="javascript:void(0)"
                               onclick="confirmDeleteArticle(${a.articleCustom.articleId})"
                               class="layui-btn layui-btn-danger layui-btn-mini">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            </form>
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
                            <a class="page-numbers" href="/admin/article/p/${articleSearchVoList[0].page.pageNow-1}/search?query=${articleSearchVoList[0].query}" >
                                <i class="layui-icon">&#xe603;</i>
                            </a>
                        </c:otherwise>
                    </c:choose>
                        <%--显示第一页的页码--%>
                    <c:if test="${begin >= 2 }">
                        <a class="page-numbers" href="/admin/article/p/1/search?query=${articleSearchVoList[0].query}">1</a>
                    </c:if>
                        <%--显示点点点--%>
                    <c:if test="${begin  > 2 }">
                        <span class="page-numbers dots">…</span>
                    </c:if>
                        <%--打印 页码--%>
                    <c:forEach begin="${begin }" end="${end }" var="i">
                        <c:choose>
                            <c:when test="${i eq articleSearchVoList[0].page.pageNow }">
                                <a class="page-numbers current" >${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a  class="page-numbers" href="/admin/article/p/${i}/search?query=${articleSearchVoList[0].query}">${i }</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                        <%-- 显示点点点 --%>
                    <c:if test="${end < articleSearchVoList[0].page.totalPageCount-1 }">
                        <span class="page-numbers dots">…</span>
                    </c:if>
                        <%-- 显示最后一页的数字 --%>
                    <c:if test="${end < articleSearchVoList[0].page.totalPageCount }">
                        <a href="/admin/article/p/${articleSearchVoList[0].page.totalPageCount}/search?query=${articleSearchVoList[0].query}">
                                ${articleSearchVoList[0].page.totalPageCount}
                        </a>
                    </c:if>
                        <%--下一页 --%>
                    <c:choose>
                        <c:when test="${articleSearchVoList[0].page.pageNow eq articleSearchVoList[0].page.totalPageCount }">
                            <%--到了尾页隐藏，下一页按钮--%>
                        </c:when>
                        <c:otherwise>
                            <a class="page-numbers" href="/admin/article/p/${articleSearchVoList[0].page.pageNow+1}/search?query=${articleSearchVoList[0].query}">
                                <i class="layui-icon">&#xe602;</i>
                            </a>
                        </c:otherwise>
                    </c:choose>

                </div>
            </nav>
            <%--分页 end--%>
        </c:when>
        <%--查询结果为0--%>
        <c:otherwise>
           <center><br>There is no relative  <font style="color: red;"> ${articleSearchVoList[0].query} </font> content，please change to other word。</center>
        </c:otherwise>
    </c:choose>


</rapid:override>

<rapid:override name="footer-script">
    <script>
        var currentUrl = window.location.href;
        function queryArticle() {
            //提交form
            $("#articleForm").attr("action","/admin/article/search");
            $("#articleForm").submit();
        }

        function confirmDeleteArticleBatch() {
            var msg = "Are you sure to delete?";
            if (confirm(msg)==true){
                //提交form
                $("#currentUrl").attr("value",currentUrl);
                $("#articleForm").attr("action","/admin/article/deleteBatch");
                $("#articleForm").submit();
            }else{
                return false;
            }
        }

        function confirmDeleteArticle(id) {
            var msg = "Are you sure to delete?";
            if (confirm(msg)==true){
                //提交form
                $("#currentUrl").attr("value",currentUrl);
                $("#articleForm").attr("action","/admin/article/delete/"+id);
                $("#articleForm").submit();
            }else{
                return false;
            }
        }
    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
