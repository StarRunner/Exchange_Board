function DoCheck() {
    var ch = document.getElementsByName("ids");
    if (document.getElementById("allSelect").checked == true) {
        for (var i = 0; i < ch.length; i++) {
            ch[i].checked = true;
        }
    } else {
        for (var i = 0; i < ch.length; i++) {
            ch[i].checked = false;
        }
    }
}

function confirmDelete() {
    var msg = "Are you sure to delete? ";
    if (confirm(msg)==true){
        return true;
    }else{
        return false;
    }
}

function  getPath(){
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0,index+1);
    return result;
}


$(".dashboard-comment-wrap").mouseenter(function () {
    $(this).find(".row-actions").show();
})
$(".dashboard-comment-wrap").mouseleave(function () {
    $(this).find(".row-actions").hide();
})

function deleteComment(id) {
    if(confirmDelete()==true){
        $.ajax({
            async: false,
            type: "POST",
            url:'/admin/comment/delete/'+id,
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            complete:function () {
                window.location.reload();
            }
        })
    }
}

function approveComment(id) {
    $.ajax({
        async: false,
        type: "POST",
        url:'/admin/comment/approve/'+id,
        contentType : "application/x-www-form-urlencoded; charset=utf-8",
        dataType: "text",
        complete:function () {
            window.location.reload();
        }
    })
}

function hideComment(id) {
    $.ajax({
        async: false,
        type: "POST",
        url:'/admin/comment/hide/'+id,
        contentType : "application/x-www-form-urlencoded; charset=utf-8",
        dataType: "text",
        complete:function () {
            window.location.reload();
        }
    })
}

function insertDraft() {
    if($("#articleContent").val!=""&&$("#articleTitle").val()!="") {
        $.ajax({
            async: false,
            type: "POST",
            url:'/admin/article/insert',
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            complete:function () {
                window.location.reload();
            }
    })
    }

}

function deleteArticle(id) {
    if(confirmDelete()==true){
        $.ajax({
            async: false,
            type: "POST",
            url:'/admin/article/delete/'+id,
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            complete:function () {
                window.location.reload();
            }
        })
    }
}

function deleteArticleByUser(id) {
    if(confirmDelete()==true){
        $.ajax({
            async: false,
            type: "POST",
            url:'/manage/article/delete/'+id,
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            complete:function () {
                window.location.reload();
            }
        })
    }
}

function queryArticle() {
    $("#articleForm").attr("action", "/admin/article/search");
    $("#articleForm").submit();
}

function queryArticleByUser() {
    $("#articleForm").attr("action", "/manage/article/search");
    $("#articleForm").submit();
}

function confirmDeleteArticleBatch() {
    if(confirmDelete()==true){
        var text = $("input:checkbox[name='ids']:checked").map(function(index,elem) {
            return $(elem).val();
        }).get().join(',');
        $.ajax({
            async: false,
            type: "POST",
            url:'/admin/article/deleteBatch',
            data:{ids:text},
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            complete:function () {
                window.location.reload();
            }
        })
    }
}

function confirmDeleteArticleBatchByUser() {
    if(confirmDelete()==true){
        var text = $("input:checkbox[name='ids']:checked").map(function(index,elem) {
            return $(elem).val();
        }).get().join(',');
        $.ajax({
            async: false,
            type: "POST",
            url:'/manage/article/deleteBatch',
            data:{ids:text},
            contentType : "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "text",
            complete:function () {
                window.location.reload();
            }
        })
    }
}

function checkUserName() {
    var result;
    $.ajax({
        async: false,
        type: "POST",
        url: '/admin/user/checkUserName',
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: {"username": $("#userName").val(), "id": $("#userId").val()},
        dataType: "json",
        success: function (data) {
            if(data.code==1) {
                $("#userNameTips").html(data.msg);
                result=1;
            }
            if(data.code==0) {
                $("#userNameTips").html(data.msg);
                result=0;
            }
        },
        error: function () {
        }
    })
    return result;
}

function checkUserEmail() {
    var result;
    $.ajax({
        async: false,
        type: "POST",
        url: '/admin/user/checkUserEmail',
        contentType: "application/x-www-form-urlencoded; charset=utf-8",
        data: {"email": $("#userEmail").val(), "id": $("#userId").val()},
        dataType: "json",
        success: function (data) {
            if(data.code==1) {
                $("#userEmailTips").html(data.msg);
                result=1;
            }
            if(data.code==0) {
                $("#userEmailTips").html(data.msg);
                result=0;
            }
        },
        error: function () {
        }
    })
    return result;
}


layui.use(['form', 'layedit', 'laydate'], function () {
    var form = layui.form, layer = layui.layer;
    form.verify({

        userName: function (value) {
            if (value.length > 12 || value.length < 4) {
                return "User name should between 4-12";
            }
            if(checkUserName()==1) {
                return "User Exist";
            }
        },
        userEmail: function () {
            if(checkUserEmail()==1) {
                return "Email Exist";
            }
        }

    });

    form.on('submit(demo1)', function (data) {
        return true;
    });
});

