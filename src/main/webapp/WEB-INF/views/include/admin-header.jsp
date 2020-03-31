<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<html>

	<head>
		<!-- 页面meta -->
		<meta charset="utf-8">
		<meta
		 http-equiv="X-UA-Compatible"
		 content="IE=edge"
		>

		<title>数据 - AdminLTE2定制版</title>
		<meta
		 name="description"
		 content="AdminLTE2定制版"
		>
		<meta
		 name="keywords"
		 content="AdminLTE2定制版"
		>

		<!-- Tell the browser to be responsive to screen width -->
		<meta
		 content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
		 name="viewport"
		>

		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/morris/morris.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/select2/select2.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/css/admin/style.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css"
		>
	</head>

	<body class="hold-transition skin-purple sidebar-mini">

		<div class="wrapper">
			
			<!-- 页面头部 -->
			<header class="main-header">

				<!-- Logo -->
				<a
				 href="index.html"
				 class="logo"
				>
					<!-- mini logo for sidebar mini 50x50 pixels -->
					<span class="logo-mini"><b>数据</b></span>
					<!-- logo for regular state and mobile devices -->
					<span class="logo-lg"><b>数据</b>后台管理</span>
				</a>


				<!-- Header Navbar: style can be found in header.less -->
				<nav class="navbar navbar-static-top">
					<!-- Sidebar toggle button-->
					<a
					 href="#"
					 class="sidebar-toggle"
					 data-toggle="offcanvas"
					 role="button"
					>
						<span class="sr-only">Toggle navigation</span>
					</a>

					<div class="navbar-custom-menu">
						<ul class="nav navbar-nav">
							<!-- User Account: style can be found in dropdown.less -->
							<li class="dropdown user user-menu">
								<a
								 href="#"
								 class="dropdown-toggle"
								 data-toggle="dropdown"
								>
									<img
									 src="${pageContext.request.contextPath}/img/admin/user2-160x160.jpg"
									 class="user-image"
									 alt="User Image"
									>
									<span class="hidden-xs">张猿猿</span>
								</a>
								<ul class="dropdown-menu">
									<!-- User image -->
									<li class="user-header">
										<img
										 src="${pageContext.request.contextPath}/img/admin/user2-160x160.jpg"
										 class="img-circle"
										 alt="User Image"
										>

										<p>
											张猿猿 - 数据管理员
											<small>最后登录 11:20AM</small>
										</p>
									</li>
									<!-- Menu Footer-->
									<li class="user-footer">
										<div class="pull-left">
											<a
											 href="#"
											 class="btn btn-default btn-flat"
											>修改密码</a>
										</div>
										<div class="pull-right">
											<a
											 href="${pageContext.request.contextPath }/logout.action"
											 class="btn btn-default btn-flat"
											>注销</a>
										</div>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
			</header>
			<!-- 页面头部 /-->