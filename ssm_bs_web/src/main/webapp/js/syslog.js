function showData(pages, pageSize) {
    //获取查询条件
    var username = $("div input[name='username']").val();
    $.post({
        url: "/sysLog/findAll",
        data: {pages: pages, pageSize: pageSize, username: username},
        success: function (pageInfo) {
            var dataHtml = "";
            $(pageInfo.list).each(function (i, syslog) {

                dataHtml += '<tr>\n' +
                    '                                 <td><input name="ids" type="checkbox" value="' + syslog.id + '" class="icheckbox_square-blue"></td>\n' +
                    '                                 <td>' + syslog.username + '</td>\n' +
                    '                                 <td>' + syslog.visitTimeStr + '</td>\n' +
                    '                                 <td>' + syslog.ip + '</td>\n' +
                    '                                 <td>' + syslog.url + '</td>\n' +
                    '                                 <td>' + syslog.executionTime + '毫秒</td>\n' +
                    '\n' +
                    '                             </tr>';
            });

            $("#tbody").html(dataHtml);

            //回显分页数据
            getPageInfo(pageInfo);
        }
    });
}

/*删除选中*/
function deleteSys() {
    var length = findLength();
    if (length) {
        var ids = getAllSelectedId();
        if (confirm("您确定要删除选中的" + length + "条数据吗？")) {
            $.post({
                url: "/sysLog/deleteSys",
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
}