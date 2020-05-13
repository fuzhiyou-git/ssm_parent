/*添加用户*/
function addUser() {
    var mobile = $("form div input[name='phoneNum']").val();
    var email = $("form div input[name='email']").val();
    var username = $("form div input[name='username']").val();
    if (checkPhoneAndEmail(mobile, email)) {
        if (confirm("您确定要新建" + username + "用户吗？")) {
            $.post({
                url: "/user/addUser",
                data: $("#addform").serialize(),
                success: function (msg) {
                    if (msg) {
                        alert("新建用户成功");
                        location.reload();
                    } else {
                        alert("添加失败");
                    }
                }, error: function () {
                    alert("服务器忙");
                }
            });
        }
    }
}

/*删除用户*/
function deleteUserById(id, username) {
    //用户安全提示
    if (confirm("您确定要删除用户" + username + "吗？")) {
        $.post({
            url: "/user/deleteById",
            data: {id: id},
            success: function (msg) {
                if (msg) {
                    alert("您已成功删除" + username + "用户");
                    location.reload();
                } else {
                    alert("该用户有角色，不能删除");
                }

            }, error: function () {
                alert("服务器忙");
            }
        });
    }
}

/*给删除选中用户*/
/*function delSelectedUsers() {
    var length = findLength();
    if (length) {
        var ids = getAllSelectedId();
        if (confirm("您确定要删除选中的" + length + "条数据吗？")) {
            $.post({
                url: "/user/delSelected",
                contentType: 'application/json',
                data: JSON.stringify(ids),
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
}*/

/*查询用户名是否存在*/
$("form div input[name='username']").blur(function () {
    var username = $(this).val();
    $.post({
        url: "/user/checkUsername",
        data: {username: username},
        success: function (msg) {
            if (msg) {
                //用户名存在
                alert(username + "用户已经存在，请您重新输入");
                $("form div button[class='btn btn-primary']").prop("disabled", true);
            } else {
                $("form div button[class='btn btn-primary']").prop("disabled", false);
            }
        }, error: function () {
            alert("服务器忙");
        }
    });
});

/*改变用户的状态*/
function changeStatus(id, Status, username) {
    if (Status == 1) {
        if (confirm("您确定要关闭用户" + username + "吗？")) {
            $.post({
                url: "/user/changeStatusAs_0",
                data: {id: id},
                success: function (msg) {
                    if (msg) {
                        alert("您已成功关闭" + username + "用户");
                        location.reload();
                    } else {
                        alert("无法关闭，稍后等待");
                    }
                }, error: function () {
                    alert("服务器忙");
                }
            });
        }
    }

    if (Status == 0) {
        if (confirm("您确定要开启用户" + username + "吗？")) {
            $.post({
                url: "/user/changeStatusAs_1",
                data: {id: id},
                success: function (msg) {
                    if (msg) {
                        alert("您已成功开启" + username + "用户");
                        location.reload();
                    } else {
                        alert("无法开启，稍后等待");
                    }
                }, error: function () {
                    alert("服务器忙");
                }
            });
        }
    }
}

/*查询所有用户*/
function showData(page, pageSize) {
    //获取查询条件
    var username = $("div input[name='usernameCondition']").val();
    var phoneNum = $("div input[name='phoneNumCondition']").val();

    $.post({
        url: "/user/findAllUser",
        data: {page: page, pageSize: pageSize, username: username, phoneNum: phoneNum},
        success: function (pageInfo) {
            //填充数据展示内容
            var html = "";
            $(pageInfo.list).each(function (i, user) {
                html += ' <tr>\n' +
                    '                                          <td><input name="ids"  type="checkbox" value="' + user.id + '" class="icheckbox_square-blue">\n' +
                    '                                          </td>\n' +
                    '                                          <td>' + user.username + '</td>\n' +
                    '                                          <td>' + user.email + '</td>\n' +
                    '                                          <td>' + user.phoneNum + '</td>\n' +
                    '                                          <td><a id="Status" class="userStatus"\n' +
                    '                                                                 href=\'javascript:void(0);\'\n' +
                    '                                                                 onclick="changeStatus(' + user.id + ',' + user.status + ',\'' + user.username + '\')">\n' +
                    '                                              <div id="userStatus">' + user.statusStr + '</div>\n' +
                    '                                          </a>\n' +
                    '                                          </td>\n' +
                    '  \n' +
                    '  \n' +
                    '                                          <td class="text-center">\n' +
                    '                                      <button type="button" id="editorU" class="btn bg-purple-active btn-xs" disabled="disabled" onclick="findById(' + user.id + ')"> 详情 </button>  \n' +
                    '  \n' +
                    '  \n' +
                    '                                              \n' +
                    '                                                  <button type="button" class="btn bg-olive btn-xs" title="删除" disabled="disabled" id="deleteU" onclick="deleteUserById(' + user.id + ',\'' + user.username + '\')">删除</button>    \n' +
                    '                                              \n' +
                    '                                              <button class="btn bg-light-blue-active btn-xs" type="button"\n' +
                    '                                                 onclick="toNoRoleByUserId(' + user.id + ')" >\n' +
                    '                                              添加角色</button>\n' +
                    '                                          </td>\n' +
                    '                                      </tr>';
            });
            $("#tbody").html(html);

            //判断哪些用户可以看到添加按钮
            findAllPermission();
            //回显分页数据，总共几页
            getPageInfo(pageInfo);
        }
    });
}

