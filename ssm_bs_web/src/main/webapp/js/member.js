/*添加会员*/
function addMember() {
    var email = $("form div input[name='email'] ").val();
    var mobile = $("form div input[name='phoneNum'] ").val();
    //验证邮箱和手机号
    if (checkPhoneAndEmail(mobile, email)) {
        if (confirm("您是否要添加会员" + $("form div input[name='name']").val() + "?")) {
            $.post({
                url: "/member/addMember",
                data: $("#addform").serialize(),
                success: function (msg) {
                    if (msg) {
                        alert("添加成功");
                        location.reload();
                    } else {
                        alert("会员名已经存在，请您重新输入");
                        $("#memberNameM").focus();
                    }
                }, error: function () {
                    alert("服务器忙");
                }
            });
        }
    }
}

/*验证会员名是否存在*/
function checkMember() {
    var memberName = $("form div input[name='name']").val();
    $.post({
        url: "/member/checkMemberName",
        data: {memberName: memberName},
        success: function (msg) {
            if (msg) {
                //存在会员名，设置按钮不可用
                alert("您输入的会员名已经存在，请重新输入");
                $("form div button[class='btn btn-primary']").prop("disabled", true);
            } else {
                //不存在，设置按钮可用
                $("form div button[class='btn btn-primary']").prop("disabled", false);
            }
        }, error: function () {
            alert("服务器忙");
        }
    });
}

/*根据ID删除会员*/
function deleteMember(id, name) {
    if (confirm("您确定要删除会员" + name + "吗？")) {
        $.post({
            url: "/member/deleteById",
            data: {id: id},
            success: function (msg) {
                if (msg) {
                    //刷新当前页面
                    alert("删除成功");
                    location.reload();
                } else {
                    alert("删除失败");
                }
            }, error: function () {
                alert("服务器忙");
            }
        });
    }
}

/*查询会员和产品*/
function findById(id) {
    location.href = "/member/findById/" + id;
}

/*修改会员*/
function updateMember() {
    var phoneNum = $("form div input[name='phoneNum']").val();
    var email = $("form div input[name='email']").val();
    if (checkPhoneAndEmail(phoneNum, email)) {
        if (confirm("您确定要修改吗？")) {
            $.post({
                url: "/member/updateMember",
                data: $("#form").serialize(),
                success: function (msg) {
                    if (msg) {
                        alert("修改成功");
                        location.href = "/member/toMember?pwd=list";
                    } else {
                        alert("会员名已经存在，请您更换");
                        $("#memberName").focus();
                    }
                }, error: function () {
                    alert("服务器忙");
                }
            });
        }
    }
}

/*查询会员的产品*/
function showAllProducts(page, pageSize, id) {
    $.post({
        url: "/member/findProductsByMemberId",
        data: {id: id, page: page, pageSize: pageSize},
        success: function (pageInfo) {
            var html = "";
            $(pageInfo.list).each(function (i, product) {
                html += '  <tr class="tbody_class">\n' +
                    '                        \n' +
                    '\n' +
                    '                            \n' +
                    '\n' +
                    '     \n' +
                    '\n' +
                    '                        <td >' + product.productNum + '</td>\n' +
                    '                        <td >' + product.productName + '</td>\n' +
                    '                        <td>' + product.cityName + '</td>\n' +
                    '                        <td>' + product.departureTimeStr + '</td>\n' +
                    '                        <td>' + product.productPrice + '</td>\n' +
                    '                        <td>' + product.productDesc + '</td>\n' +
                    '                        <td>\n' +
                    '                            <div>\n' +
                    '                                <a href="javascript:deleteProductByMemberId(' + product.id + ',' + id + ');"\n' +
                    '                                   class="btn bg-olive btn-xs f">删除</a>\n' +
                    '                            </div>\n' +
                    '\n' +
                    '                        </td>\n' +
                    '                    </tr>';
            });
            $("#tbody").html(html);

            //回显分页数据
            findProductPageById(pageInfo, id);
        }
    });
}

function deleteProductByMemberId(productId, memberId) {
    if (confirm("您确定要删除吗?")) {
        $.post({
            url: "/member/delProductByMemberId",
            data: {memberId: memberId, productId: productId},
            success: function (msg) {
                if (msg) {
                    alert("删除成功");
                    location.reload();
                } else {
                    alert("删除失败");
                }
            }, error: function () {
                alert("服务器忙");
            }
        });
    }

}

/*刷新会员页面*/
function refresh() {
    location.href = "/member/toMember?pwd=list"
}

