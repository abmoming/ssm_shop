<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ include file="../include/admin-header.jsp" %>
<%@ include file="../include/admin-sidebar.jsp" %>

			<!-- 内容区域 -->
			<div class="content-wrapper">
				<!-- 内容头部 -->
				<section class="content-header">
					<h1>分类管理 <small>${category.name }</small> </h1>
					<ol class="breadcrumb">
						<li>
							<a href="${pageContext.request.contextPath}/admin.action"><i class="fa fa-dashboard"></i> 首页</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/category/categoryList.action">分类管理</a>
						</li>
						<li class="active">分类修改</li>
					</ol>
				</section>
				<!-- 内容头部 /-->
				<form action="${pageContext.request.contextPath}/category/categoryUpdate.action" method="post"> <input type="hidden" name="id" value="${category.id }">
					<!-- 正文区域 -->
					<section class="content">
						<!--产品信息-->
						<div class="panel panel-default">
							<div class="panel-heading">分类信息</div>
							<div class="row data-type">
								<div class="col-md-2 title">分类名称</div>
								<div class="col-md-4 data"> <input type="text" class="form-control" name="name" placeholder="产品名称" value="${category.name }"> </div>
							</div>
						</div>
						<!--订单信息/-->
						<!--工具栏-->
						<div class="box-tools text-center"> <button type="submit" class="btn bg-maroon">修改</button> <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button> </div>
						<!--工具栏/-->
					</section>
					<!-- 正文区域 /-->
				</form>
			</div>
			<!-- 内容区域 /-->

<%@ include file="../include/admin-footer.jsp" %>
<script>
			$(document).ready(function() {
				// 选择框
				(".select2").select2();
				// WYSIHTML5编辑器 
				$(".textarea").wysihtml5({
					locale: 'zh-CN'
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
			// 设置激活菜单 
			function setSidebarActive(tagUri) {
				var liObj = $("#" + tagUri);
				if(liObj.length > 0) {
					liObj.parent().parent().addClass("active");
					liObj.addClass("active");
				}
			}
		</script>
	</body>

</html>