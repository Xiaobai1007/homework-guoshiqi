<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">小白手机店</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">首页</a></li>
                <li><a href="#">设置</a></li>
                <li><a href="#">帮助</a></li>
            </ul>
            <div class="navbar-form navbar-right">
                <input type="text" id="findByName" class="form-control" placeholder="请输入查询条件(回车键搜索)" name="name">
            </div>
        </div>
    </div>
</nav>
<script src="/assets/js/jquery-3.3.1.min.js"></script>
<script>
    $("#findByName").focus(function(){
        $("body").keydown(function() {
            if (event.keyCode == "13") {//keyCode=13是回车键
                $.ajax({
                    url:"/phoneList?action=findName",
                    type:"post",
                    data:{name:$("#findByName").val()},
                    success:function (data) {
                        $("#table tr:gt(0)").remove();
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
                                $("<td/>").append("上架").appendTo(tr);
                            }else{
                                $("<td/>").append("下架").appendTo(tr);
                            }
                            $("<td/>").append("<button type='button' value='"+obj.id+"' onclick='update(this)' class='btn btn-primary' data-toggle='modal' data-target='#exampleModal'>更新</button> <button type='button' value='"+obj.id+"' onclick='del(this)' class='btn btn-primary' data-toggle='modal'>删除</button>").appendTo(tr);
                            $("#table").append(tr);
                        })
                    }
                })
            }
        });
    })
</script>