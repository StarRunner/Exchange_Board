<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="/WEB-INF/myTag.tld" prefix="lyz" %>
<%@ taglib prefix="rapid" uri="http://www.rapid-framework.org.cn/rapid" %>


<rapid:override name="title">
    <title>${articleDetailVo.articleCustom.articleTitle}</title>
</rapid:override>

<rapid:override name="header-style">
    <rapid:override name="header-style">
        <link rel="stylesheet" href="/css/highlight.css">
        <style>
            .entry-title {
                background: #f8f8f8;
            }
        </style>
    </rapid:override>
</rapid:override>

<rapid:override name="breadcrumb">
    <nav class="breadcrumb">
        <a class="crumbs" href="/">
            <i class="fa fa-home"></i>Home
        </a>
        <c:choose>
            <c:when test="${a.categoryCustomList.size()!=0}">
                <c:forEach items="${articleDetailVo.categoryCustomList}" var="c">
                    <i class="fa fa-angle-right"></i>
                    <a href="/category/${c.categoryId}">
                            ${c.categoryName}
                    </a>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <a>No Category</a>
            </c:otherwise>
        </c:choose>
        <i class="fa fa-angle-right"></i>
      Body
    </nav>
</rapid:override>


<rapid:override name="left">
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <article class="post">
                <header class="entry-header">
                    <h1 class="entry-title">
                            ${articleDetailVo.articleCustom.articleTitle}
                             <div class="info" style="font-size:14px;">
							    By <span style="color: #006EA0;display: unset !important;padding-right:5px;padding-bottom:40px;font-size:14px">${articleDetailVo.articleCustom.articleAuthor},</span>
								<span><fmt:formatDate value="${articleDetailVo.articleCustom.articlePostTime}" pattern="yyyy-MM-dd"/></span> 
						</div>
                    </h1>
	                   
                  </header>
                
                <!-- Rancho Add -->
               <div class="wrap-vid">
					<iframe width="100%" height="400" src="${articleDetailVo.articleCustom.articleUrl}" frameborder="0" allowfullscreen></iframe>
			   </div>
                <div class="entry-content">
                    <div class="single-content">
                            ${articleDetailVo.articleCustom.articleContent}
                    </div>

                    <div class="clear"></div>
                    <div id="social">
                        <div class="social-main">
                                 
                          
                            <div class="clear"></div>
                        </div>
                    </div>

                    <footer class="single-footer">
                        <ul class="single-meta">
                            <c:if test="${sessionScope.customer!=null}">
                            <li class="edit-link">
                                <a target="_blank" class="post-edit-link"
                                   href="/admin/article/edit/${articleDetailVo.articleCustom.articleId}">Edit</a>
                            </li>
                            </c:if>
                            <li class="comment">
                                <a href="/article/${articleDetailVo.articleCustom.articleId}#comments"
                                   rel="external nofollow">
                                    <i class="fa fa-comment-o"></i>
                                    <i class="comment-count">${articleDetailVo.commentCustomList.size()}</i>
                                </a>
                            </li>
                            <li class="views">
                                <i class="fa fa-eye"></i> <span
                                    class="articleViewCount">${articleDetailVo.articleCustom.articleViewCount}</span>
                                views
                            </li>
                            <li class="r-hide">
                                <a href="javascript:pr()" title="Left Side">
                                    <i class="fa fa-caret-left"></i>
                                    <i class="fa fa-caret-right"></i>
                                </a>
                            </li>
                        </ul>
                        <ul id="fontsize">
                            <li>A+</li>
                        </ul>
                        <div class="single-cat-tag">
                            <div class="single-cat">Tag：
                                <c:forEach items="${articleDetailVo.categoryCustomList}" var="c">
                                    <a href="/category/${c.categoryId}">
                                            ${c.categoryName}
                                    </a>
                                </c:forEach>
                            </div>
                        </div>
                    </footer><!-- .entry-footer -->


                    <div class="clear"></div>
                </div><!-- .entry-content -->
            </article>
            <div class="scroll-comments"></div>
            <div id="comments" class="comments-area">
                <div id="respond" class="comment-respond">
                    <h3 id="reply-title" class="comment-reply-title"><span id="reply-title-word">Comment</span>
                        <a rel="nofollow" id="cancel-comment-reply-link"
                           href="/article/${articleDetailVo.articleCustom.articleId}#respond"
                           style="">Cancel Comment</a>
                        <span class="like">
                                        <a href="javascript:;" data-action="ding" data-id="1" title="like"
                                           class="favorite" style="border: unset !important; width: unset !important" onclick="increaseLikeCount()">
                                            <i class="fa fa-thumbs-up"></i>Like
                                            <i class="count"
                                               id="count-${articleDetailVo.articleCustom.articleId}">${articleDetailVo.articleCustom.articleLikeCount}</i>
                                        </a>
                        </span>
                    </h3>
                    <form id="comment_form" method="post">
                        <c:if test="${sessionScope.customer!=null}">
                            <div class="user_avatar">
                                User：${sessionScope.customer.userNickname}
                            </div>
                        </c:if>
                        <p class="comment-form-comment">
                            <textarea id="comment" name="commentContent" rows="4" tabindex="1" required></textarea>
                        </p>
                        <div id="comment-author-info">
                            <input type="hidden" name="commentPid" value="0">
                            <input type="hidden" name="commentPname" value="">
                            <c:if test="${sessionScope.customer==null}">
                                <input type="hidden" name="commentRole" value="0">
                                <p class="comment-form-author">
                                    <label for="author_name">
                                    Nick<span class="required">*</span>
                                    </label>
                                    <input type="text" name="commentAuthorName" id="author_name" class="" value=""
                                           tabindex="2" required>
                                </p>
                                <p class="comment-form-email">
                                    <label for="author_email">
                                        Email<span class="required">*</span>
                                    </label>
                                    <input type="email" name="commentAuthorEmail" id="author_email" class="" value=""
                                           tabindex="3" required>
                                </p>
                                   
                            </c:if>
                        </div>
                        <div class="clear"></div>
                        <p class="form-submit">
                        <script src="/js/jquery.min.js"></script>
						<script type="text/javascript">
						function submitcomment() {
						    $.ajax({
						        async: false,
						        type: "POST",
						        url: '/comment/insert',
						        contentType: "application/x-www-form-urlencoded; charset=utf-8",
						        data: $("#comment_form").serialize(),
						        dataType: "text",
						        success: function () {
						        },
						        error: function () {
						        }
						    })
						}
						</script>
                            <input onclick="submitcomment()" id="submit" name="submit" type="submit" tabindex="5" value="Submit Comment">
                            <input type="hidden" name="commentArticleId"
                                   value="${articleDetailVo.articleCustom.articleId}" id="article_id">
                            <input type="hidden" name="commentPid" id="comment_pid" value="0">
                            <input type="hidden" name="commentAuthorUrl" id="author_url" value="${sessionScope.customer.getUserAvatar()}"
                                           tabindex="4">             
                             <input type="hidden" name="commentRole" value="1">
                                <input type="hidden" name="commentAuthorName"
                                       value="${sessionScope.customer.getUserNickname()}">
                                <input type="hidden" name="commentAuthorEmail"
                                       value="${sessionScope.customer.getUserName()}">
                        </p>
                    </form>
                </div>

                <ol class="comment-list">
                    <c:set var="floor" value="0"/>
                    <c:forEach items="${articleDetailVo.commentCustomList}" var="c">
                        <c:if test="${c.commentPid==0}">
                            <c:set var="floor" value="${floor+1}"/>
                            <li class="comments-anchor">
                                <ul id="anchor-comment-${c.commentId}"></ul>
                            </li>
                            <li class="comment">
                                <div id="div-comment-${c.commentId}" class="comment-body">
                                    <div class="comment-author vcard">
                                        <img class="avatar" src="${c.commentAuthorUrl}" alt="avatar"
                                             style="display: block;">
                                        <strong>${c.commentAuthorName} </strong>
                                        <c:if test="${c.commentRole==1}">
                                            <i class="fa fa-black-tie" style="color: #c40000;"></i>
                                            <span class=""
                                                  style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>Owner</b></span>
                                        </c:if>
                                        <span class="comment-meta commentmetadata">
                                            <span class="ua-info" style="display: inline;">
                                                <br>
                                                <span class="comment-aux">
                                                    <span class="reply">
                                                        <a rel="nofollow" class="comment-reply-link" href="#respond"
                                                     >Reply
                                                        </a>
                                                    </span>
                                                    <fmt:formatDate value="${c.commentCreateTime}"
                                                                    pattern="yyyy/MM/dd HH:mm:ss"/>&nbsp;
                                                    <c:if test="${sessionScope.customer!=null}">
                                                        <a href="javascript:void(0)"
                                                           onclick="deleteComment(${c.commentId})">Delete</a>
                                                        <a class="comment-edit-link"
                                                           href="/admin/comment/edit/${c.commentId}"
                                                           target="_blank">Edit</a>
                                                    </c:if>
                                                    <span class="floor"> &nbsp;${floor}Floor </span>
                                                </span>
                                            </span>
                                        </span>
                                        <p>
                                            <c:if test="${c.commentPid!=0}">
                                                <span class="at">@ ${c.commentPname}</span>
                                            </c:if>
                                                ${c.commentContent}
                                        </p>
                                    </div>
                                </div>
                                <ul class="children">
                                    <c:set var="floor2" value="0"/>
                                    <c:forEach items="${articleDetailVo.commentCustomList}" var="c2">
                                        <c:if test="${c.commentId==c2.commentPid}">
                                            <c:set var="floor2" value="${floor2+1}"/>
                                            <li class="comments-anchor">
                                                <ul id="anchor-comment-${c2.commentId}"></ul>
                                            </li>
                                            <li class="comment">
                                                <div id="div-comment-${c.commentId}" class="comment-body">
                                                    <div class="comment-author vcard">
                                                        <strong>${c2.commentAuthorName} </strong>
                                                        <c:if test="${c2.commentRole==1}">
                                                            <i class="fa fa-black-tie" style="color: #c40000;"></i>
                                                            <span class=""
                                                                  style="margin-top: 2px!important;color: #c40000;font-size: 13px;;"><b>Owner</b></span>
                                                        </c:if>
                                                        <span class="comment-meta">
                                                    <span class="ua-info" style="display: inline;">
                                                    <br>
                                                    <span class="comment-aux">
                                                        <span class="reply">
                                                            <a rel="nofollow" class="comment-reply-link" href="#respond"
