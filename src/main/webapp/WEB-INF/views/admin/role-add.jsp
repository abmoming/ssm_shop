<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<jsp:include page="../include/admin-header.jsp"></jsp:include>
<jsp:include page="../include/admin-sidebar.jsp"></jsp:include>

	<!-- 内容区域 -->
			<div class="content-wrapper">
				<!-- 内容头部 -->
				<section class="content-header">
					<h1>角色管理 <small>角色表单</small> </h1>
					<ol class="breadcrumb">
						<li>
							<a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/role/findAll.do">角色管理</a>
						</li>
						<li class="active">角色表单</li>
					</ol>
				</section>
				<!-- 内容头部 /-->
				<form action="${pageContext.request.contextPath}/role/roleAdd.action" method="post">
					<!-- 正文区域 -->
					<section class="content">
						<!--产品信息-->
						<div class="panel panel-default">
							<div class="panel-heading">角色信息</div>
							<div class="row data-type">
								<div class="col-md-2 title">角色名称</div>
								<div class="col-md-4 data"> <input type="text" class="form-control" name="rolename" placeholder="角色名称" value=""> </div>
								<div class="col-md-2 title">角色描述</div>
								<div class="col-md-4 data"> <input type="text" class="form-control" name="roledesc" placeholder="角色描述" value=""> </div>
							</div>
						</div>
						<!--订单信息/-->
						<!--工具栏-->
						<div class="box-tools text-center"> <button type="submit" class="btn bg-maroon">保存</button> <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button> </div>
						<!--工具栏/-->
					</section>
					<!-- 正文区域 /-->
				</form>
			</div>
	<!-- 内容区域 /-->

<jsp:include page="../include/admin-footer.jsp"></jsp:include>
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
		</script>
	</body>

</html>