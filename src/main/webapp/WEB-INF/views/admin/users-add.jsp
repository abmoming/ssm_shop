<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ include file="../include/admin-header.jsp" %>
<%@ include file="../include/admin-sidebar.jsp" %>
	
	<!-- 内容区域 -->
		<div class="content-wrapper">
			<!-- 内容头部 -->
			<section class="content-header">
				<h1>用户管理 <small>用户表单</small> </h1>
				<ol class="breadcrumb">
					<li>
						<a href="${pageContext.request.contextPath}/index.jsp"><i class="fa fa-dashboard"></i> 首页</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a>
					</li>
					<li class="active">用户表单</li>
				</ol>
			</section>
			<!-- 内容头部 /-->
			<form action="${pageContext.request.contextPath}/users/usersAdd.action" method="post">
				<!-- 正文区域 -->
				<section class="content">
					<!--产品信息-->
					<div class="panel panel-default">
						<div class="panel-heading">用户信息</div>
						<div class="row data-type">
							<div class="col-md-2 title">用户名称</div>
							<div class="col-md-4 data"> <input type="text" class="form-control" name="username" placeholder="用户名称" value=""> </div>
							<div class="col-md-2 title">密码</div>
							<div class="col-md-4 data"> <input type="password" class="form-control" name="password" placeholder="密码" value=""> </div>
							<div class="col-md-2 title">邮箱</div>
							<div class="col-md-4 data"> <input type="text" class="form-control" name="email" placeholder="邮箱" value=""> </div>
							<div class="col-md-2 title">联系电话</div>
							<div class="col-md-4 data"> <input type="text" class="form-control" name="phonenum" placeholder="联系电话" value=""> </div>
							<div class="col-md-2 title">用户状态</div>
							<div class="col-md-4 data">
								<select class="form-control select2" style="width: 100%" name="status">
									<option value="0" selected="selected">关闭</option>
									<option value="1">开启</option>
								</select>
							</div>
						</div>
					</div>
					<!--订单信息/-->
					<!--工具栏-->
					<div class="box-tools text-center"> <button type="submit" class="btn bg-maroon">添加</button> <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button> </div>
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