<%--保留此处 start--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>
<%--保留此处 end--%>
    <style>

        .layui-form-label {
            float: left;
            display: block;
            padding: 9px 10px !important;
            width: 120px !important;
            font-weight: 400;
            text-align: left  !important;
        }
.layui-input-block{
    margin-left: 140px !important;
    }
    </style>
    <rapid:override name="title">
        - New Article
    </rapid:override>

<rapid:override name="content">
    <blockquote class="layui-elem-quote">
         <span class="layui-breadcrumb" lay-separator="/">
              <a href="/admin">Home</a>
              <a href="/admin/article">Article List</a>
              <a><cite>Post New Article</cite></a>
        </span>
    </blockquote>



    <form name="frmZb" class="layui-form" enctype="multipart/form-data" method="post" id="myForm" action="/admin/article/insertSubmit">

        <div class="layui-form-item">
            <label class="layui-form-label">Title <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="articleTitle" lay-verify="title" id="title" autocomplete="off" placeholder="Please Input Title" class="layui-input">
            </div>
        </div>
        
        <!-- Rancho Add -->
        <div class="layui-form-item">
            <label class="layui-form-label">Source URL<span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <input type="text" name="articleUrl" lay-verify="title" id="articleurl" autocomplete="off" placeholder="Please input url for box" class="layui-input">
            </div>
        </div>

		<!-- Frank add - upload mini picture for article -->
        <div class="layui-form-item">
			<label class="layui-form-label">Featured Image<span style="color: #FF5722; ">*</span></label>
            <input type="file" name="file" accept="image/*">
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">Content <span style="color: #FF5722; ">*</span></label>
            <div class="layui-input-block">
                <!-- <textarea class="layui-textarea layui-hide" name="articleContent" lay-verify="content" id="content"></textarea> -->
            	<textarea id="TextArea1" name="articleContent" cols="20" rows="2" class="ckeditor"></textarea>
            </div>

        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">Category <span style="color: #FF5722; ">*</span> </label>
            <div class="layui-input-inline">
                <select name="articleParentCategoryId" id="articleParentCategoryId" lay-filter="articleParentCategoryId" required>
                    <option value="" selected="">Primary Classification</option>
                    <c:forEach items="${categoryCustomList}" var="c">
                        <c:if test="${c.categoryPid==0}">
                            <option value="${c.categoryId}">${c.categoryName}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <div class="layui-input-inline">
                <select name="articleChildCategoryId" id="articleChildCategoryId">
                    <option value="" selected>Reclassify</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item" pane="">
            <label class="layui-form-label">Topics</label>
            <div class="layui-input-block">
                <c:forEach items="${tagCustomList}" var="t">
                    <input type="checkbox" name="articleTagIds" lay-skin="primary" title="${t.tagName}" value="${t.tagId}" onchange="chk()">
                </c:forEach>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">Status</label>
            <div class="layui-input-block">
                <input type="radio" name="articleStatus" value="1" title="Submit" checked>
                <input type="radio" name="articleStatus" value="0" title="Draft" >
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit="" lay-filter="demo1">Submit</button>
                <button type="reset" class="layui-btn layui-btn-primary" onclick="getCateIds()">Reset</button>
            </div>
        </div>
        <blockquote class="layui-elem-quote layui-quote-nm">
            Note ：<br>
            Before you add the new article. please ensure the topics and the categories are exist. Please not refresh the page, if you refresh the page, the input content will be disapeared.       


        </blockquote>

    </form>


</rapid:override>

<rapid:override name="footer-script">

    <script>
        layui.use(['form', 'layedit', 'laydate'], function() {
            var form = layui.form
                , layer = layui.layer
                , layedit = layui.layedit
                , laydate = layui.laydate;


            //上传图片,必须放在 创建一个编辑器前面
            layedit.set({
                uploadImage: {
                     url: '/uploadFile' //接口url
                    ,type: 'post' //默认post
                }
            });

            //创建一个编辑器
            var editIndex = layedit.build('content',{
                    height:350,
                }
            );

            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 5) {
                        return '标题至少得5个字符啊';
                    }
                }
                , pass: [/(.+){6,12}$/, '密码必须6到12位']
                , content: function (value) {
                    layedit.sync(editIndex);
                }
            });

            layedit.build('content', {
                tool: [
                    'strong' //加粗
                    ,'italic' //斜体
                    ,'underline' //下划线
                    ,'del' //删除线

                    ,'|' //分割线

                    ,'left' //左对齐
                    ,'center' //居中对齐
                    ,'right' //右对齐
                    ,'link' //超链接
                    ,'unlink' //清除链接
                    ,'face' //表情
                    ,'image' //插入图片
                    ,'code'
                ]
            });

            layui.use('code', function(){ //加载code模块
                layui.code();
            });

            //二级联动
            form.on("select(articleParentCategoryId)",function () {
                var optionstring = "";
                var articleParentCategoryId = $("#articleParentCategoryId").val();
                <c:forEach items="${categoryCustomList}" var="c">
                if(articleParentCategoryId==${c.categoryPid}) {
                    optionstring += "<option name='childCategory' value='${c.categoryId}'>${c.categoryName}</option>";
                }
                </c:forEach>
                $("#articleChildCategoryId").html("<option value=''selected>secondary classification</option>"+optionstring);
                form.render('select'); //这个很重要
            })
//end
     });
//        window.onbeforeunload = function() {
//            return "确认离开当前页面吗？未保存的数据将会丢失";
//        }


		$(":file").filestyle();
    </script>

</rapid:override>

<%--此句必须放在最后--%>
<%@ include file="../Public/framework.jsp"%>

