<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<jsp:include page="../include/admin-header.jsp"></jsp:include>
<jsp:include page="../include/admin-sidebar.jsp"></jsp:include>

	<!-- 内容区域 -->
<div class="content-wrapper">
    <!-- 内容头部 -->
    <section class="content-header">
        <h1>订单管理 <small>全部订单</small> </h1>
        <ol class="breadcrumb">
            <li><a href="all-admin-index.html"><i class="fa fa-dashboard"></i> 首页</a></li>
            <li><a href="all-order-manage-list.html">订单管理</a></li>
            <li class="active">订单详情</li>
        </ol>
    </section> <!-- 内容头部 /-->
    <!-- 正文区域 -->
    <section class="content">
        <!--订单信息-->
        <div class="panel panel-default">
            <div class="panel-heading">订单信息</div>
            <div class="row data-type">
                <div class="col-md-2 title">订单编号</div>
                <div class="col-md-4 data"> <input type="text" class="form-control" placeholder="订单编号" value="12345" readonly="readonly"> </div>
                <div class="col-md-2 title">下单时间</div>
                <div class="col-md-4 data">
                    <div class="input-group date">
                        <div class="input-group-addon"> <i class="fa fa-calendar"></i> </div> <input type="text" class="form-control pull-right" id="datepicker-a3" readonly="readonly" value="2018-03-02 00:00:00">
                    </div>
                </div>
                <div class="col-md-2 title">路线名称</div>
                <div class="col-md-4 data"> <input type="text" class="form-control" placeholder="路线名称" value="广州五日游" readonly="readonly"> </div>
                <div class="col-md-2 title">出发城市</div>
                <div class="col-md-4 data"> <input type="text" class="form-control" placeholder="路线名称" value="广州" readonly="readonly"> </div>
                <div class="col-md-2 title">出发时间</div>
                <div class="col-md-4 data">
                    <div class="input-group date">
                        <div class="input-group-addon"> <i class="fa fa-calendar"></i> </div> <input type="text" class="form-control pull-right" id="datepicker-a6" value="Fri Mar 30 19:00:00 CST 2018" readonly="readonly">
                    </div>
                </div>
                <div class="col-md-2 title">出游人数</div>
                <div class="col-md-4 data"> <input type="text" class="form-control" placeholder="出游人数" value="2" readonly="readonly"> </div>
                <div class="col-md-2 title rowHeight2x">其他信息</div>
                <div class="col-md-10 data rowHeight2x"> <textarea class="form-control" rows="3" placeholder="其他信息"> 没什么 </textarea> </div>
            </div>
        </div>
        <!--订单信息/-->
        <!--游客信息-->
        <div class="panel panel-default">
            <div class="panel-heading">游客信息</div>
            <!--数据列表-->
            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                <thead>
                    <tr>
                        <th class="">人群</th>
                        <th class="">姓名</th>
                        <th class="">性别</th>
                        <th class="">手机号码</th>
                        <th class="">证件类型</th>
                        <th class="">证件号码</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>成人</td>
                        <td><input type="text" size="10" value="张龙" readonly="readonly"></td>
                        <td><input type="text" size="10" value="男" readonly="readonly"></td>
                        <td><input type="text" size="20" value="13333333333" readonly="readonly"></td>
                        <td><input type="text" size="15" value="身份证" readonly="readonly"></td>
                        <td><input type="text" size="28" value="123456789009876543" readonly="readonly"></td>
                    </tr>
                    <tr>
                        <td>儿童</td>
                        <td><input type="text" size="10" value="张小龙" readonly="readonly"></td>
                        <td><input type="text" size="10" value="男" readonly="readonly"></td>
                        <td><input type="text" size="20" value="15555555555" readonly="readonly"></td>
                        <td><input type="text" size="15" value="身份证" readonly="readonly"></td>
                        <td><input type="text" size="28" value="987654321123456789" readonly="readonly"></td>
                    </tr>
                </tbody>
            </table>
            <!--数据列表/-->
        </div>
        <!--游客信息/-->
        <!--联系人信息-->
        <div class="panel panel-default">
            <div class="panel-heading">联系人信息</div>
            <div class="row data-type">
                <div class="col-md-2 title">会员</div>
                <div class="col-md-4 data text">小三</div>
                <div class="col-md-2 title">联系人</div>
                <div class="col-md-4 data text">张三</div>
                <div class="col-md-2 title">手机号</div>
                <div class="col-md-4 data text">18888888888</div>
                <div class="col-md-2 title">邮箱</div>
                <div class="col-md-4 data text">zs@163.com</div>
            </div>
        </div>
        <!--联系人信息/-->
        <!--费用信息-->
        <div class="panel panel-default">
            <div class="panel-heading">费用信息</div>
            <div class="row data-type">
                <div class="col-md-2 title">支付方式</div>
                <div class="col-md-4 data text">在线支付-支付宝</div>
                <div class="col-md-2 title">金额</div>
                <div class="col-md-4 data text">￥850.0</div>
            </div>
        </div>
        <!--费用信息/-->
        <!--工具栏-->
        <div class="box-tools text-center"> <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button> </div>
        <!--工具栏/-->
    </section> <!-- 正文区域 /-->
</div> <!-- 内容区域 /-->

<jsp:include page="../include/admin-footer.jsp"></jsp:include>
<script>
$(document).ready(function() {
    // 选择框 
    $(".select2").select2();
    // WYSIHTML5编辑器 
    $(".textarea").wysihtml5({ locale: 'zh-CN' });
});
// 设置激活菜单 
function setSidebarActive(tagUri) {
    var liObj = $("#" + tagUri);
    if (liObj.length > 0) {
        liObj.parent().parent().addClass("active");
        liObj.addClass("active");
    }
}
$(document).ready(function() {
    // 激活导航位置 
    setSidebarActive("order-manage");
    // 列表按钮
    $("#dataList td input[type='checkbox']").iCheck({ checkboxClass: 'icheckbox_square-blue', increaseArea: '20%' });
    // 全选操作 
    $("#selall").click(function() { var clicks = $(this).is(':checked'); if (!clicks) { $("#dataList td input[type='checkbox']").iCheck("uncheck"); } else { $("#dataList td input[type='checkbox']").iCheck("check"); } $(this).data("clicks", !clicks); });
});
</script>
</body>

</html>
