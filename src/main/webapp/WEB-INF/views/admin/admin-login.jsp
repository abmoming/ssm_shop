<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta
		 http-equiv="X-UA-Compatible"
		 content="IE=edge"
		>
		<title>数据 - AdminLTE2定制版 | Log in</title> <!-- Tell the browser to be responsive to screen width -->
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
		 href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css"
		>
		<link
		 rel="stylesheet"
		 href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css"
		>
	</head>
	<body class="hold-transition login-page">
		<div class="login-box">
			<div class="login-logo"> <a href="all-admin-index.html"><b>ITCAST</b>后台管理系统</a> </div> <!-- /.login-logo -->
			<div class="login-box-body">
				<p class="login-box-msg">登录系统</p>
				<form
				 action="all-admin-index.html"
				 method="get"
				>
					<div class="form-group has-feedback"> <input
						 type="email"
						 class="form-control"
						 placeholder="Email"
						> <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
					</div>
					<div class="form-group has-feedback"> <input
						 type="password"
						 class="form-control"
						 placeholder="密码"
						> <span class="glyphicon glyphicon-lock form-control-feedback"></span> </div>
					<div class="row">
						<div class="col-xs-8">
							<div class="checkbox icheck"> <label><input type="checkbox"> 记住 下次自动登录</label> </div>
						</div>
						<div class="col-xs-4"> <button
							 type="submit"
							 class="btn btn-primary btn-block btn-flat"
							>登录</button> </div>
					</div>
				</form>
				<a href="#">忘记密码</a><br>
			</div>
		</div>

		<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
		<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
		<script>
			$(function() {
				$('input').iCheck({
					checkboxClass: 'icheckbox_square-blue',
					radioClass: 'iradio_square-blue',
					increaseArea: '20%'
				});
			});
		</script>
	</body>
</html>
