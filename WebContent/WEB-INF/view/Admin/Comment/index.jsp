<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.NoSuchAlgorithmException" %>
<%@ page import="com.ios.util.Functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - Comment List
</rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/
        .layui-table {
            margin-top: 0;
        }

    </style>
</rapid:override>

<rapid:override name="content">
    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">Home</a>
              <a><cite>Comment List</cite></a>
        </span>
    </blockquote>
    <div class="layui-tab layui-tab-card">
        <ul class="layui-tab-title">
            <li class="layui-this">All comment(${commentListVoList.size()})</li>
            <li>Pending Comment(${hiddenCommentListVoList.size()})</li>
        </ul>
        <div class="layui-tab-content" >
            <div class="layui-tab-item layui-show" style="margin-bottom: -10px">
                <table class="layui-table" lay-even lay-skin="nob">
                    <colgroup>
                        <col width="100">
                        <col width="300">
                        <col width=200">
                        <col width="150">
                        <col width="50">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>Author</th>
                        <th>Comment Content</th>
                        <th>Article Name</th>
                        <th>Submitted Date</th>
                        <th>ID</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${commentListVoList}" var="c">
                        <tr>
                            <td>
                                <strong>${c.commentCustom.commentAuthorName}</strong>
                                <c:if test="${c.commentCustom.commentStatus==0}">
                                    <span class="approve">[Pending]</span>
                                </c:if>
                                <br>
                                    ${c.commentCustom.commentAuthorEmail} <br>
                            </td>
                            <td class="dashboard-comment-wrap">
                                    ${c.commentCustom.commentContent}
                                <div class="row-actions">
                                     <span class="">
                                           <c:choose>
                                               <c:when test="${c.commentCustom.commentStatus==0}">
                                                   <a href="javascript:void(0)" style="color:#5FB878;!important;" onclick="approveComment(${c.commentCustom.commentId})">Approve</a>
                                               </c:when>
                                               <c:otherwise>
                                                   <a href="javascript:void(0)" style="color:#FF5722;!important;" onclick="hideComment(${c.commentCustom.commentId})">Block</a>
                                               </c:otherwise>
                                           </c:choose>
                                     </span> |
                                     <span class="">
                                        <a href="/admin/comment/reply/${c.commentCustom.commentId}">
                                            Reply
                                        </a>
                                     </span>
                                     <span class=""> |
                                        <a href="/admin/comment/edit/${c.commentCustom.commentId}">Edit</a>
                                     </span>
                                     <span class=""> |
                                        <a href="javascript:void(0)" onclick="deleteComment(${c.commentCustom.commentId})">Delelte</a>
                                     </span>
                                </div>
                            </td>
                            <td>
                                <a href="/article/${c.articleCustom.articleId}"
                                   target="_blank">${c.articleCustom.articleTitle}</a>
                            </td>
                            <td>
                                <fmt:formatDate value="${c.commentCustom.commentCreateTime}" pattern="yyyy-MM-dd- HH:dd:ss"/>
                            </td>
                            <td>
                                    ${c.commentCustom.commentId}
                            </td>

                        </tr>
                    </c:forEach>
                    </tbody>

                </table>

                <div id="nav" style="">
                    <c:if test="${commentListVoList[0].page.totalPageCount >1}">
                    <%--分页 start--%>
                    <nav class="navigation pagination" role="navigation">
                        <div class="nav-links">
                            <c:choose>
                                <c:when test="${commentListVoList[0].page.totalPageCount <= 3 }">
                                    <c:set var="begin" value="1"/>
                                    <c:set var="end" value="${commentListVoList[0].page.totalPageCount }"/>
                                </c:when>
                                <c:otherwise>
                                    <c:set var="begin" value="${commentListVoList[0].page.pageNow-1 }"/>
                                    <c:set var="end" value="${commentListVoList[0].page.pageNow + 2}"/>
                                    <c:if test="${begin < 2 }">
                                        <c:set var="begin" value="1"/>
                                        <c:set var="end" value="3"/>
                                    </c:if>
                                    <c:if test="${end > commentListVoList[0].page.totalPageCount }">
                                        <c:set var="begin" value="${commentListVoList[0].page.totalPageCount-2 }"/>
                                        <c:set var="end" value="${commentListVoList[0].page.totalPageCount }"/>
                                    </c:if>
                                </c:otherwise>
                            </c:choose>
                                <%--上一页 --%>
                            <c:choose>
                                <c:when test="${commentListVoList[0].page.pageNow eq 1 }">
                                    <%--当前页为第一页，隐藏上一页按钮--%>
                                </c:when>
                                <c:otherwise>
                                    <a class="page-numbers" href="/admin/comment/p/${commentListVoList[0].page.pageNow-1}" >
                                        <i class="layui-icon">&#xe603;</i>
                                    </a>
                                </c:otherwise>
                            </c:choose>
                                <%--显示第一页的页码--%>
                            <c:if test="${begin >= 2 }">
                                <a class="page-numbers" href="/admin/comment/p/1">1</a>
                            </c:if>
                                <%--显示点点点--%>
                            <c:if test="${begin  > 2 }">
                                <span class="page-numbers dots">…</span>
                            </c:if>
                                <%--打印 页码--%>
                            <c:forEach begin="${begin }" end="${end }" var="i">
                                <c:choose>
                                    <c:when test="${i eq commentListVoList[0].page.pageNow }">
                                        <a class="page-numbers current" >${i}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a  class="page-numbers" href="/admin/comment/p/${i}">${i}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                                <%-- 显示点点点 --%>
                            <c:if test="${end < commentListVoList[0].page.totalPageCount-1 }">
                                <span class="page-numbers dots">…</span>
                            </c:if>
                                <%-- 显示最后一页的数字 --%>
                            <c:if test="${end < commentListVoList[0].page.totalPageCount }">
                                <a href="/admin/comment/p/${commentListVoList[0].page.totalPageCount}">
                                        ${commentListVoList[0].page.totalPageCount}
                                </a>
                            </c:if>
                                <%--下一页 --%>
                            <c:choose>
                                <c:when test="${commentListVoList[0].page.pageNow eq commentListVoList[0].page.totalPageCount }">
                                    <%--到了尾页隐藏，下一页按钮--%>
                                </c:when>
                                <c:otherwise>
                                    <a class="page-numbers" href="/admin/comment/p/${commentListVoList[0].page.pageNow+1}">
                                        <i class="layui-icon">&#xe602;</i>
                                    </a>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </nav>
                    <%--分页 end--%>
                    </c:if>
                </div>
            </div>
            <div class="layui-tab-item">
                <table class="layui-table" lay-even lay-skin="nob">
                    <colgroup>
                        <col width="100">
                        <col width="300">
                        <col width=200">
                        <col width="150">
                        <col width="50">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>Author</th>
                        <th>Comment Content</th>
                        <th>Article Name</th>
                        <th>Submitted Date</th>
                        <th>ID</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${hiddenCommentListVoList}" var="c">
                        <tr>
                            <td>
                                <strong>${c.commentCustom.commentAuthorName}</strong> <br>
                                    ${c.commentCustom.commentAuthorEmail} <br>
                            </td>
                            <td class="dashboard-comment-wrap">
                                    ${c.commentCustom.commentContent}
                                <div class="row-actions">
                                    <span class="">
                                        <c:choose>
                                            <c:when test="${c.commentCustom.commentStatus==0}">
                                                <a href="javascript:void(0)" style="color:#5FB878;!important;" onclick="approveComment(${c.commentCustom.commentId})">Appove</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:void(0)" style="color:#FF5722;!important;" onclick="hideComment(${c.commentCustom.commentId})">Block</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </span>
                                    <span class=""> |
                                        <a href="/admin/comment/reply/${c.commentCustom.commentId}">Reply</a>
                                    </span>
                                    <span class=""> |
                                         <a href="/admin/comment/edit/${c.commentCustom.commentId}">Edit</a>
                                    </span>
                                    <span class=""> |
                                        <a href="javascript:void(0)" onclick="deleteComment(${c.commentCustom.commentId})">Delete</a>
                                    </span>
                                </div>
                            </td>
                            <td>
                                <a href="/article/${c.articleCustom.articleId}"
                                   target="_blank">${c.articleCustom.articleTitle}</a>
                            </td>
                            <td>
                                <fmt:formatDate value="${c.commentCustom.commentCreateTime}" pattern="yyyy-MM-dd-HH:dd:ss"/>
                            </td>
                            <td>
                                    ${c.commentCustom.commentId}
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
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>
