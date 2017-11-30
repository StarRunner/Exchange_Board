<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>

<rapid:override name="title">
    - 编辑用户
</rapid:override>
<rapid:override name="header-style">
    <style>
        .layui-form-item .layui-input-inline {
            width: 300px;
        }

        .layui-word-aux {
            color: #FF5722 !important;
        }
        .layui-form-label {
            width: 120px;
        }
        input {
            border: 0!important;
        }
    </style>
</rapid:override>

<rapid:override name="content">

    <blockquote class="layui-elem-quote">
         <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">Home</a>
              <a href="/admin/user">User List</a>
              <c:choose>
                  <c:when test="${sessionScope.user.userId==userCustom.userId}">
                      <a><cite>Personal Information</cite></a>
                  </c:when>
                  <c:otherwise>
                      <a><cite>User Profile</cite></a>
                  </c:otherwise>
              </c:choose>
        </span>
    </blockquote>
    <br><br>
    <form class="layui-form" action="/admin/user/editSubmit" id="userForm"
          method="post">
        <input type="hidden" name="userId" id="userId" value="${userCustom.userId}">
        <div class="layui-form-item">
            <a class="layui-btn layui-btn-primary"  href="/admin/user/edit/${userCustom.userId}">Edit</a>
            <label class="layui-form-label">Favicon</label>
            <div class="layui-input-inline">
                <div class="layui-upload">
                    <div class="layui-upload-list" style="">
                        <img class="layui-upload-img" src="${userCustom.userAvatar}" id="demo1" width="100"
                             height="100">
                        <p id="demoText"></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">User Name</label>
            <div class="layui-input-inline">
                <input type="text" value="${userCustom.userName}"  id="userName" required
                       autocomplete="off" class="layui-input" disabled>
            </div>
            <div class="layui-form-mid layui-word-aux" id="userNameTips"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码 </label>
            <div class="layui-input-inline">
                <input type="password" value="${userCustom.userPass}" id="userPass" required
                       autocomplete="off" class="layui-input" min="3" max="20" disabled>
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">昵称 </label>
            <div class="layui-input-inline">
                <input type="text"  value="${userCustom.userNickname}" required
                       placeholder="" autocomplete="off" min="2" max="10"
                       class="layui-input" disabled>
            </div>
            <div class="layui-form-mid layui-word-aux"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Email </label>
            <div class="layui-input-inline">
                <input type="email"  value="${userCustom.userEmail}" id="userEmail" required
                       class="layui-input" disabled>
            </div>
            <div class="layui-form-mid layui-word-aux" id="userEmailTips"></div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">URL </label>
            <div class="layui-input-inline">
                <input type="url"  value="${userCustom.userUrl}" placeholder="" autocomplete="off"
                       class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Register Date </label>
            <div class="layui-input-inline">
                <input type="text"  value="<fmt:formatDate value="${userCustom.userRegisterTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
" placeholder="" autocomplete="off"
                       class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Last Login Date </label>
            <div class="layui-input-inline">
                <input type="text"  value='<fmt:formatDate value="${userCustom.userLastLoginTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
' placeholder="" autocomplete="off"
                       class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Last Login IP </label>
            <div class="layui-input-inline">
                <input type="text"  value="${userCustom.userLastLoginIp}" placeholder="" autocomplete="off"
                       class="layui-input" disabled>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Status </label>
            <div class="layui-input-inline">
                <input type="text"  value='<c:choose>
                    <c:when test="${userCustom.userStatus==0}">Forbidden
                    </c:when>
                    <c:otherwise>Normal
                    </c:otherwise>
                </c:choose>' placeholder="" autocomplete="off"
                       class="layui-input" disabled>
            </div>
        </div>
    </form>

</rapid:override>
<rapid:override name="footer-script">

    <script>

    </script>
</rapid:override>

<%@ include file="../Public/framework.jsp" %>