/*修改用户*/
function updateUer() {
    var email = $("form section div input[name='email'] ").val();
    var phoneNum = $("form section div input[name='phoneNum'] ").val();
    if (checkPhoneAndEmail(phoneNum, email)) {
        $.post({
            url: "/user/updateUser",
            data: $("#form").serialize(),
            success: function (msg) {
                if (msg) {
                    alert("更改成功");
                    location.href = "/user/toUserList";
                } else {
                    alert("用户名已经存在,请您更换");
                    $("form section div input[name='username']").focus();
                }
            }, error: function () {
                alert("服务器忙，请稍后更改");
            }
        });
    }
}

/*查询用户所有的角色*/
function findRoleByUserId(page, pageSize, id) {
    $.post({
        url: "/user/findRoleByUserId",
        data: {page: page, pageSize: pageSize, id: id},
        success: function (pageInfo) {
            var dataHtml = "";
            $(pageInfo.list).each(function (i, role) {
                dataHtml += '<tr>\n' +
                    '                    <td>\n' +
                    '\n' +
                    '                        <input name="ids" type="checkbox" value="' + role.id + '">\n' +
                    '\n' +
                    '                    </td>\n' +
                    '                    <td>' + role.id + '</td>\n' +
                    '                    <td>' + role.roleName + '</td>\n' +
                    '                    <td>' + role.roleDesc + '</td>\n' +
                    '                    <td class="text-center">\n' +
                    '                        <div class="tab-pane" id="tab-model">\n' +
                    '\n' +
                    '                            <button type="button" class="btn bg-info btn-xs" data-toggle="modal" data-target="#myModal"\n' +
                    '                                    onclick="findPermissionByRoleId(' + role.id + ')">查看权限\n' +
                    '                            </button>\n' +
                    '\n' +
                    '                            <button type="button" class="btn bg-info btn-xs" id="delete"\n' +
                    '                                    \n' +
                    '                                    onclick="deleteRoleById(' + role.id + ',\'' + role.roleName + '\',' + id + ')">\n' +
                    '                                 删除\n' +
                    '                            </button>\n' +
                    '                             <div id="myModal" class="modal modal-primary" role="dialog">\n' +
                    '                                 <div class="modal-dialog modal-lg">\n' +
                    '                                     <div class="modal-content">\n' +
                    '                                         <div class="modal-header">\n' +
                    '                                             <button type="button" class="close" data-dismiss="modal"\n' +
                    '                                                     aria-label="Close">\n' +
                    '                                                 <span aria-hidden="true">&times;</span></button>\n' +
                    '                                             <h4 class="modal-title"></h4>\n' +
                    '                                         </div>\n' +
                    '                                         <div class="modal-body">\n' +
                    '                                             <div class="box-body">\n' +
                    '                                                 <div class="form-horizontal">\n' +
                    '                                                     <div class="form-group">\n' +
                    '                                                         <table id="dataList"\n' +
                    '                                                                class="table table-bordered table-striped table-hover dataTable">\n' +
                    '                                                             <tr>\n' +
                    '                                                                 <th>\n' +
                    '                                                                     权限ID\n' +
                    '                                                                 </th>\n' +
                    '                                                                 <th>\n' +
                    '                                                                     权限名称\n' +
                    '                                                                 </th>\n' +
                    '                                                                 <th>\n' +
                    '                                                                     权限路径\n' +
                    '                                                                 </th>\n' +
                    '                                                             </tr>\n' +
                    '\n' +
                    '                                                             <tbody id="tbody_permission"></tbody>\n' +
                    '                                                         </table>\n' +
                    '                                                     </div>\n' +
                    '                                                 </div>\n' +
                    '                                             </div>\n' +
                    '                                         </div>\n' +
                    '                                     </div>\n' +
                    '                                 </div>\n' +
                    '                             </div>\n' +
                    '                        </div>\n' +
                    '                    </td>\n' +
                    '                </tr>';
            });
            $("#tbody_role").html(dataHtml);
        }
    });
}

