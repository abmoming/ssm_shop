<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ include file="../include/admin-header.jsp" %>
<%@ include file="../include/admin-sidebar.jsp" %>

<!-- 内容区域 -->
			<div class="content-wrapper">
				<!-- 内容头部 -->
				<section class="content-header">
					<h1>订单管理 <small>全部订单</small> </h1>
					<ol class="breadcrumb">
						<li>
							<a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/order/findAll.do">订单管理</a>
						</li>
						<li class="active">全部订单</li>
					</ol>
				</section>
				<!-- 内容头部 /-->
				<!-- 正文区域 -->
				<section class="content">
					<!-- .box-body -->
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">列表</h3> </div>
						<div class="box-body">
							<!-- 数据表格 -->
							<div class="table-box">
								<!--工具栏-->
								<div class="pull-left">
									<div class="form-group form-inline">
										<div class="btn-group"> <button type="button" class="btn btn-default" title="新建" onclick='location.href="all-order-manage-edit.h tml"'> <i class="fa fa-file-o"></i> 新建 </button>
											<button type="button" class="btn btn-default" title="删除" onclick='confirm("你确认要删除吗？")'> <i class="fa fa-trash-o"></i> 删除 </button>
											<button type="button" class="btn btn-default" title="开启" onclick='confirm("你确认要开启吗？")'> <i class="fa fa-check"></i> 开启 </button>
											<button type="button" class="btn btn-default" title="屏蔽" onclick='confirm("你确认要屏蔽吗？")'> <i class="fa fa-ban"></i> 屏蔽 </button>
											<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"> <i class="fa fa-refresh"></i> 刷新 </button> </div>
									</div>
								</div>
								<div class="box-tools pull-right">
									<div class="has-feedback"> 
										<input type="text" class="form-control input-sm" placeholder="搜索"> 
										<span class="glyphicon glyphicon-search form-control-feedback"></span> 
									</div>
								</div>
								<!--工具栏/-->
								<!--数据列表-->
								<table id="dataList" class="table table-bordered table-striped table-hover dataT able">
									<thead>
										<tr>
											<th class="" style="padding-right: 0px"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
												<th class="sorting_asc">ID</th>
												<th class="sorting">订单编号</th>
												<th class="sorting">名称</th>
												<th class="sorting">金额</th>
												<th class="sorting">下单时间</th>
												<th class="sorting">订单状态</th>
												<th class="text-center">操作</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input name="ids" type="checkbox"></td>
											<td>1</td>
											<td>12345</td>
											<td>广州五日游</td>
											<td>￥850.0</td>
											<td>2018-03-02 00:00:00</td>
											<td>已支付</td>
											<td class="text-center">
												<a class="btn bg-olive btn-xs" href='${pageContext.request.contextPath}/order/findById.do?id=1'>详情</a>
												<a class="btn bg-olive btn-xs" href='${pageContext.request.contextPath}/order/deleteById.do?id=1'>删除</a>
											</td>
										</tr>
										<tr>
											<td><input name="ids" type="checkbox"></td>
											<td>2</td>
											<td>54321</td>
											<td>北京三日游</td>
											<td>￥350.0</td>
											<td>2018-03-02 00:00:00</td>
											<td>已支付</td>
											<td class="text-center">
												<a class="btn bg-olive btn-xs" href='${pageContext.request.contextPath}/order/findById.do?id=2'>详情</a>
												<a class="btn bg-olive btn-xs" href='${pageContext.request.contextPath}/order/deleteById.do?id=2'>删除</a>
											</td>
										</tr>
										<tr>
											<td><input name="ids" type="checkbox"></td>
											<td>3</td>
											<td>67890</td>
											<td>北京三日游</td>
											<td>￥350.0</td>
											<td>2018-03-02 00:00:00</td>
											<td>已支付</td>
											<td class="text-center">
												<a class="btn bg-olive btn-xs" href='${pageContext.request.contextPath}/order/findById.do?id=3'>详情</a>
												<a class="btn bg-olive btn-xs" href='${pageContext.request.contextPath}/order/deleteById.do?id=3'>删除</a>
											</td>
										</tr>
									</tbody>
								</table>
								<!--数据列表/-->
								<!--工具栏-->
								<div class="pull-left">
									<div class="form-group form-inline">
										<div class="btn-group"> <button type="button" class="btn btn-default" title="新建" onclick='location.href="all-order-manage-edit.h tml"'> <i class="fa fa-file-o"></i> 新建 </button> <button type="button" class="btn btn-default" title="删除" onclick='confirm("你确认要删除吗？")'> <i class="fa fa-trash-o"></i> 删除 </button> <button type="button" class="btn btn-default" title="开启" onclick='confirm("你确认要开启吗？")'> <i class="fa fa-check"></i> 开启 </button> <button type="button" class="btn btn-default" title="屏蔽" onclick='confirm("你确认要屏蔽吗？")'> <i class="fa fa-ban"></i> 屏蔽 </button> <button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"> <i class="fa fa-refresh"></i> 刷新 </button> </div>
									</div>
								</div>
								<div class="box-tools pull-right">
									<div class="has-feedback"> <input type="text" class="form-control input-sm" placeholder="搜索"> <span class="glyphicon glyphicon-search form-control-feed back"></span> </div>
								</div>
								<!--工具栏/-->
							</div>
							<!-- 数据表格 /-->
						</div>
						<!-- /.box-body -->
						<!-- .box-footer-->
						<div class="box-footer">
							<div class="pull-left">
								<div class="form-group form-inline"> 总共2 页，共4 条数据。 每页
									<select class="form-control" onchange="getPageSize()" id="pageS izeSelect">
										<option value="1">请选择</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="10">10</option>
									</select> 条 </div>
							</div>
							<div class="box-tools pull-right">
								<ul class="pagination">
									<li>
										<a href="${pageContext.request.contextPath}/order/findAll.do?page=1&pageSize=3" aria-label="Previous">首页</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/order/findAll.do?page=0&pageSize=3">上一页</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/order/findAll.do?page=1&pageSize=3">1</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/order/findAll.do?page=2&pageSize=3">2</a>
												</li>
												<li>
													<a href="${pageContext.request.contextPath}/order/findAll.do?page=2&pageSize=3">下一页</a>
												</li>
												<li>
													<a href="${pageContext.request.contextPath}/order/findAll.do?page=2&pageSize=3" aria-label="Next">尾页</a>
												</li>
								</ul>
							</div>
						</div>
						<!-- /.box-footer-->
					</div>
				</section>
				<!-- 正文区域 /-->
			</div>
			<!-- 内容区域 /-->

