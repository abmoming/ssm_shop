<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!-- 导航侧栏 -->
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
<section class="sidebar">
	<!-- Sidebar user panel -->
	<div class="user-panel">
		<div class="pull-left image">
			<img
			 src="${pageContext.request.contextPath }/img/admin/user2-160x160.jpg"
			 class="img-circle"
			 alt="User Image"
			>
		</div>
		<div class="pull-left info">
			<p>张猿猿</p>
			<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
		</div>
	</div>
	<!-- sidebar menu: : style can be found in sidebar.less -->
	<ul class="sidebar-menu">
		<li class="header">菜单</li>

		<li id="admin-index"><a href="admin.action"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

		<!-- 菜单 -->



		<li class="treeview">
			<a href="#">
				<i class="fa fa-folder"></i> <span>系统管理</span>
				<span class="pull-right-container">
					<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
			<ul class="treeview-menu">

				<li id="admin-login">
					<a href="${pageContext.request.contextPath }/users/usersList.action">
						<i class="fa fa-circle-o"></i> 用户管理
					</a>
				</li>
				
				<li id="admin-login">
					<a href="${pageContext.request.contextPath }/role/roleList.action">
						<i class="fa fa-circle-o"></i> 角色管理
					</a>
				</li>
				
				<li id="admin-login">
					<a href="${pageContext.request.contextPath }/permission/permissionList.action">
						<i class="fa fa-circle-o"></i> 资源权限管理
					</a>
				</li>
				
				<li id="admin-login">
					<a href="all-admin-login.html">
						<i class="fa fa-circle-o"></i> 访问日志
					</a>
				</li>

			</ul>
		</li>


		<li class="treeview">
			<a href="#">
				<i class="fa fa-pie-chart"></i> <span>基础数据</span>
				<span class="pull-right-container">
					<i class="fa fa-angle-left pull-right"></i>
				</span>
			</a>
			<ul class="treeview-menu">

				<li id="charts-chartjs">
					<a href="${pageContext.request.contextPath }/category/categoryList.action">
						<i class="fa fa-circle-o"></i> 分类管理
					</a>
				</li>

				<li id="charts-morris">
					<a href="${pageContext.request.contextPath }/orders/ordersList.action">
						<i class="fa fa-circle-o"></i> 订单管理
					</a>
				</li>

			</ul>
		</li>

	</ul>
</section>
<!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->