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

        .layui-btn {
            margin: 2px 0 !important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
        <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">Home</a>
              <a href="/admin/comment">Comment List</a>
              <a><cite>Edit Comment</cite></a>
        </span>
    </blockquote>

    <form class="layui-form"  method="post" id="myForm" action="/admin/comment/editSubmit">
        <input type="hidden" name="commentId" value="${commentCustom.commentId}">
        <div class="layui-form-item">
            <label class="layui-form-label">Nick Name </label>
            <div class="layui-input-block">
                <input type="text" name="commentAuthorName"  value="${commentCustom.commentAuthorName}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Email </label>
            <div class="layui-input-block">
                <input type="text" name="commentAuthorEmail"  value="${commentCustom.commentAuthorEmail}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">website </label>
            <div class="layui-input-block">
                <input type="text" name="commentAuthorUrl"  value="${commentCustom.commentAuthorUrl}" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">Cotent</label>
            <div class="layui-input-block">
                <textarea name="commentContent"  class="layui-textarea">${commentCustom.commentContent}</textarea>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">单选框</label>
            <div class="layui-input-block">
                <input type="radio" name="commentStatus" value="1" title="display" <c:if test="${commentCustom.commentStatus==1}">checked</c:if>>
                <input type="radio" name="commentStatus" value="0" title="hidden"<c:if test="${commentCustom.commentStatus==0}">checked</c:if>>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">Save</button>
                <button type="reset" class="layui-btn layui-btn-primary" >Reset</button>
            </div>
        </div>

    </form>


</rapid:override>
<rapid:override name="footer-script">
    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>
