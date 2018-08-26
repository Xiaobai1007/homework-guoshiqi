<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">手机信息更新</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <%--更新表单--%>
            <div class="modal-body" style="height: 420px">
                <input type="hidden" id="id" name="id">
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
                    <input type="number" class="form-control" name="stock" id="stock" aria-describedby="emailHelp"
                           placeholder="请输入商品库存">
                </div>
                <div class="form-group">
                    <label>商品状态</label>
                    <input type="radio" name="stock" id="up" aria-label="Radio button for following text input" value="1">上架
                    <input type="radio" name="stock" id="dn" aria-label="Radio button for following text input" value="0">下架
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="update" onclick="aaa(this)">保存</button>
            </div>
        </div>
    </div>
</div>

<script>

    function update(x) {
        var bid = x.getAttribute("value");
        $.ajax({
            type: "post",
            url: "/phoneList?action=findId&id="+bid,
            data: {id: bid},
            success: function (data) {
                $("#id").val(data.id)
                $("#name").val(data.name)
                $("#price").val(data.price)
                $("#datetime").val(data.datetime)
                $("#detailed").val(data.detailed)
                $("#stock").val(data.stock)
                if(data.state == 1){
                    $("#up").prop("checked","checked")
                }else{
                    $("#dn").prop("checked","checked")
                }
            }
        })
    }

    function aaa(e){
        $.ajax({
            type: "post",
            url: "/phoneList?action=update",
            data: {id: $("#id").val(),name:$("#name").val(),price:$("#price").val(),datetime:$("#datetime").val(),detailed:$("#detailed").val(),stock:$("#stock").val(),state:$("input:checked").val()},
            success: function (data) {
                alert(data.msg);
                $("#table tr:gt(0)").remove()
                list()
                $("#exampleModal").modal('hide');
            }
        })
    }

</script>