function showData(page, pageSize) {
    var email = $("div input[name='emailCondition']").val();
    var phoneNum = $("div input[name='phoneNumCondition']").val();
    var name = $("div input[name='nameCondation']").val();
    $.post({
        url: "/member/findAllMember",
        data: {page: page, pageSize: pageSize, email: email, phoneNum: phoneNum, name: name},
        success: function (pageInfo) {
            var dataHtml = "";
            $(pageInfo.list).each(function (i, member) {
                dataHtml += '  <tr>\n' +
                    '                                    <td style="padding-right: 0px"><input\n' +
                    '                                            id="firstCb" type="checkbox" class="icheckbox_square-blue">\n' +
                    '                                    </td>\n' +
                    '                                    <td>' + member.name + '</td>\n' +
                    '                                    <td>' + member.nickname + '</td>\n' +
                    '                                    <td>' + member.phoneNum + '</td>\n' +
                    '                                    <td>' + member.email + '</td>\n' +
                    '                                    <td> <button type="button" id="editor" class="btn bg-purple-active btn-xs"\n' +
                    '                                                onclick="findById(' + member.id + ')"><b>详情</b>\n' +
                    '                                        </button>\n' +
                    '                                        <button type="button" id="delete" class="btn bg-olive btn-xs"\n' +
                    '                                                onclick="deleteMember(' + member.id + ',\'' + member.name + '\')"><b>删除</b>\n' +
                    '                                        </button></td>\n' +
                    '                                </tr>';

            });
            $("#tbody").html(dataHtml);

            //回显分页数据，总共几页
            getPageInfo(pageInfo);
        }

    });

}

/*查询所有未添加的产品*/
function toMember_Product(id) {

    location.href = "/member/toMember_Product/" + id;
}

/*查询所有未添加的产品*/
function findAllNoProductByMemberId(page, pageSize, id) {
    var productNum = $("div input[name='productNum']").val();
    var productName = $("div input[name='productName']").val();
    $.post({
        url: "/member/findAllNoProductByMemberId",
        data: {page: page, pageSize: pageSize, id: id, productNum: productNum, productName: productName},
        success: function (pageInfo) {
            var dataHtml = "";
            $(pageInfo.list).each(function (i, product) {
                dataHtml += ' <tr>\n' +
                    '                            <td>\n' +
                    '\n' +
                    '                                <input name="ids" type="checkbox" value="' + product.id + '" class="icheckbox_square-blue">\n' +
                    '\n' +
                    '                            </td>\n' +
                    '                            <td>' + product.productNum + '</td>\n' +
                    '                            <td>' + product.productName + '</td>\n' +
                    '                            <td>' + product.cityName + '</td>\n' +
                    '                            <td>' + product.departureTimeStr + '</td>\n' +
                    '                            <td>' + product.productPrice + '</td>\n' +
                    '                            <td>' + product.productDesc + '</td>\n' +
                    '                            <td>' + product.productStatusStr + '</td>\n' +
                    '                        </tr>';

            });
            $("#tbody").html(dataHtml);

            //回显分页数据
            findProductPageMemberId(pageInfo, id);

        }
    });
}

/*分页数据*/
function findProductPageMemberId(pageInfo, id) {
    //回显分页数据，总共几页
    $("#pages").text(pageInfo.pages);
    //几条数据
    $("#total").text(pageInfo.total);

    //分页点击按钮的回显
    //获取下一页数据,第一个参数pages
    var prePage = pageInfo.prePage;//上一页
    var nextPage = pageInfo.nextPage;//下一页

    var pageSize = pageInfo.pageSize; //每页显示几条
    var pages = pageInfo.pages; //尾页
    var fenye = "";
    fenye += '<li><a href="javascript:findAllNoProductByMemberId(1,' + pageSize + ',' + id + ')"><b>首页</b></a></li>\n' +
        '<li><a href="javascript:findAllNoProductByMemberId(' + prePage + ',' + pageSize + ',' + id + ')"><b>上一页</b></a></li>\n' +
        '<li><a href="javascript:findAllNoProductByMemberId(' + nextPage + ',' + pageSize + ',' + id + ')"><b>下一页</b></a></li>\n' +
        '<li><a href="javascript:findAllNoProductByMemberId(' + pages + ',' + pageSize + ',' + id + ')" aria-label="Next"><b>尾页</b></a></li>';
    //写到分页栏中
    $(".pagination").html(fenye);
}

/*添加产品给会员*/
function addProductToMember(memberId) {
    var length = findLength();
    //判断是否选中
    if (confirm("您是否要添加" + length + "个产品给会员吗？")) {
        //获取产品ids
        var productIds = getAllSelectedId();
        $.post({
            url: "/member/addProductToMember/" + memberId,
            contentType: 'application/json',
            data: JSON.stringify(productIds),
            success: function (msg) {
                if (msg) {
                    location.href = "/member/toMember?pwd=list";
                } else {
                    alert("添加产品失败");
                }
            }, error: function () {
                alert("服务器忙");
            }
        });
    }

}