/*查询角色有的权限*/
function findPermissionByRoleId(id) {
    $.post({
        url: "/role/findPermissionByRoleId",
        data: {pages: 1, pageSize: 100, id: id},
        success: function (pageInfo) {
            var html = "";
            $(pageInfo.list).each(function (i, permission) {
                var permissionId = permission.id;
                var permissionName = permission.permissionName;
                var url = permission.url;
                html += '<tr>\n' +
                    '                                                                        <td>\n' +
                    '                                                                            ' + permissionId + '\n' +
                    '                                                                        </td>\n' +
                    '                                                                        <td>\n' +
                    '                                                                            ' + permissionName + '\n' +
                    '                                                                        </td>\n' +
                    '                                                                        <td>\n' +
                    '                                                                            ' + url + '/\n' +
                    '                                                                        </td>\n' +
                    '                                                                    </tr>';
            });

            //更新页面对应位置
            $("#tbody_permission").html(html);

        }
    });
}

/*删除角色*/
function deleteRoleById(id, roleName, userId) {
    //用户安全提示
    if (confirm("您确定要删除" + roleName + "角色吗？")) {
        $.post({
            url: "/user/deleteRoleById",
            data: {
                id: id, userId: userId
            }, success: function (msg) {
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

function toNoRoleByUserId(id) {
    //页面跳转
    location.href = "/user/toNoRoleByUserId/" + id;
}

/*查询用户没有的角色*/
function findNoRoleByUserId(page, pageSize, id) {
    $.post({
        url: "/user/findNORoleByUserId",
        data: {page: page, pageSize: pageSize, id: id},
        success: function (pageInfo) {
            var html = "";
            $(pageInfo.list).each(function (i, role) {
                //填充内容区域
                html += '<tr>\n' +
                    '                            <td>\n' +
                    '\n' +
                    '                                <input name="ids" type="checkbox" value="' + role.id + '" class="icheckbox_square-blue">\n' +
                    '\n' +
                    '                            </td>\n' +
                    '                            <td>' + role.id + '</td>\n' +
                    '                            <td >' + role.roleName + '\n' +
                    '                            </td>\n' +
                    '                            <td>' + role.roleDesc + '</td>\n' +
                    '\n' +
                    '                        </tr>';
            });
            //填写内容数据
            $("#tbody").html(html);

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
            fenye += '<li><a href="javascript:findNoRoleByUserId(1,' + pageSize + ',' + id + ')"><b>首页</b></a></li>\n' +
                '<li><a href="javascript:findNoRoleByUserId(' + prePage + ',' + pageSize + ',' + id + ')"><b>上一页</b></a></li>\n' +
                '<li><a href="javascript:findNoRoleByUserId(' + nextPage + ',' + pageSize + ',' + id + ')"><b>下一页</b></a></li>\n' +
                '<li><a href="javascript:findNoRoleByUserId(' + pages + ',' + pageSize + ',' + id + ')"><b>尾页</b></a></li>';
            //写到分页栏中
            $(".pagination").html(fenye);
        }
    });
}

/*添加角色给用户*/
function addRoleToUser(userId) {
    var length = findLength();
    if (length > 0) {
        if (confirm("您是否要添加" + length + "个角色给用户？")) {
            var roleIds = getAllSelectedId();
            $.post({
                url: "/user/addRoleToUser/" + userId,
                contentType: 'application/json',
                data: JSON.stringify(roleIds),
                success: function (msg) {
                    if (msg) {
                        alert("添加成功");
                        location.href = "/user/toUserList";
                    } else {
                        alert("添加失败");
                    }
                }, error: function () {
                    alert("服务器忙");
                }
            });
        }
    }


}

/*刷新页面*/
function refresh() {
    location.href = "/user/toUserList";
}

/*根据id查询用户*/
function findById(id) {
    location.href = "/user/findUserById/" + id;
}

//修改密码
function updatePassword() {
    //1.获取新密码的输入框的值
    var password = $("div input[name='password']").val();
    //2.获取确认新密码输入框的值
    var newPassword = $("div input[name='newPassword']").val();
    //3.判断两个输入框的值是否相等
    if (password == newPassword) {
        //密码相等
        if (confirm("您确认要修改密码为" + newPassword + "吗？")) {
            $.post({
                url: "/user/updatePassword",
                data: $("#form").serialize(),
                dataType: "json",
                success: function (msg) {
                    if (msg) {
                        alert("密码已修改成功");
                        location.href = "../../login.jsp"
                    } else {
                        alert("修改密码失败");
                    }
                }, error: function () {
                    alert("服务器忙");
                }
            });
        }
    } else {
        alert("您输入的密码不一致，请重新确认");
    }
}