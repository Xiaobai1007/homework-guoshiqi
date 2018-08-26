<%@ page import="com.dao.WebUtil" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>手机列表</title>
</head>
<body>
<%--<%= WebUtil.popSessionMsg(request) %>--%>

<table class="table table-striped" id="table">
    <tr>
        <th><input type="checkbox" onclick="alls(this)"></th>
        <th>商品编号</th>
        <th>名称</th>
        <th>价格</th>
        <th>上架时间</th>
        <th>产品介绍</th>
        <th>库存</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
</table>
<div style="margin-top: 2em;">
    <input type="submit" value="批量删除" class="btn btn-success">
</div>
<script src="/assets/js/jquery-3.3.1.min.js"></script>
<%@ include file="phone_update.jsp"%>
<script>
    var list = function(){
        $.ajax({
            type:"get",
            url:"/phoneList",
            success:function (data) {
                $.each(data,function(index,obj){
                    var tr = $("<tr/>");
                    $("<td/>").append("<input name='id' value="+obj.id+" type='checkbox'>").appendTo(tr);
                    $("<td/>").append(obj.id).appendTo(tr);
                    $("<td/>").append("<a href='/book/detail?id="+obj.id+"'>"+obj.name+"</a>").appendTo(tr);
                    $("<td/>").append(obj.price).appendTo(tr);
                    $("<td/>").append(obj.datetime).appendTo(tr);
                    $("<td/>").append(obj.detailed).appendTo(tr);
                    $("<td/>").append(obj.stock).appendTo(tr);
                    if(obj.state == 1){
                        $("<td/>").append("<button type='button' disabled='disabled' class='btn btn-success'>上架</button>").appendTo(tr);
                    }else{
                        $("<td/>").append("<button type='button' disabled='disabled' class='btn btn-secondary'>下架</button>").appendTo(tr);
                    }
                    $("<td/>").append("<button type='button' value='"+obj.id+"' onclick='update(this)' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>更新</button> <button type='button' value='"+obj.id+"' onclick='del(this)' class='btn btn-primary' data-toggle='modal'>删除</button>").appendTo(tr);
                    $("#table").append(tr);
                })
            }
        })
    }
    list();

    function alls(e) {
        var checkboxs = document.getElementsByName("id");
        for (var i = 0; i < checkboxs.length; i++) {
            checkboxs[i].checked = e.checked
        }
    }

    function del(x) {
        var bid = x.getAttribute("value");
        $.ajax({
            type: "post",
            url: "/phoneList?action=del&id="+bid,
            data: {id: bid},
            success: function (data) {
                $("#table tr:gt(0)").remove()
                alert(data.msg)
                list()
            }
        })
    }

</script>

</body>
</html>
