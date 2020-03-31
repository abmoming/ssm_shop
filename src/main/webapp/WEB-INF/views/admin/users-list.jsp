<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ include file="../include/admin-header.jsp" %>
<%@ include file="../include/admin-sidebar.jsp" %>

<!-- 内容区域 -->
<div class="content-wrapper">
	<!-- 内容头部 -->
	<section class="content-header">
		<h1>
			用户管理 <small>全部用户</small>
		</h1>
		<ol class="breadcrumb">
			<li><a
				href="${pageContext.request.contextPath}/admin/admin.action"><i
					class="fa fa-dashboard"></i> 首页</a></li>
			<li><a href="${pageContext.request.contextPath}/user/findAll.do">用户管理
			</a></li>
			<li class="active">全部用户</li>
		</ol>
	</section>
	<!-- 内容头部 /-->
	<!-- 正文区域 -->
	<section class="content">
		<!-- .box-body -->
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">列表</h3>
			</div>
			<div class="box-body">
				<!-- 数据表格 -->
				<div class="table-box">
					<!--工具栏-->
					<div class="pull-left">
						<div class="form-group form-inline">
							<div class="btn-group">
								<button type="button" class="btn btn-default" title="新建" onclick="location.href='${pageContext.request.contextPath}/users/usersAddPage.action'">
									<i class="fa fa-file-o"></i> 新建
								</button>
								<button type="button" class="btn btn-default" title="刷新" onclick="location.href='${pageContext.request.contextPath}/users/usersList.action?pageNum=${pageInfo.pageNum }&pageSize=${pageInfo.pageSize }'">
									<i class="fa fa-refresh"></i> 刷新
								</button>
							</div>
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
					<table id="dataList"
						class="table table-bordered table-striped table-hover dataTable">
						<thead>
							<tr>
								<th class="" style="padding-right: 0px"><input id="selall" type="checkbox" class="icheckbox_square-blue"></th>
								<th class="sorting_asc">ID</th>
								<th class="sorting_desc">用户名</th>
								<th class="sorting_asc sorting_asc_disabled">邮箱</th>
								<th class="sorting_desc sorting_desc_disabled">联系电话</th>
								<th class="sorting">状态</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pageInfo.list }" var="users">
							<tr>
								<td><input name="id" type="checkbox"></td>
								<td>${users.id }</td>
								<td>${users.username }</td>
								<td>${users.email }</td>
								<td>${users.phonenum }</td>
								<td>${users.usersStatus }</td>
								<td class="text-center">
									<a href="${pageContext.request.contextPath}/users/usersInfo.action?id=${users.id}" class="btn bg-olive btn-xs">详情</a>
									<a href="${pageContext.request.contextPath}/users/usersRoleAddPage.action?usersId=${users.id}" class="btn bg-olive btn-xs">角色关联</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
						<!-- <tfoot> <tr> <th>Rendering engine</th> <th>Browser</th> <th>Platform(s)</th> <th>Engine version</th> <th>CSS grade</th> </tr> </tfoot>-->
					</table>
					<!--数据列表/-->
				</div>
				<!-- 数据表格 /-->
			</div>
			<!-- /.box-body -->
			<!-- .box-footer-->
			<div class="box-footer">
				<div class="pull-left">
					<div class="form-group form-inline">
						总共${pageInfo.pages } 页，共${pageInfo.total } 条数据。 每页 <select id="pageSizeSelect" class="form-control" onchange="changePageSize()">
							<option <c:if test="${param.pageSize == 5 }">selected</c:if>>5</option>
								<option <c:if test="${param.pageSize == 10 }">selected</c:if>>10</option>
								<option <c:if test="${param.pageSize == 15 }">selected</c:if>>15</option>
								<option <c:if test="${param.pageSize == 20 }">selected</c:if>>20</option>
								<option <c:if test="${param.pageSize == 50 }">selected</c:if>>50</option>
								<option <c:if test="${param.pageSize == 80 }">selected</c:if>>80</option>
						</select> 条
					</div>
				</div>
				<div class="box-tools pull-right">
					<ul class="pagination">
						<li><a href="${pageContext.request.contextPath }/users/usersList.action?pageNum=1&pageSize=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
						<li><a href="${pageContext.request.contextPath }/users/usersList.action?pageNum=${pageInfo.pageNum-1}&pageSize=${pageInfo.pageSize}">上一页</a></li>
						<c:forEach begin="1" end="${pageInfo.pages }" var="page">
						<li><a href="${pageContext.request.contextPath }/users/usersList.action?pageNum=${page}&pageSize=${pageInfo.pageSize}">${page }</a></li>
						</c:forEach>
						<li><a href="${pageContext.request.contextPath }/users/usersList.action?pageNum=${pageInfo.pageNum+1}&pageSize=${pageInfo.pageSize}">下一页</a></li>
						<li><a href="${pageContext.request.contextPath }/users/usersList.action?pageNum=${pageInfo.pages}&pageSize=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
					</ul>
				</div>
			</div>
			<!-- /.box-footer-->
		</div>
	</section>
	<!-- 正文区域 /-->
</div>
<!-- @@close -->
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
			// 设置激活菜单 f
			function setSidebarActive(tagUri) {
				var liObj = $("#" + tagUri);
				if (liObj.length > 0) {
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
			
			function changePageSize(){
				var pageSize = $("#pageSizeSelect").val();
				location.href="${pageContext.request.contextPath}/users/usersList.action?pageNum=1&pageSize=" + pageSize;
			}
		</script>
</body>
</html>