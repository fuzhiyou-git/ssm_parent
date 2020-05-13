function showData(page, pageSize) {

    var url = $(" div input[name='urlCondition']").val();
    var permissionName = $("div input[name='permissionNameCondition']").val();

    $.post({
        url: "/permission/findAll",
        data: {page: page, pageSize: pageSize, url: url, permissionName: permissionName},
        success: function (pageInfo) {
            var html = "";
            var id = "";
            $(pageInfo.list).each(function (i, permission) {

                var permissionName = permission.permissionName;
                var url = permission.url;
                id = permission.id;

                html += ' <tr>\n' +
                    '                                        <td><input name="ids" type="checkbox" value="${permission.id}"></td>\n' +
                    '                                        <td>' + id + '</td>\n' +
                    '                                        <td>' + permissionName + '</td>\n' +
                    '                                        <td>' + url + '</td>\n' +
                    '                                        <td class="text-center">\n' +
                    '                                            <button type="button" id="editorR" class="btn bg-light-blue-active btn-xs" data-toggle="modal" ' +
                    '                                                data-target="#exampleModal" data-whatever="@mdo"  onclick="findById(' + id + ')">编辑</button>\n' +
                    '\n' +
                    '                                            \n' +
                    '                                        </td>\n' +
                    '                                    </tr>';
            });


            $("#tbody").html(html);

            //回显分页数据，总共几页
            $("#pages").text(pageInfo.pages);
            //几条数据
            $("#total").text(pageInfo.total);

            //获取下一页数据,第一个参数pages
            var pageNum = pageInfo.pageNum; //当前页
            var prePage = pageInfo.prePage;//上一页
            var nextPage = pageInfo.nextPage;//下一页

            var pageSize = pageInfo.pageSize; //每页显示几条
            var pages = pageInfo.pages; //尾页


            //更新分页点击按钮事件
            var fenye = "";
            fenye += '<li><a href="javascript:showData(1,' + pageSize + ')" aria-label="Previous"><b>首页</b></a></li>\n' +
                '<li><a href="javascript:showData(' + prePage + ',' + pageSize + ')"><b>上一页</b></a></li>\n' +
                '<li><a href="javascript:showData(' + nextPage + ',' + pageSize + ')"><b>下一页</b></a></li>\n' +
                '<li><a href="javascript:showData(' + pages + ',' + pageSize + ')" aria-label="Next"><b>尾页</b></a></li>';
            //写到对应位置
            $(".pagination").html(fenye);

        }
    });
}

function findById(id) {
    $.post({
        url: "/permission/findById",
        data: {id: id},
        success: function (permission) {
            //填充查询回来的内容
            $("form input[name='id']").attr("value", permission.id);
            $("form div input[name='permissionName']").attr("value", permission.permissionName);
            $("form div input[name='url']").attr("value", permission.url);
        }
    });
}

function update_Permission() {
    $.post({
        url: "/permission/updatePermission",
        data: $("#updateform").serialize(),
        success: function (msg) {
            if (msg) {
                alert("修改成功");
                location.reload();
            } else {
                alert("修改失败")
            }
        }, error: function () {
            alert("服务器忙");
        }
    });
}

function refresh() {
    location.href = "/permission/toPermissionList";

}