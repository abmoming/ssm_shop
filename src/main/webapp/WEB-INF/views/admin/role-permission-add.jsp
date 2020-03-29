<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ include file="../include/admin-header.jsp" %>
<%@ include file="../include/admin-sidebar.jsp" %>

		<!-- 内容区域 -->
			<div class="content-wrapper">
				<!-- 内容头部 -->
				<section class="content-header">
					<h1>当前角色：${role.rolename } <small>添加权限资源表单</small> </h1>
					<ol class="breadcrumb">
						<li>
							<a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/role/findAll.do">角色管理</a>
						</li>
						<li class="active">添加权限资源表单</li>
					</ol>
				</section>
				<!-- 内容头部 /-->
				<form action="${pageContext.request.contextPath}/role/rolePermissionAdd.action" method="post">
					<!-- 正文区域 -->
					<section class="content"> <input type="hidden" name="roleId" value="${role.id }">
						<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
							<thead>
								<tr>
									<th class="" style="padding-right: 0px"> <input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
										<th class="sorting_asc">ID</th>
										<th class="sorting">权限名称</th>
										<th class="sorting">URL</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${permissions }" var="permission">
								<tr>
									<td><input name="permissionId" type="checkbox" value="${permission.id }"> </td>
									<td>${permission.id }</td>
									<td>${permission.permissionname }</td>
									<td>${permission.url }</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
						<!-- 订单信息 -->
						<!-- 工具栏 -->
						<div class="box-tools text-center"> <button type="submit" class="btn bg-maroon">保存</button> <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button> </div>
						<!-- 工具栏 -->
					</section>
					<!-- 正文区域 -->
				</form>
			</div>
			<!-- 内容区域 -->

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
				setSidebarActive("admin-datalist");
				// 列表按钮
				$("#dataList td input[type='checkbox']").iCheck({
					checkboxClass: 'icheckbox_square-blue',
					increaseArea: '20%'
				});
				// 全选操作 
				$("#selall").click(function() {
					var clicks = $(this).is(':checked');
					if (!clicks) {
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
