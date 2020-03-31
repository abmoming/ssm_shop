<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ include file="../include/admin-header.jsp" %>
<%@ include file="../include/admin-sidebar.jsp" %>

			<!-- 内容区域 -->
			<div class="content-wrapper">
				<!-- 内容头部 -->
				<section class="content-header">
					<h1>分类管理 <small>全部分类</small> </h1>
					<ol class="breadcrumb">
						<li>
							<a href="${pageContext.request.contextPath}/admin.action"><i class="fa fa-dashboard"></i> 首页</a>
						</li>
						<li>
							<a href="${pageContext.request.contextPath}/category/categoryList.action?pageNum=1&pageSize=${pageInfo.pageSize}">分类管理</a>
						</li>
						<li class="active">全部分类</li>
					</ol>
				</section>
				<!-- 内容头部 /-->
				<!-- 正文区域 -->
				<section class="content">
					<!-- .box-body -->
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">列表</h3> </div>
						<div class="box-body">
							<!-- 数据表格 -->
							<div class="table-box">
								<!--工具栏-->
								<div class="pull-left">
									<div class="form-group form-inline">
										<div class="btn-group">
											<button type="button" class="btn btn-default" title="删除" onclick=deleteOrBulkDelete()><i class="fa fa-trash-o"></i> 删除 </button>
											<button type="button" class="btn btn-default" title="刷新" onclick='location.href="${pageContext.request.contextPath}/category/categoryList.action"'> <i class="fa fa-refresh"></i> 刷新 </button> 
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
								<table id="dataList" class="table table-bordered table-striped table-hover dataT able">
									<thead>
										<tr>
											<th class="" style="padding-right: 0px">
												<input id="selall" type="checkbox" class="icheckbox_square-blue">
											</th>
											<th class="sorting_asc">ID</th>
											<th class="sorting">分类名称</th>
											<th class="text-center">操作</th>
										</tr>
										<c:forEach items="${pageInfo.list }" var="category">
										<tr>
											<td><input name="categoryId" type="checkbox" value="${category.id }"></td>
											<td>${category.id }</td>
											<td>${category.name }</td>
											<td class="text-center"> 
												<button type="button" class="btn bg-olive b tn-xs" onclick='location.href="${pageContext.request.contextPath}/category/categoryUpdatePage.action?categoryId=${category.id }"'>编辑分类</button> 
												<button type="button" class="btn bg-olive b tn-xs" onclick='location.href="${pageContext.request.contextPath}/product/productList.action?categoryId=${category.id }"'>产品管理</button> 
												<button type="button" class="btn bg-olive b tn-xs" onclick='location.href="${pageContext.request.contextPath}/property/propertyList.action?categoryId=${category.id }"'>属性管理</button> 
											</td>
										</tr>
										</c:forEach>
									</thead>
								</table>
								<!--数据列表/-->
							</div>
							<!-- 数据表格 /-->
						</div>
						<!-- /.box-body -->
						<!-- .box-footer-->
						<div class="box-footer">
							<div class="pull-left">
								<div class="form-group form-inline"> 总共${pageInfo.pages } 页，共${pageInfo.total }条数据。 每页
									<select id="pageSizeSelect" class="form-control" onchange="getPageSize()">
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
										<a href="${pageContext.request.contextPath }/category/categoryList.action?pageNum=1&pageSize=${pageInfo.pageSize}" aria-label="Previous">首页</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath }/category/categoryList.action?pageNum=${pageInfo.pageNum-1 }&pageSize=${pageInfo.pageSize}">上一页</a>
									</li>
									<c:forEach  begin="1" end="${pageInfo.pages }" var="pageNum">
									<li>
										<a href="${pageContext.request.contextPath }/category/categoryList.action?pageNum=${pageNum }&pageSize=${pageInfo.pageSize}">${pageNum }</a>
									</li>
									</c:forEach>
									<li>
										<a href="${pageContext.request.contextPath }/category/categoryList.action?pageNum=${pageInfo.pageNum+1 }&pageSize=${pageInfo.pageSize}">下一页</a>
									</li>
									<li>
										<a href="${pageContext.request.contextPath }/category/categoryList.action?pageNum=${pageInfo.pages }&pageSize=${pageInfo.pageSize}" aria-label="Next">尾页</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</section>
				<!-- 正文区域 /-->
				<div class="box box-primary" style="width:280px;margin:15px auto 10px;">
					<div class="box-header with-border">
					    <h3 class="box-title">分类添加</h3>
					</div>
		          	<form role="form" action="${pageContext.request.contextPath }/category/categoryAdd.action" method="post">
		              <div class="box-body">
		                  <div class="form-group">
		                      <label for="categoryName">分类名称</label>
		                      <input type="text" class="form-control" id="categoryName" name="name" placeholder="分类名称">
		                  </div>
		              </div>
				        <div class="box-footer">
				            <button type="submit" class="btn btn-primary">添加</button>
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
			
			function getCategoryIdArr(){
				var str = "";
				$("input[name='categoryId'][type='checkbox']:checked").each(function(){
					str += "&categoryId="+$(this).val();
					
				});
				var categoryIdArr = str.substring(1);
				
				return categoryIdArr;
			}
			
			function deleteOrBulkDelete(){
				var con = confirm("是否删除该分类类型？");
				if(con == true){
					if(!$("input[type=checkbox]").is(":checked")){
						return confirm("请选中产品分类类型");
					}
					
					var categoryIdArr = getCategoryIdArr();
					
					location.href="${pageContext.request.contextPath}/category/categoryDelete.action?" + categoryIdArr;
				}
			}
			
			function getPageSize() {
				var pageSize = $("#pageSizeSelect").val();
				location.href = "${pageContext.request.contextPath}/category/categoryList.action?pageNum=1&pageSize=" + pageSize;
			}
		</script>
	</body>

</html>