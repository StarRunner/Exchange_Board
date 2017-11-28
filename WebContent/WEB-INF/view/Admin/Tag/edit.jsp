<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        - Edit Tags
    </rapid:override>
<rapid:override name="header-style">
    <style>
        /*覆盖 layui*/
        .layui-input-block {
            margin:0px 10px;
        }
        .layui-table {
            margin-top: 0;
        }
        .layui-col-md4 {
            padding:10px;
        }
        .layui-col-md8 {
            padding:10px;
        }
        .layui-btn {
            margin: 2px 0!important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">Home</a>
              <a href="/admin/tag">Tag List</a>
              <a><cite>Edit Tag</cite></a>
        </span>
    </blockquote>
    <div class="layui-row">
        <div class="layui-col-md4" style="border: 1px solid #FF5722;">
            <form class="layui-form" method="post" id="myForm" action="/admin/tag/editSubmit">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <strong>Edit Tag</strong>
                    </div>
                    <input type="hidden" name="tagId" value="${tagCustom.tagId}">
                    <div class="layui-input-block">
                        Name <span style="color: #FF5722; ">*</span>
                        <input type="text" name="tagName" value="${tagCustom.tagName}" autocomplete="off" class="layui-input" required>
                    </div>
                    <br>
                    <div class="layui-input-block">
                      Tag Description
                        <input type="text" name="tagDescription" value="${tagCustom.tagDescription}" autocomplete="off" class="layui-input" >
                    </div>
                    <br>
                    <div class="layui-input-block">
                       Status <br>
                        <input type="radio" name="tagStatus" value="1" title="display" <c:if test="${tagCustom.tagStatus==1}">checked</c:if>>
                        <input type="radio" name="tagStatus" value="0" title="hidden" <c:if test="${tagCustom.tagStatus==0}">checked</c:if>>
                    </div>
                    <br>
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-filter="formDemo" type="submit">Save</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="layui-col-md8">
            <table class="layui-table" >
                <colgroup>
                    <col width="50">
                    <col width="300">
                    <col width="100">
                    <col width="50">
                    <col width="100">
                </colgroup>
                <thead>
                <tr>
                    <th>id</th>
                    <th>Name</th>
                    <th>Article Number</th>
                    <th>Status</th>
                    <th>Operation</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${tagCustomList}" var="c">

                    <tr>
                        <td>${c.tagId}</td>
                        <td>
                            <a href="/tag/${c.tagId}" target="_blank">${c.tagName}</a>
                        </td>
                        <td>
                            <a href="/tag/${c.tagId}" target="_blank">${c.articleCount}</a>
                        </td>
                        <td>
                                ${c.tagStatus}
                        </td>
                        <td>
                            <a href="/admin/tag/edit/${c.tagId}" class="layui-btn layui-btn-mini">Edit</a>
                            <c:if test="${c.articleCount==0}">
                                <a href="/admin/tag/delete/${c.tagId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">Delete</a>
                            </c:if>

                        </td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
            <blockquote class="layui-elem-quote layui-quote-nm">
                Note：
                <ul>
                    <li>If the tag contains any article，the tag can not be deleted</li>
                    <li>if the category is 1, the category will displayed in the left， if the status is 0, this will display in content </li>
                </ul>
            </blockquote>
        </div>
    </div>






</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp"%>
