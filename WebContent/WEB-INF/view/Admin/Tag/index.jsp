<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

    <rapid:override name="title">
        -Tag List
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
              <a><cite>Tag List</cite></a>
        </span>
    </blockquote>
    <div class="layui-row">
        <div class="layui-col-md4">
            <form class="layui-form"  method="post" id="myForm" action="/admin/tag/insertSubmit">
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <strong>Add Tag</strong>
                    </div>
                    <div class="layui-input-block">
                        Name <span style="color: #FF5722; ">*</span>
                        <input type="text" name="tagName" placeholder="Input Tag Name" autocomplete="off" class="layui-input" required>
                    </div>
                    <br>
                    <div class="layui-input-block">
                       Tag Description
                        <input type="text" name="tagDescription" placeholder="Input Tag Description" autocomplete="off" class="layui-input" >
                    </div>
                    <br>
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-filter="formDemo" type="submit">Add</button>
                    </div>
                </div>
            </form>
            <blockquote class="layui-elem-quote layui-quote-nm">
                Note：
                <ul>
                    <li>1、Do not set the tag with long charater</li>
                    <li>2、Duplicated Tag is not allowed</li>
                </ul>
            </blockquote>
        </div>
        <div class="layui-col-md8" style="border: 1px solid #FF5722;">

            <table class="layui-table" >
                <colgroup>
                    <col width="200">
                    <col width="100">
                    <col width="50">
                    <col width="100">
                    <col width="50">
                </colgroup>
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Article Number</th>
                    <th>Status</th>
                    <th>Opertation</th>
                    <th>ID</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${tagCustomList}" var="c">

                    <tr>
                        <td>
                            <a href="/tag/${c.tagId}" target="_blank">${c.tagName}</a>
                        </td>
                        <td >
                            <a href="/tag/${c.tagId}" target="_blank"  lay-data="{sort:true}">${c.articleCount}</a>
                        </td>
                        <td>
                             <c:choose>
                                 <c:when test="${c.tagStatus==1}">
                                     Display
                                 </c:when>
                                 <c:otherwise>
                                     Hidden
                                 </c:otherwise>
                             </c:choose>
                        </td>
                        <td>
                            <a href="/admin/tag/edit/${c.tagId}" class="layui-btn layui-btn-mini">Edit</a>
                            <c:if test="${c.articleCount==0}">
                                <a href="/admin/tag/delete/${c.tagId}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">Delete</a>
                            </c:if>

                        </td>
                        <td >${c.tagId}</td>
                    </tr>

                </c:forEach>
                </tbody>
            </table>
            <blockquote class="layui-elem-quote layui-quote-nm">
             Note：
                <ul>
                    <li>If the tag contain Article，the tag can not be deleted</li>
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
