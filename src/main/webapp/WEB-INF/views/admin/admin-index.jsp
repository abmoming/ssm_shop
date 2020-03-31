<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<jsp:include page="../include/admin-header.jsp"></jsp:include>
<jsp:include page="../include/admin-sidebar.jsp"></jsp:include>

	
			<!-- 内容区域 -->
			<div class="content-wrapper">
				<!-- <img src="../img/center.jpg" background-size="size"/> -->
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
				if (liObj.length > 0) {
					liObj.parent().parent().addClass("active");
					liObj.addClass("active");
				}
			}


			$(document).ready(function() {
				// 激活导航位置
				setSidebarActive("admin-index");
			});
		</script>
	</body>

</html>