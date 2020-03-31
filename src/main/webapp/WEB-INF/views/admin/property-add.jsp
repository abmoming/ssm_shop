<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ include file="../include/admin-header.jsp" %>
<%@ include file="../include/admin-sidebar.jsp" %>

			<!-- 内容区域 -->
			<div class="content-wrapper">
				<form action="${pageContext.request.contextPath}/property/propertyAdd.action?categoryId=${categoryId}" method="post">
					<%-- <input type="hidden" name="categoryId" value="${categoryId }"> --%>
					<!-- 正文区域 -->
					<section class="content">
						<!--产品信息-->
						<div class="panel panel-default">
							<div class="panel-heading">分类属性</div>
							<div class="row data-type">
								<div class="col-md-2 title">属性名称</div>
								<div class="col-md-4 data"> <input type="text" class="form-control" name="name" placeholder="产品名称" value=""> </div>
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
			$(document).ready(function() {
				$('#datepicker-a3').datetimepicker({
					format: "yyyy-mm-dd hh:ii",
					autoclose: true,
					todayBtn: true,
					language: "zh-CN"
				});
			});
			$(document).ready(function() {
				// 激活导航位置
				setSidebarActive("order-manage");
				$("#datepicker-a3").datetimepicker({
					format: "yyyy-mm-dd hh:ii",
				});
			});
		</script>
	</body>

</html>
			