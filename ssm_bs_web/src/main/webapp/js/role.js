/*查询角色没有的权限*/
function findNoPermissionByRoleId(pages, pageSize, id) {
    $.post({
        url: "/role/findNoPermissionByRoleId",
        data: {pages: pages, pageSize: pageSize, id: id},
        success: function (pageInfo) {
            var html = "";
            $(pageInfo.list).each(function (i, permsission) {
                html += '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="' + permsission.id + '" class="icheckbox_square-blue"></td>\n' +
                    '                                        <td >' + permsission.id + '</td>\n' +
                    '                                        <td >' + permsission.permissionName + '</td>\n' +
                    '                                        <td >' + permsission.url + '</td>\n' +
                    '                                         </tr>';
            });
            //更新内容区域
            $("#tbody").html(html);

            //回显分页数据
            findPermissionPageRoleId(pageInfo, id);

        }
    });
}


function findPermissionPageRoleId(pageInfo, id) {
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
    //var id =  ${role.id};
    var fenye = "";
    fenye += '<li><a href="javascript:findNoPermissionByRoleId(1,' + pageSize + ',' + id + ')"><b>首页</b></a></li>\n' +
        '<li><a href="javascript:findNoPermissionByRoleId(' + prePage + ',' + pageSize + ',' + id + ')"><b>上一页</b></a></li>\n' +
        '<li><a href="javascript:findNoPermissionByRoleId(' + nextPage + ',' + pageSize + ',' + id + ')"><b>下一页</b></a></li>\n' +
        '<li><a href="javascript:findNoPermissionByRoleId(' + pages + ',' + pageSize + ',' + id + ')" aria-label="Next"><b>尾页</b></a></li>';
    //写到分页栏中
    $(".pagination").html(fenye);
}

/*查询角色已经有的权限*/
function showPermissionByRoleId(pages, pageSize, id) {
    $.post({
        url: "/role/findPermissionByRoleId",
        data: {pages: pages, pageSize: pageSize, id: id},
        success: function (pageInfo) {
            var html = "";
            $(pageInfo.list).each(function (i, permsission) {
                html += ' <tr>\n' +
                    '                        \n' +
                    '                        <td>' + permsission.id + '</td>\n' +
                    '                        <td>' + permsission.permissionName + '</td>\n' +
                    '                        <td>' + permsission.url + '</td>\n' +
                    '                        <td>\n' +
                    '                            <button type="button" class="btn bg-olive btn-xs f" onclick="deletePermissionByRoleId(' + permsission.id + ',' + id + ')">删除</button>\n' +
                    '\n' +
                    '                        </td>\n' +
                    '                    </tr>';
            });
            //更新内容区域
            $("#tbody").html(html);

            //更新分页数据
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
            fenye += '<li><a href="javascript:showPermissionByRoleId(1,' + pageSize + ',' + id + ')"><b>首页</b></a></li>\n' +
                '<li><a href="javascript:showPermissionByRoleId(' + prePage + ',' + pageSize + ',' + id + ')"><b>上一页</b></a></li>\n' +
                '<li><a href="javascript:showPermissionByRoleId(' + nextPage + ',' + pageSize + ',' + id + ')"><b>下一页</b></a></li>\n' +
                '<li><a href="javascript:showPermissionByRoleId(' + pages + ',' + pageSize + ',' + id + ')"><b>尾页</b></a></li>';
            //写到分页栏中
            $(".pagination").html(fenye);

        }
    });
}

/*添加权限给角色*/
function addPermissionToRole(id) {
    var length = findLength();
    if (confirm("您是否要添加" + length + "个权限")) {
        var permissionIds = getAllSelectedId();
        $.post({
            url: "/role/addPermissionToRole/" + id,
            contentType: 'application/json',
            data: JSON.stringify(permissionIds),
            success: function (msg) {
                if (msg) {
                    alert("添加成功");
                    location.href = "/role/toRoleList";
                } else {
                    alert("添加失败");
                }
            }, error: function () {
                alert("服务器忙");
            }
        });
    }
}

