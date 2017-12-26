<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
    </rapid:override>
<rapid:override name="header-style">
    <style>
        .layui-input-block {
            margin:0px 10px;
        }
    </style>
</rapid:override>

<rapid:override name="content">


    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">Home</a>
              <a href="/admin/category">Category List</a>
              <a><cite>Edit Category</cite></a>
        </span>
    </blockquote>
    <div class="layui-row">
        <div class="layui-col-md4" style="border: 1px solid #FF5722;">
            <form class="layui-form"  method="post" id="myForm" action="/admin/category/editSubmit">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <strong>Edit Category</strong>
                    </div>
                    <input type="hidden" name="categoryId" value="${categoryCustom.categoryId}">
                    <div class="layui-input-block">
                      Name <span style="color: #FF5722; ">*</span>
                        <input type="text" name="categoryName" value="${categoryCustom.categoryName}" placeholder="" autocomplete="off" class="layui-input" required>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        Parent Node <span style="color: #FF5722; ">*</span>
                        <select name="categoryPid" class="layui-input" required>
                            <c:forEach items="${categoryCustomList}" var="c">
                                <c:choose>
                                    <c:when test="${c.categoryId==categoryCustom.categoryPid}">
                                        <option value="${c.categoryId}" selected>${c.categoryName}</option>
                                    </c:when>
                                    <c:otherwise>
                                        <c:if test="${c.categoryPid==0}">
                                            <option value="${c.categoryId}">${c.categoryName}</option>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <option value="0" <c:if test="${categoryCustom.categoryPid==0}">selected</c:if> >None</option>
                        </select>
                    </div>
                    <br>
                    <div class="layui-input-block">
                       Category Description
                        <input type="text" name="categoryDescription" value="${categoryCustom.categoryDescription}"  class="layui-input" >
                    </div>
                    <br>
                    <div class="layui-input-block">
                        Category Style
                        <input type="text" name="categoryIcon" value="${categoryCustom.categoryIcon}"class="layui-input" >
                    </div>
                    <br>
                    <div class="layui-input-block">
                        Status <br>
                        <input type="radio" name="categoryStatus" value="1" title="display" <c:if test="${categoryCustom.categoryStatus==1}">checked</c:if>>
                        <input type="radio" name="categoryStatus" value="0" title="hidden" <c:if test="${categoryCustom.categoryStatus==0}">checked</c:if>>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-filter="formDemo" type="submit">保存</button>
                    </div>
                </div>
            </form>
            <br><br>
            <blockquote class="layui-elem-quote layui-quote-nm">
                Note:：
                <ul>
                    <li>If this is the first level category, the parent node can not be edit!</li>
                    <li>If this is the second level category, please select the relative category!</li>
                </ul>
            </blockquote>
        </div>
        <div class="layui-col-md8">
            <table class="layui-table" >
                <colgroup>
                    <col width="50">
                    <col width="50">
                    <col width="300">
                    <col width="100">
                    <col width="50">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>PID</th>
                    <th>Name</th>
                    <th>Article Number</th>
                    <th>Status</th>
                    <th>Operation</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${categoryCustomList}" var="c">
                    <c:if test="${c.categoryPid==0}">
                        <tr>
                            <td class="layui-bg-cyan">${c.categoryId}</td>
                            <td>${c.categoryPid}</td>
                            <td>
                                <a href="/category/${c.categoryId}" target="_blank">${c.categoryName}</a>
                            </td>
                            <td>
                                <a href="/category/${c.categoryId}" target="_blank">${c.articleCount}</a>
                            </td>
                            <td>
                                    ${c.categoryStatus}
                            </td>
                            <td>
                                <a href="/admin/category/edit/${c.categoryId}" class="layui-btn layui-btn-mini">Edit</a>
                                <c:if test="${c.articleCount==0}">
                                    <a href="/admin/category/delete/${c.categoryId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">Delete</a>
                                </c:if>
                            </td>
                        </tr>
                        <c:forEach items="${categoryCustomList}" var="c2">
                            <c:if test="${c2.categoryPid==c.categoryId}">
                                <tr>
                                    <td class="cate-parent">${c2.categoryId}</td>
                                    <td>${c2.categoryPid}</td>
                                    <td>
                                        <a href="/category/${c2.categoryId}" target="_blank">${c2.categoryName}</a>
                                    </td>
                                    <td>
                                        <a href="/category/${c2.categoryId}" target="_blank">${c2.articleCount}</a>
                                    </td>
                                    <td>
                                            ${c2.categoryStatus}
                                    </td>
                                    <td>
                                        <a href="/admin/category/edit/${c2.categoryId}" class="layui-btn layui-btn-mini">Edit</a>
                                        <c:if test="${c2.articleCount==0}">
                                            <a href="/admin/category/delete/${c2.categoryId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">Delete</a>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </c:if>


                </c:forEach>
                </tbody>
            </table>
            <blockquote class="layui-elem-quote layui-quote-nm">
                Note:：
                <ul>
                    <li>If some Article relateive to the categroy，the categroy will not be deleted!</li>
                </ul>
            </blockquote>
        </div>
    </div>






</rapid:override>
<rapid:override name="footer-script">

</rapid:override>

<%@ include file="../Public/framework.jsp"%>
