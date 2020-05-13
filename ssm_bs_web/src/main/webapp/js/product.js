$(document).ready(function () {
    // 激活导航位置
    setSidebarActive("order-manage");
    $("#datepicker-a3").datetimepicker({
        format: "yyyy-mm-dd hh:ii",
        autoclose: true,
        todayBtn: true,
        language: "zh-CN"

    });
});

function refresh_product() {
    location.href = "/product/list";
}

function toProduct() {
    location.href = "/product/add";
}

/*删除选中*/
function delSelectedProduct() {
    var length = findLength();
    if (length) {
        var ids = getAllSelectedId();
        if (confirm("您确定要删除选中的" + length + "条数据吗？")) {
            $.post({
                url: "/product/delSelectedProduct",
                contentType: 'application/json',
                data: JSON.stringify(ids),
                success: function (msg) {
                    if (msg) {
                        alert("删除成功");
                        location.reload();
                    } else {
                        alert("不能删除产品,有会员购买中");
                    }
                }, error: function () {
                    alert("服务器忙");
                }
            });
        }
    }
}

/*产品列表*/
function showData(page, pageSize) {
    //获取产品查询条件
    var productPrice = $("div input[name='productPrice']").val();
    var cityName = $("div input[name='cityName']").val();
    var productName = $("div input[name='productName']").val();

    var reg = /((^[1-9]\d*)|^0)(\.\d{0,2}){0,1}$/;
    if (reg.test(productPrice) || productPrice == "") {
        $.post({
            url: "/product/findAllProduct",
            data: {
                page: page, pageSize: pageSize,
                cityName: cityName,
                productName: productName,
                productPrice: productPrice
            },
            success: function (pageInfo) {
                //产品列表填充
                var html = "";
                $(pageInfo.list).each(function (i, product) {
                    html += '<tr>\n' +
                        '                                                <td><input name="ids" type="checkbox"\n' +
                        '                                                           value="' + product.id + '" class="icheckbox_square-blue">\n' +
                        '                                                </td>\n' +
                        '                                                <td>' + product.productNum + '</td>\n' +
                        '                                                <td>' + product.productName + '</td>\n' +
                        '                                                <td>' + product.cityName + '</td>\n' +
                        '                                                <td>' + product.departureTimeStr + '</td>\n' +
                        '                                                <td>￥' + product.productPrice + '</td>\n' +
                        '                                                <td>' + product.productStatusStr + '\n' +
                        '                                                </td>\n' +
                        '\n' +
                        '                                                <td class="text-center">\n' +
                        '\n' +
                        '                                                    <button type="button" id="editor" class="btn bg-purple-active btn-xs"\n' +
                        '                                                onclick="findById(' + product.id + ')"><b>编辑</b>\n' +
                        '                                        </button>\n' +
                        '                                                    <button type="button" class="btn bg-olive btn-xs" onclick="deleteProduct(' + product.id + ',\'' + product.productNum + '\')">\n' +
                        '                                                        删除</button>\n' +
                        '                                                </td>\n' +
                        '                                            </tr>';
                });
                //填充到产品内容列表中
                $("#tbody").html(html);
                //回显分页数据，总共几页
                getPageInfo(pageInfo);
            }, error: function () {
                alert("服务器忙");
            }
        });
    } else {
        alert("请输入正确的价格");
    }
}

//删除产品数据;
function deleteProduct(id, productNum) {
    //用户安全提示
    if (confirm("您确定要删除编号为" + productNum + "的产品吗？")) {
        $.post({
            url: "/product/deleteById",
            data: {id: id},
            success: function (msg) {
                if (msg) {
                    alert("删除成功");
                    location.href = "/product/list";
                } else {
                    alert("该产品有会员购买，不能删除");
                }
            }, error: function () {
                alert("服务器忙");
            }
        });
    }
}

function findById(id) {
    location.href = "/product/findById/" + id;
}

/*查询产品编号*/
function checkProductNum() {
    var productNum = $("div input[name='productNum']").val();
    $.post({
        url: "/product/checkProductNum",
        data: {productNum: productNum},
        success: function (msg) {
            if (msg) {
                //产品编号存在，设置按钮不可用
                alert("您输入的产品编号已经存在，请您更换");
                $("div button[class='btn bg-red-active']").prop("disabled", true);
            } else {
                //产品编号不存在，设置按钮可用
                $("div button[class='btn bg-red-active']").prop("disabled", false);
            }
        }, error: function () {
            alert("服务器忙");
        }
    });
}

/*添加产品*/
function addProduct() {
    //校验产品价格
    var productPrice = $("div input[name='productPrice']").val();
    //规定正则表达式
    var reg = /((^[1-9]\d*)|^0)(\.\d{0,2}){0,1}$/;
    //2.1价格正确，添加
    if (reg.test(productPrice)) {
        $.post({
            url: "/product/addProduct",
            data: $("#addform").serialize(),
            success: function (msg) {
                if (msg) {
                    alert("添加产品成功");
                    location.href = "/product/list";
                } else {
                    alert("添加产品失败");
                }
            }, error: function () {
                alert("服务器忙");
            }
        });
    } else {
        alert("请输入正确的产品价格");
    }
}

//更新产品信息
function updateProduct() {
    //1.验证产品价格的输入的是否正确
    var productPrice = $("form div input[name='productPrice']").val();
    //2.进行规则检验
    var reg = /((^[1-9]\d*)|^0)(\.\d{0,2}){0,1}$/;
    if (reg.test(productPrice)) {
        if (confirm("您确定要更改产品吗?")) {
            $.post({
                url: "/product/updateProduct",
                data: $("#form").serialize(),
                success: function (msg) {
                    if (msg) {
                        alert("更改产品成功");
                        location.href = "/product/list";
                    } else {
                        alert("产品编号已经存在");
                        //$("#productNu").focus();
                    }
                }, error: function () {
                    alert("服务器忙");
                }
            });
        }

    } else {
        alert("请您输入正确的价格");
    }
}