/*删除角色的权限*/
function deletePermissionByRoleId(permissionId, roleId) {
    if (confirm("您确定要删除该权限吗？")) {
        $.post({
            url: "/role/deletePermission",
            data: {permissionId: permissionId, roleId: roleId},
            success: function (msg) {
                if (msg) {
                    alert("删除成功");
                    location.reload();
                } else {
                    alert("该角色有用户，不能删除");
                }
            }, error: function () {
                alert("服务器忙");
            }
        });
    }
}

/*添加角色*/
function addRole() {
    //添加角色
    if (confirm("您确定要添加该角色吗？")) {
        $.post({
            url: "/role/addRole",
            data: $("#addform").serialize(),
            success: function (msg) {
                if (msg) {
                    alert("添加成功");
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

/*查询角色名是否存在*/
function checkRoleName() {
    var roleName = $(" form div input[name='roleName']").val();
    $.post({
        url: "/role/checkRoleName",
        data: {roleName: roleName}, success: function (msg) {
            if (msg) {
                alert("角色名称已经存在，请您重新输入");
                $("form div button[class='btn btn-primary']").prop("disabled", true);

            } else {
                $("form div button[class='btn btn-primary']").prop("disabled", false);
            }
        }, error: function () {
            alert("服务器忙");
        }
    });
}

//删除角色
function deleteRoleById(id, roleName) {
    if (roleName == "ADMIN" || roleName == "USER") {
        alert("您没有删除的权限，请重新确认");
        return false;
    } else {
        if (confirm("您确定要删除吗？")) {
            $.post({
                url: "/role/deleteById",
                data: {id: id}, success: function (msg) {
                    if (msg) {
                        alert("删除成功");
                        location.reload();
                    } else {
                        alert("该角色有用户，不能删除");
                    }

                }, error: function () {
                    alert("您没有删除的权限");
                }
            });
        }
    }
}

/*修改角色*/
function updateRole() {
    $.post({
        url: "/role/updateRole",
        data: $("#form").serialize(),
        success: function (msg) {
            if (msg) {
                alert("修改成功");
                location.href = "/role/toRoleList";
            } else {
                alert("角色名称已经存在,请您更换");
                $("#RN").focus();
            }

        }, error: function () {
            alert("服务器忙");
        }
    });
}

function refresh() {
    location.href = "/role/toRoleList";
}

function showData(pages, pageSize) {
    //获取查询条件
    var roleName = $("div input[name='roleNameCondition']").val();
    var roleDesc = $("div input[name='roleDescCondition']").val();
    $.post({
        url: "/role/findAllRole",
        data: {pages: pages, pageSize: pageSize, roleName: roleName, roleDesc: roleDesc},
        success: function (pageInfo) {
            var dataHtml = "";
            $(pageInfo.list).each(function (i, role) {
                var id = role.id;
                var roleName = role.roleName;
                var roleDesc = role.roleDesc;
                dataHtml += '<tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="' + id + '" class="icheckbox_square-blue"></td>\n' +
                    '                                        <td>' + id + '</td>\n' +
                    '                                        <td>' + roleName + '</td>\n' +
                    '                                        <td>' + roleDesc + '</td>\n' +
                    '                                        <td class="text-center" id="permission">\n' +
                    ' ' +
                    '                                            <button type="button" id="editorR" class="btn bg-light-blue-active btn-xs" disabled="disabled" onclick="findById(' + id + ')"> 详情</button> ' +
                    '                                             <button type="button" class="btn bg-olive btn-xs" title="删除" disabled="disabled" id="deleteR" onclick="deleteRoleById(' + id + ',\'' + roleName + '\')">  删除</button>' +
                    '                                              <button class="btn bg-purple-active btn-xs" type="button"\n' +
                    '                                                    id="addPermission"><a\n' +
                    '                                                    style="color: beige;font-weight: bold"\n' +
                    '                                                    href="/role/toRolePermission/' + id + '">\n' +
                    '                                                 添加权限</a>\n' +
                    '                                            </button>\n' +
                    '\n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
            });

            $("#tbody").html(dataHtml);

            //查询是否有相关的权限显示按钮
            findAllPermission();
            //回显分页数据
            getPageInfo(pageInfo);
        }
    });
}

function findById(id) {
    location.href = "/role/findById/" + id;
}