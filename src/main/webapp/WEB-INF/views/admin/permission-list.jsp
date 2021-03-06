<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ include file="../include/admin-header.jsp" %>
<%@ include file="../include/admin-sidebar.jsp" %>

<!-- 内容区域 -->
<div class="content-wrapper">
	<!-- 内容头部 -->
	<section class="content-header">
		<h1>
			权限管理 <small>全部权限</small>
		</h1>
		<ol class="breadcrumb">
			<li><a href="${pageContext.request.contextPath}/index.jsp"><i
					class="fa fa-dashboard"></i> 首页</a></li>
			<li><ahref="${pageContext.request.contextPath}/user/findAll.do">权限管理
				</a></li>
			<li class="active">全部权限</li>
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
								<button type="button" class="btn btn-default" title="新建"
									onclick='location.href="${pageContext.request.contextPath}/permission/permissionAddPage.action"'>
									<i class="fa fa-file-o"></i> 新建
								</button>
								<button type="button" class="btn btn-default" title="刷新">
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
								<th class="" style="padding-right: 0px"><input
									id="selall" type="checkbox" class="icheckbox_square-blue">
								</th>
								<th class="sorting_asc">ID</th>
								<th class="sorting_desc">权限名称</th>
								<th class="sorting_asc sorting_asc_disabled">URL</th>
								<th class="text-center">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pageInfo.list }" var="permission">
							<tr>
								<td><input name="ids" type="checkbox"></td>
								<td>${permission.id }</td>
								<td>${permission.permissionname }</td>
								<td>${permission.url }</td>
								<td class="text-center"><a
									href="${pageContext.request.contextPath}/permission/findById.do?id=1"
									class="btn bg-olive btn-xs">详情</a></td>
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
						总共${pageInfo.pages } 页，共${pageInfo.total } 条数据。 每页 
						<select id="selectPageSize" class="form-control" onchange="selectPageSize()">
							<option <c:if test="${param.pageSize == 5 }">selected</c:if>>5</option>
							<option <c:if test="${param.pageSize == 10 }">selected</c:if>>10</option>
							<option <c:if test="${param.pageSize == 15 }">selected</c:if>>15</option>
							<option <c:if test="${param.pageSize == 20 }">selected</c:if>>20</option>
							<option <c:if test="${param.pageSize == 25 }">selected</c:if>>25</option>
						</select> 条
					</div>
				</div>
				<div class="box-tools pull-right">
					<ul class="pagination">
						<li><a href="${pageContext.request.contextPath }/permission/permissionList.action?pageNum=1&pageSize=${pageInfo.pageSize}" aria-label="Previous">首页</a></li>
						<li><a href="${pageContext.request.contextPath }/permission/permissionList.action?pageNum=${pageInfo.pageNum-1 }&pageSize=${pageInfo.pageSize}">上一页</a></li>
						<c:forEach begin="1" end="${pageInfo.pages }" var="page">
						<li><a href="${pageContext.request.contextPath }/permission/permissionList.action?pageNum=${page }&pageSize=${pageInfo.pageSize}">${page }</a></li>
						</c:forEach>
						<li><a href="${pageContext.request.contextPath }/permission/permissionList.action?pageNum=${pageInfo.pageNum+1 }&pageSize=${pageInfo.pageSize}">下一页</a></li>
						<li><a href="${pageContext.request.contextPath }/permission/permissionList.action?pageNum=${pageInfo.pages }&pageSize=${pageInfo.pageSize}" aria-label="Next">尾页</a></li>
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
			
			function selectPageSize(){
				var pageSize = $("#selectPageSize").val();
				location.href="${pageContext.request.contextPath}/permission/permissionList.action?pageNum=1&pageSize=" + pageSize;
			}
		</script>
</body>
</html>

