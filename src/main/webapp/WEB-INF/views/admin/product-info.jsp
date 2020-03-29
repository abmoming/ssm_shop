<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ include file="../include/admin-header.jsp" %>
<%@ include file="../include/admin-sidebar.jsp" %>

			<!-- 内容区域 -->
			<div class="content-wrapper">
				<!-- 内容头部 -->
				<section class="content-header">
					<h1>产品管理 <small>产品表单</small> </h1>
					<ol class="breadcrumb">
						<li>
							<a href="${pageContext.request.contextPath}/admin.action"><i class="fa fa-dashboard"></i> 首页</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/product/productList.action">产品管理</a>
						</li>
						<li class="active">产品表单</li>
					</ol>
				</section>
				<!-- 内容头部 /-->
				<form action="" method="post">
					<!-- 正文区域 -->
					<section class="content">
						<!--产品信息-->
						<div class="panel panel-default">
							<div class="panel-heading">产品信息</div>
							<div class="row data-type">
								<div class="col-md-2 title">ID</div>
								<div class="col-md-4 data"> <input type="text" class="form-control" name="name" placeholder="id" value="${product.id }"> </div>
								<div class="col-md-2 title">产品名称</div>
								<div class="col-md-4 data"> <input type="text" class="form-control" name="name" placeholder="产品名称" value="${product.name }"> </div>
								<div class="col-md-2 title">产品描述</div>
								<div class="col-md-4 data"> <input type="text" class="form-control" name="subTitle" placeholder="产品描述" value="${product.subTitle }"> </div>
								<div class="col-md-2 title">产品价格</div>
								<div class="col-md-4 data"> <input type="text" class="form-control" name="price" placeholder="产品价格 "  value="￥${product.price }"> </div>
								<div class="col-md-2 title">销量</div>
								<div class="col-md-4 data"> <input type="text" class="form-control" name="sale" placeholder="库存 " value="${product.sale }"> </div>
								<div class="col-md-2 title">库存</div>
								<div class="col-md-4 data"> <input type="text" class="form-control" name="stock" placeholder="库存 " value="${product.stock }"> </div>
								<div class="col-md-2 title">产品状态</div>
								<div class="col-md-4 data">
									<input type="text" class="form-control" name="status" placeholder="产品状态 " value="${product.productStatus }">
								</div>
								<div class="col-md-2 title">产品分类</div>
								<div class="col-md-4 data">
									<input type="text" class="form-control" name="categoryId" placeholder="产品分类 " value="${category.name }">
								</div>
							</div>
						</div>
						<!--订单信息/-->
						<!--工具栏-->
						<div class="box-tools text-center"> <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button> </div>
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
				$(document).ready(function() {
					$('#datepicker-a3').datepicker({
						autoclose: true,
						format: 'yyyy-mm-dd'
					});
				});
				$(document).ready(function() {
					// 激活导航位置
					setSidebarActive("order-manage");
				});
			</script>
	</body>

</html>
