<%@ page import="static com.dao.RandomNumber.randomNum" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加手机</title>
    <meta name="subtitle" content="新增书籍">
</head>
<body>

<div class="form-group">
    <label for="id">商品编号</label>
    <input type="text" class="form-control" value="<%=randomNum() %>" id="id" name="id" readonly>
</div>
<div class="form-group">
    <label for="name">手机名称</label>
    <input type="text" class="form-control" name="name" id="name" aria-describedby="emailHelp"
           placeholder="请输入手机名称">
</div>
<div class="form-group">
    <label for="price">手机价格</label>
    <input type="number" class="form-control" step="1" name="price" id="price"
           aria-describedby="emailHelp" value="" placeholder="请输入手机价格">
</div>
<div class="form-group">
    <label for="datetime">上架时间</label>
    <input type="date" class="form-control" step="1" name="datetime" id="datetime"
           aria-describedby="emailHelp" value="" placeholder="请选择上架时间">
</div>
<div class="form-group">
    <label for="detailed">产品介绍</label>
    <input type="text" class="form-control" name="detailed" id="detailed" aria-describedby="emailHelp"
           placeholder="请输入产品介绍">
</div>
<div class="form-group">
    <label for="stock">商品库存</label>
    <input type="number" class="form-control" name="stock" value="50" id="stock" aria-describedby="emailHelp"
           placeholder="请输入商品库存">
</div>
<div class="form-group">
    <label>商品状态</label>
    <input type="radio" name="stock" id="up" checked="checked" aria-label="Radio button for following text input" value="1">上架
    <input type="radio" name="stock" id="dn" aria-label="Radio button for following text input" value="0">下架
</div>
<div><input type="button" onclick="add()" value="提交" class="form-control"></div>

<script>

    var myDate = new Date();
    var year=myDate.getFullYear();
    var month=myDate.getMonth()+1;
    month = month < 10 ? '0' + month : month
    var day=myDate.getDate();
    day = day < 10 ? ('0' + day) : day
    var date = year+"-"+month+"-"+day;
    $("#datetime").val(date);

    function add() {
        $.ajax({
            type: "post",
            url: "/phoneList?action=insert",
            data: {id: $("#id").val(),name:$("#name").val(),price:$("#price").val(),datetime:$("#datetime").val(),detailed:$("#detailed").val(),stock:$("#stock").val(),state:$("input:checked").val()},
            success: function (data) {
                alert(data.msg);
                $("#id").val(<%=randomNum() %>)
                $("#name").val("")
                $("#price").val("")
                $("#datetime").val(date)
                $("#detailed").val("")
                $("#stock").val("50")
                $("#up").prop("checked","checked")
            }
        })
    }
    document.querySelector("#bookadd").classList.add("active");
</script>

</body>
</html>
