<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--blog right slide start--%>
<div id="sidebar" class="widget-area all-sidebar"
     style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">


    <%--热评Article start--%>
    <aside class="widget hot_comment">
        <h3 class="widget-title">
            <i class="fa fa-bars"></i>Most View
        </h3>
        <div id="hot_comment_widget">
            <ul>
                <c:forEach items="${mostCommentArticleList}" var="m">
                    <li>
                        <a href="/article/${m.articleId}" rel="bookmark"
                           title=" (${m.articleCommentCount}Comments)">
                                ${m.articleTitle}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="clear"></div>
    </aside>
    <%--most view Article end--%>

    <%--All tag start--%>
    <aside class="widget">
        <h3 class="widget-title">
            <i class="fa fa-bars"></i>All Tags
        </h3>
        <div class="tagcloud">
            <c:forEach items="${tagList}" var="tag">
                <a href="/tag/${tag.tagId}"
                   class="tag-link-129 tag-link-position-1" title="${tag.articleCount}Topics"
                   style="font-size: 14px;">
                        ${tag.tagName}
                </a>
            </c:forEach>
            <div class="clear"></div>
        </div>
        <div class="clear"></div>
    </aside>
    <%--all tag end--%>


    <%--random Article start--%>
    <aside id="random_post-7" class="widget random_post wow fadeInUp" data-wow-delay="0.3s">
        <h3 class="widget-title">
            <i class="fa fa-bars"></i>Random Article
        </h3>
        <div id="random_post_widget">
            <ul>
                <c:forEach items="${randomArticleList}" var="r">
                    <li>
                        <a href="/article/${r.articleId}" rel="bookmark">
                                ${r.articleTitle}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="clear"></div>
    </aside>
    <%--recent Article end--%>

    <%--最新评论 start--%>
    <!-- aside id="recent_comments-2" class="widget recent_comments wow fadeInUp" data-wow-delay="0.3s"><h3
            class="widget-title"><i class="fa fa-bars"></i>Recent Comment</h3>
        <div id="message" class="message-widget">
            <ul>
                <c:forEach items="${recentCommentList}" var="r">
                <li style="border: none;">
                    <a href="/article/${r.articleCustom.articleId}/#anchor-comment-${r.commentCustom.commentId}" title="${r.articleCustom.articleTitle}" rel="external nofollow">
                        <img alt=""src="${r.commentCustom.commentAuthorAvatar}" class="avatar avatar-64 photo" height="64" width="64">
                        <span class="comment_author">
                            <strong>${r.commentCustom.commentAuthorName}</strong>
                        </span>
                            ${r.commentCustom.commentContent}
                    </a>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div class="clear"></div>
    </aside-->
    <%--最新评论 end--%>

</div>



<%--blog right slide end--%>