r                                                               onclick="replyComment()">reply
                                                            </a>
                                                        </span>
                                                        <fmt:formatDate value="${c2.commentCreateTime}"
                                                                        pattern="yyyy/MM/dd/ HH:mm:ss"/>&nbsp;
                                                        <c:if test="${sessionScope.customer!=null}">
                                                            <a href="javascript:void(0)"
                                                               onclick="deleteComment(${c2.commentId})">Delete</a>
                                                            <a class="comment-edit-link"
                                                               href="/admin/comment/edit/${c2.commentId}"
                                                               target="_blank">Edit</a>
                                                        </c:if>
                                                        <span class="floor"> &nbsp;${floor2}Floor </span>
                                                    </span>
                                                </span>
                                                    </span>
                                                        <p>
                                                            <c:if test="${c2.commentPid!=0}">
                                                                <c:if test="${c2.commentPid!=0}">
                                                                    <span class="at">@ ${c2.commentPname}</span>
                                                                </c:if>
                                                                ${c2.commentContent}
                                                            </c:if>
                                                        </p>
                                                    </div>
                                                </div>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </li>
                        </c:if>
                    </c:forEach>
                </ol>
            </div>

        </main>
        <!-- .site-main -->
    </div>
</rapid:override>


<rapid:override name="footer-script">
    <script src="/js/jquery.cookie.js"></script>

    <script type="text/javascript">
        increaseViewCount();
    </script>

</rapid:override>


<%@ include file="../Public/framework.jsp" %>