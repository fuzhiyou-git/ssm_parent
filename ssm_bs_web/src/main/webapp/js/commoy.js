// 设置激活菜单
function setSidebarActive(tagUri) {
    var liObj = $("#" + tagUri);
    if (liObj.length > 0) {
        liObj.parent().parent().addClass("active");
        liObj.addClass("active");
    }
}

$(document).ready(function () {
    // 激活导航位置
    setSidebarActive("admin-datalist");
    // 列表按钮
    $("#dataList td input[type='checkbox']").iCheck(
        {
            checkboxClass: 'icheckbox_square-blue', increaseArea: '20%'
        });
    // 全选操作
    $("#firstCb").click(function () {
        var clicks = $(this).is(':checked');
        if (!clicks) {
            $("#dataList td input[type='checkbox']").iCheck("uncheck");
        } else {
            $("#dataList td input[type='checkbox']").iCheck("check");
        }
        $(this).data("clicks", !clicks);
    });
});

function firstCb() {
    $("#firstCb").click(function () {
        var cbs = document.getElementsByName("ids");
        //3.遍历
        for (var i = 0; i < cbs.length; i++) {
            cbs[i].checked = this.checked;
        }
    });
}

$(function () {
    firstCb();
});

function changePageSize() {
    //获取下拉框的值
    var pageSize = $("#changePageSize").val();
    //向服务器发送请求，改变没页显示条数
    showData(1, pageSize);
}

function findAllPermission() {
    $.post({
        url: "/user/findAllPermission",
        success: function (permissions) {
            findAllUserPermission(permissions);
        }, error: function () {
            alert("服务器忙");
        }
    });
}

/*删除用户的权限*/
function deletePermission() {
    $("tr td button[id='deleteU']").each(function (i) {
        $(this).attr("disabled", false);

    });
}

/*编辑用户的权限*/
function updatePermission() {
    $("tr td button[id='editorU']").each(function (i) {
        $(this).attr("disabled", false);

    });
}

/*删除选中用户的权限*/
function delSelectedPermission() {
    $("#delSelected").attr("disabled", false);
}

/*添加用户的权限*/
function addUserPermission() {
    $("#addUser").attr("disabled", false);
}

function updateRolePermission() {
    $("tr td button[id='editorR']").each(function (i) {
        $(this).attr("disabled", false);

    });
}

function deleteRolePermission() {
    $("tr td button[id='deleteR']").each(function (i) {
        $(this).attr("disabled", false);

    });
}

/*验证电话号码和邮箱*/
function checkPhoneAndEmail(phone, email) {
    //电话号码规则
    var regPhone = /^1[3-9]\d{9}$/;
    //邮箱规则
    var regEmail = /\w{1,}@\w{1,10}\.\w{2,3}/;

    if (regPhone.test(phone) && regEmail.test(email)) {
        return true;
    } else {
        alert("请您输入正确的电话号码和邮箱");
    }
}

/*关闭模态框*/
function closeModal() {
    $(".form-control").val("");
}


/*选中的条数的id值*/
function getAllSelectedId() {
    var ids = [];
    $('input[type=checkbox]:checked').each(function (i) {
        ids[i] = $(this).val();
    });
    return ids;
}

/*判断是否选中*/
function findLength() {
    var length = $(":checkbox[name=ids]:checked").length;
    if (length <= 0) {
        alert("您还没有选中条数");
        return;
    }
    return length;
}

/*查询用户所有的权限*/
function findAllUserPermission(permissions) {
    var length = Object.keys(permissions).length;
    if (length == 0) {
        return false;
    }
    if (length > 0) {
        $(permissions).each(function (i, permission) {
            var permissionName = permission.name;
            if (permissionName == "deleteById") {
                //有删除用户的权限
                deletePermission();
            }
            if (permissionName == "updateUser") {
                //用修改权限
                updatePermission();
            }

            if (permissionName == "delSelected") {
                //有删除选中的权限
                delSelectedPermission();
            }
            if (permissionName == "addUser") {
                //有添加用户的权限
                addUserPermission();
            }
            if (permissionName == "updateRole") {
                //有修改角色的权限
                updateRolePermission();
            }
            if (permissionName == "deleteRole") {
                //有删除角色的权限
                deleteRolePermission();
            }
        });
    }
}


/*统计访问量*/
function viUserAndCount() {
    $.post({
        url: "/sysLog/viUserAndCount",
        success: function (json) {
            $(json).each(function (i, map) {
                var username = map.username;
                var count = map.count;
                chartData = eval(json);
                chart = new AmCharts.AmPieChart();
                chart.dataProvider = chartData;
                //标题数据
                //值数据
                chart.titleField = "username";
                chart.valueField = "count";
            });

            //边框线颜色
            chart.outlineColor = "#fff";
            //边框线的透明度
            chart.outlineAlpha = .8;
            //边框线的狂宽度
            chart.outlineThickness = 1;
            chart.depth3D = 20;
            chart.angle = 30;
            chart.write("pie");
        }
    });
}

