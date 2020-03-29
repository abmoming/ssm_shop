<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%-- 顶部导航栏 --%>
<nav id="site-nav" role="navigation">
    <div class="workArea">
            <span>喵，欢迎来天猫</span>
            <c:if test="${empty user }">
            <span><a href="loginPage.action">请登录</a></span>
            <span><a href="registerPage.action">免费注册</a></span>
            </c:if>
            <c:if test="${!empty user }">
            <span>Hi，${user.username }</span>
            <span><a href="nowhere.action">积分 <strong>1251</strong></a></span>
            <span><a href="javascript:void(0)" onclick="loginOut()">退出</a></span>
            </c:if>
        <span class="pull-right">
            <a href="javascript:void(0)" onclick="myOrders()">我的订单</a>
            <a href="javascript:void(0)" onclick="myCart()">
                <span class="glyphicon glyphicon-shopping-cart redColor"></span>
                                     购物车
                <strong id="cartTotalItemNumber">${cartTotalItemNumber}</strong>件
            </a>
        </span>
    </div>
</nav>

<script type="text/javascript">
	function myOrders(){
		$.post(
			"checkLogin.action",
			function(data){
				if(data == "success"){
					location.href="boughtPage.action";
				} else {
					location.href="loginPage.action";
				}
			}
		);
	}
	
	function myCart(){
		$.post(
				"checkLogin.action",
				function(data){
					if(data == "success"){
						location.href="cart.action";
					} else {
						location.href="loginPage.action";
					}
				}
			);
	}
	
	function loginOut(){
		var con = confirm("是否要注销用户？");
		if(con == true){
			location.href="loginOut.action";
		}
	}
	
</script>
