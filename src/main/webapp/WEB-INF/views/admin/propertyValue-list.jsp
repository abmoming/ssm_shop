<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ include file="../include/admin-header.jsp" %>
<%@ include file="../include/admin-sidebar.jsp" %>

<style>
	.addBtn{
		width:76px;
		margin:0 auto;
	}
</style>
<!-- 内容区域 -->
			<div class="content-wrapper">
				<!-- 正文区域 -->
				<section class="content">
					<!-- .box-body -->
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">${product.name }的产品属性</h3> </div>
						<div class="box-body">
							<!-- 数据表格 -->
							<div class="table-box">
								<!--工具栏-->
								<div class="pull-left">
									<div class="form-group form-inline">
											<button type="button" class="btn btn-default" title="刷新" onclick="window.location.reload();"> <i class="fa fa-refresh"></i> 刷新 </button> </div>
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
								<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
									<thead>
										<tr>
											<th class="sorting">属性名称</th>
											<th class="sorting">属性值</th>
											<th class="text-center">操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${propertyValueList }" var="propertyValue">
										<tr>
											<td>${propertyValue.property.name }</td>
											<td>${propertyValue.value }</td>
											<td class="text-center">
												<button type="button" class="btn bg-olive b tn-xs" onclick='location.href="${pageContext.request.contextPath}/propertyValue/property/propertyValueUpdate.action?propertyId=${propertyValue.property.id }"'>编辑属性值</button>
												<button type="button" class="btn bg-olive b tn-xs" onclick='location.href=""'>删除</button>
											</td>
										</tr>
										</c:forEach>
									</tbody>
								</table>
								<!--数据列表/-->
							</div>
							<!-- 数据表格 /-->
						</div>
						<!-- /.box-body -->
						<!-- .box-footer-->
						<div class="box-footer">
							<div class="pull-left">
								<div class="form-group form-inline"> 总共${pageInfo.pages } 页，共${pageInfo.total } 条数据。 每页
									<select id="pageSizeSelect" class="form-control" onchange="getPageSize()" >
										<option <c:if test="${param.pageSize == 5 }">selected</c:if>>5</option>
										<option <c:if test="${param.pageSize == 10 }">selected</c:if>>10</option>
										<option <c:if test="${param.pageSize == 15 }">selected</c:if>>15</option>
										<option <c:if test="${param.pageSize == 20 }">selected</c:if>>20</option>
										<option <c:if test="${param.pageSize == 50 }">selected</c:if>>50</option>
										<option <c:if test="${param.pageSize == 80 }">selected</c:if>>80</option>
									</select> 条 </div>
							</div>
							<div class="box-tools pull-right">
								<ul class="pagination">
									<li>
										<a href="${pageContext.request.contextPath}/propertyValue/propertyValueList.action?pageNum=1&pageSize=${pageInfo.pageSize}&categoryId=${categoryId}&productId=${product.id}" aria-label="Previous">首页</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/propertyValue/propertyValueList.action?pageNum=${pageInfo.pageNum-1 }&pageSize=${pageInfo.pageSize}&categoryId=${categoryId}&productId=${product.id}">上一页</a>
									</li>
									<c:forEach items="${pageInfo.navigatepageNums }" var="page">
									<li>
										<a href="${pageContext.request.contextPath}/propertyValue/propertyValueList.action?pageNum=${page }&pageSize=${pageInfo.pageSize}&categoryId=${categoryId}&productId=${product.id}">${page }</a>
									</li>
									</c:forEach>
									<li>
										<a href="${pageContext.request.contextPath}/propertyValue/propertyValueList.action?pageNum=${pageInfo.pageNum+1 }&pageSize=${pageInfo.pageSize}&categoryId=${categoryId}&productId=${product.id}">下一页</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath}/propertyValue/propertyValueList.action?pageNum=${pageInfo.pages }&pageSize=${pageInfo.pageSize}&categoryId=${categoryId}&productId=${product.id}" aria-label="Next">尾页</a>
									</li>
								</ul>
							</div>
						</div>
						<!-- /.box-footer-->
					</div>
				</section>
				<!-- 正文区域 /-->
				<div class="box box-primary" style="width:600px;margin:15px auto 10px;">
					<div class="box-header with-border">
					    <h3 class="box-title">属性值添加</h3>
					</div>
		          	<form role="form" id="addForm" action="${pageContext.request.contextPath }/propertyValue/propertyValueAdd.action?productId=${product.id}&categoryId=${categoryId}" method="post">
		              <div class="box-body">
		                  <div class="form-group">
		                  	<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
		                  		<thead>
		                  			<tr>
		                  				<th>属性名称</th>
		                  				<th>属性值</th>
		                  			</tr>
		                  		</thead>
		                  		<tbody>
		                  			<tr>
		                  				<td>
	                  						<select class="form-control direction" name="propertyId">
						                  	  	<c:forEach items="${pageInfo.list }" var="property">
						                  	  		<option value="${property.id }">${property.name }</option>
						                  	  	</c:forEach>
					                  	  	</select>
		                  				</td>
	                  					<td>
		                  					<input type="text" class="form-control" name="value" placeholder="属性值">
		                  				</td>
		                  			</tr>
		                  		</tbody>
		                  	</table>
		                  </div>
		              </div>
				        <div class="box-footer addBtn">
				            <button type="button" class="btn btn-primary" onclick="checkValueIsNull()">添加</button>
				        </div>
			    </form>
				</div>
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
				// 激活导航位置
				setSidebarActive("order-manage");
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

			function getPageSize() {
				var pageSize = $("#pageSizeSelect").val();
				location.href = "${pageContext.request.contextPath}/propertyValue/propertyValueList.action?page=1&pageSize=" + pageSize+"&categoryId=${categoryId}&productId=${product.id}";
			}
			
			function checkValueIsNull(){
				$.post(
					//请求的url
					$("#addForm").attr("action"),	
					//提交表单的数据
					$("#addForm").serialize(),
					function(data){
						if(data == "true"){
							var con = confirm("成功添加属性值");
							if(con){
								location.href="${pageContext.request.contextPath}/propertyValue/propertyValueList.action?categoryId=${categoryId}&productId=${product.id}";
							}
						}else{
							confirm("此属性已存在属性值，请进行修改");
						}
					}
				);
			}
		</script>
	</body>

</html>