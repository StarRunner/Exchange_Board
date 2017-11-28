<%--
    一般用于正文侧边栏：
    包括 Search，热评Article，所有标签，随机Article 等小工具
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%--博客主体-右侧侧边栏 start--%>
<div id="sidebar" class="widget-area all-sidebar"
     style="position: relative; overflow: visible; box-sizing: border-box; min-height: 1px;">

        <%--Search框--%>
        <aside class="widget widget_search">
            <div class="searchbar">
                <form method="get" id="searchform1" action="/search">
                        <span> <input type="text" value="" name="query" id="s1" placeholder="Ipnut Search Content" required="">
                            <button type="submit" id="searchsubmit1">Search</button>
                        </span>
                </form>
            </div>
            <div class="clear"></div>
        </aside>
        <%--Search框--%>

        <%--热评Article start--%>
        <aside class="widget hot_comment" >
            <h3 class="widget-title">
                <i class="fa fa-bars"></i>Most View
            </h3>
            <div id="hot_comment_widget">
                <ul>
                    <c:forEach items="${mostCommentArticleList}" var="m">
                        <li>
                            <a href="/article/${m.articleId}" rel="bookmark" title=" (${m.articleCommentCount}条评论)">
                                    ${m.articleTitle}
                            </a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <div class="clear"></div>
        </aside>
        <%--热评Article end--%>

        <%--所有标签 start--%>
        <aside class="widget">
            <h3 class="widget-title">
                <i class="fa fa-bars"></i>所有标签
            </h3>
            <div class="tagcloud">
                <c:forEach items="${tagList}" var="t">
                    <a href="/tag/${t.tagId}"
                       class="tag-link-129 tag-link-position-1" title="${t.articleCount}个话题"
                       style="font-size: 14px;">
                            ${t.tagName}
                    </a>
                </c:forEach>
                <div class="clear"></div>
            </div>
            <div class="clear"></div>
        </aside>
        <%--所有标签 end--%>

        <%--博客主体-右侧侧边栏-随机Article start--%>
        <aside id="random_post-7" class="widget random_post wow fadeInUp" data-wow-delay="0.3s">
            <h3 class="widget-title">
                <i class="fa fa-bars"></i>随机Article
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
        <%--博客主体-右侧侧边栏-近期Article end--%>

</div>
<%--博客主体-右侧侧边栏 end--%>