<%@ include file="../include/admin-footer.jsp" %>
<script>
			$(document).ready(function() {
				// 选择框
				$(".select2").select2();
				// WYSIHTML5编辑器 
				$(".textarea").wysihtml5({
					locale: 'zh-CN'
				});
			});
			// 设置激活菜单 
			function setSidebarActive(tagUri) {
				var liObj = $("#" + tagUri);
				if(liObj.length > 0) {
					liObj.parent().parent().addClass("active");
					liObj.addClass("active");
				}
			}
			$(document).ready(function() {
				// 激活导航位置
				setSidebarActive("order-manage");
				// 列表按钮 
				$("#dataList td input[type='checkbox']").iCheck({
					checkboxClass: 'icheckbox_square-blue',
					increaseArea: '20%'
				});
				// 全选操作 
				$("#selall").click(function() {
					var clicks = $(this).is(':checked');
					if(!clicks) {
						$("#dataList td input[type='checkbox']").iCheck("uncheck");
					} else {
						$("#dataList td input[type='checkbox']").iCheck("check");
					}
					$(this).data("clicks", !clicks);
				});
			});

			function getPageSize() {
				var pageSize = $("#pageSizeSelect").val();
				location.href = "${pageContext.request.contextPath}/order/findAll.do?page=1&pageSize=" + pageSize;
			}
		</script>
	</body>

</html>