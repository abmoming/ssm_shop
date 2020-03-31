<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ include file="../include/admin-header.jsp" %>
<%@ include file="../include/admin-sidebar.jsp" %>

	<!-- 内容区域 -->
			<div class="content-wrapper">
				<!-- 内容头部 -->
				<section class="content-header">
					<h1>用户详情 <small>${users.username }用户</small> </h1>
					<ol class="breadcrumb">
						<li>
							<a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/user/findAll.do">用户详情</a>
						</li>
						<li class="active">${users.username }用户信息</li>
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
								<!-- <div class="pull-left">
									<div class="form-group form-inline">
										<div class="btn-group"> <button type="button" class="btn btn-default" title="新建"> <i class="fa fa-file-o"></i> 新建 </button> <button type="button" class="btn btn-default" title="刷新"> <i class="fa fa-refresh"></i> 刷新 </button> </div>
									</div>
								</div> -->
								<div class="box-tools pull-right">
									<div class="has-feedback"> <input type="text" class="form-control input-sm" placeholder="搜索"> <span class="glyphicon glyphicon-search form-control-feedback"></span> </div>
								</div>
								<!--工具栏/-->
								<!--数据列表-->
								<div class="tab-pane" id="tab-treetable">
									<table id="collapse-table" class="table table-bordered table-hover dataTable">
										<thead>
											<tr>
												<th>用户</th>
												<th>描述</th>
											</tr>
										</thead>
										<tr data-tt-id="0">
											<td colspan="2">${users.username }</td>
										</tr>
										<tbody>
											<c:forEach items="${users.roles }" var="role" varStatus="vs">
											<tr data-tt-id="${vs.index+1 }" data-tt-parent-id="0">
												<td>${role.rolename }</td>
												<td>${role.roledesc }</td>
											</tr>
												<c:forEach items="${role.permissions }" var="permission">
												<tr data-tt-id="1-1" data-tt-parent-id="${vs.index+1 }">
													<td>${permission.permissionname }</td>
													<td>${permission.url }</td>
												</tr>
												</c:forEach>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<!--数据列表/-->
							</div>
							<!-- 数据表格 /-->
						</div>
						<!-- /.box-body -->
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
				$("#collapse-table").treetable({
					expandable: true
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
				setSidebarActive("admin-datalist");
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
		</script>
	</body>

</html>