function viProductAndCount() {
    $.post({
        url: "/sysLog/viProductAndCount",
        success: function (json) {
            $(json).each(function (i, map) {
                var productNum = map.productNum;
                var count = map.count;
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider = json;
                chart.categoryField = "productNum";
                chart.rotate = false;
                //值越大柱状图面积越大
                chart.depth3D = 16;
                //柱子旋转角度
                chart.angle = 30;
                var mCtCategoryAxis = chart.categoryAxis;
                mCtCategoryAxis.axisColor = "#efefef";
                //背景颜色透明度
                mCtCategoryAxis.fillAlpha = 0.5;
                //背景边框线透明度
                mCtCategoryAxis.gridAlpha = 0;
                mCtCategoryAxis.fillColor = "#efefef";
                var valueAxis = new AmCharts.ValueAxis();
                //左边刻度线颜色
                valueAxis.axisColor = "#ccc";
                //标题
                valueAxis.title = "产品购买数量统计";
                //刻度线透明度
                valueAxis.gridAlpha = 0.2;
                chart.addValueAxis(valueAxis);
                var graph = new AmCharts.AmGraph();
                graph.title = "count";
                graph.valueField = "count";
                graph.type = "column";
                //鼠标移入提示信息
                graph.balloonText = "产品编号:[[category]]   销量:[[count]]笔";
                //边框透明度
                graph.lineAlpha = 0.3;
                //填充颜色
                graph.fillColors = "#b9121b";
                graph.fillAlphas = 1;

                chart.addGraph(graph);
            });
            // CURSOR
            var chartCursor = new AmCharts.ChartCursor();
            chartCursor.cursorAlpha = 0;
            chartCursor.zoomable = false;
            chartCursor.categoryBalloonEnabled = false;
            chart.addChartCursor(chartCursor);
            chart.creditsPosition = "top-right";

            //显示在Main div中
            chart.write("cylindrical");

        }, error: function () {
            alert("服务器忙");
        }
    });
}

function getOnlineData() {
    $.post({
        url: "/sysLog/getOnlineData",
        success: function (data) {
            am4core.useTheme(am4themes_animated);
            var chart = am4core.create("chartdiv", am4charts.XYChart);
            $(data).each(function (i, map) {
                var name = map.name;
                var value = map.value;
                data.push({category: name, value: value});
            });
            chart.data = data;
            var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
            categoryAxis.renderer.grid.template.location = 0;
            categoryAxis.dataFields.category = "category";
            categoryAxis.renderer.minGridDistance = 15;
            categoryAxis.renderer.grid.template.location = 0.5;
            categoryAxis.renderer.grid.template.strokeDasharray = "1,3";
            categoryAxis.renderer.labels.template.rotation = -90;
            categoryAxis.renderer.labels.template.horizontalCenter = "left";
            categoryAxis.renderer.labels.template.location = 0.5;

            categoryAxis.renderer.labels.template.adapter.add("dx", function (dx, target) {
                return -target.maxRight / 2;
            })

            var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
            valueAxis.tooltip.disabled = true;
            valueAxis.renderer.ticks.template.disabled = true;
            valueAxis.renderer.axisFills.template.disabled = true;

            var series = chart.series.push(new am4charts.ColumnSeries());
            series.dataFields.categoryX = "category";
            series.dataFields.valueY = "value";
            series.tooltipText = "系统访问次数: " + "{valueY.value}";
            series.sequencedInterpolation = true;
            series.fillOpacity = 0;
            series.strokeOpacity = 1;
            series.strokeDashArray = "1,3";
            series.columns.template.width = 0.01;

            var bullet = series.bullets.create(am4charts.CircleBullet);

            chart.cursor = new am4charts.XYCursor();

            chart.scrollbarX = new am4core.Scrollbar();
            chart.scrollbarY = new am4core.Scrollbar();
        }
    });
}

/*分页函数*/
function getPageInfo(pageInfo) {
    //回显分页数据，总共几页
    $("#pages").text(pageInfo.pages);
    //几条数据
    $("#total").text(pageInfo.total);

    //获取下一页数据,第一个参数pages
    var prePage = pageInfo.prePage;//上一页
    var nextPage = pageInfo.nextPage;//下一页

    var pageSize = pageInfo.pageSize; //每页显示几条
    var pages = pageInfo.pages; //尾页

    //分页数据展示
    var fenye = "";
    fenye += '<li><a href="javascript:showData(1,' + pageSize + ')" aria-label="Previous"><b>首页</b></a></li>\n' +
        '<li><a href="javascript:showData(' + prePage + ',' + pageSize + ')"><b>上一页</b></a></li>\n' +
        '<li><a href="javascript:showData(' + nextPage + ',' + pageSize + ')"><b>下一页</b></a></li>\n' +
        '<li><a href="javascript:showData(' + pages + ',' + pageSize + ')" aria-label="Next"><b>尾页</b></a></li>';

    $(".pagination").html(fenye);
}

/*根据Id查询分页*/
function findProductPageById(pageInfo, id) {
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
    fenye += '<li><a href="javascript:showAllProducts(1,' + pageSize + ',' + id + ')"><b>首页</b></a></li>\n' +
        '<li><a href="javascript:showAllProducts(' + prePage + ',' + pageSize + ',' + id + ')"><b>上一页</b></a></li>\n' +
        '<li><a href="javascript:showAllProducts(' + nextPage + ',' + pageSize + ',' + id + ')"><b>下一页</b></a></li>\n' +
        '<li><a href="javascript:showAllProducts(' + pages + ',' + pageSize + ',' + id + ')" aria-label="Next"><b>尾页</b></a></li>';
    //写到分页栏中
    $(".pagination").html(fenye);
}
