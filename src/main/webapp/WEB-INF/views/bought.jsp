<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="include/header.jsp"%>
<%@include file="include/top.jsp"%>
<%@include file="include/mini-search.jsp"%>

<style>
div.boughtDiv {
	max-width: 1013px;
	margin: 10px auto;
}

div.orderType div {
	border-bottom: 2px solid #E8E8E8;
	float: left;
}

div.orderType a {
	border-right: 1px solid #E8E8E8;
	display: inline-block;
	font-size: 16px;
	font-weight: bold;
	color: black;
	margin-bottom: 10px;
	padding: 0px 20px;
	text-decoration: none;
}

div.orderType a:hover {
	color: #FF0036;
	text-decoration: none;
}

div.orderType div.selectedOrderType {
	border-bottom: 2px solid #FF0036;
}

div.orderType div.selectedOrderType a {
	color: #FF0036;
}

div.orderTypeLastOne {
	overflow: hidden;
	float: none !important;
	border-bottom: 2px solid #E8E8E8;
	height: 35px;
}

a.noRightborder {
	border-right-width: 0px !important;
}

table.orderListTitleTable {
	border: 1px solid #E8E8E8;
	width: 100%;
	margin: 20px 0px;
	background-color: #F5F5F5;
	text-align: center;
	font-size: 12px;
}

table.orderListTitleTable td {
	padding: 12px 0px;
}

div.boughtDiv {
	max-width: 1013px;
	margin: 10px auto;
}

table.orderListItemTable {
	border: 2px solid #ECECEC;
	width: 100%;
	margin: 20px 0px;
	font-size: 12px;
}

table.orderListItemTable:hover {
	border: 2px solid #aaa !important;
}

table.orderListItemTable td {
	padding: 8px 10px;
}

tr.orderListItemFirstTR {
	background-color: #F1F1F1;
}

div.orderItemWangWangGif {
	display: inline-block;
	width: 67px;
	height: 22px;
	background-image: url(img/fore/wangwang.gif);
	background-repeat: no-repeat;
	background-color: transparent;
	background-attachment: scroll;
	background-position: -0px -0px;
	position: relative;
	top: 0px;
	left: 2px;
}

td.orderItemDeleteTD {
	text-align: right;
}

span.orderListItemDelete {
	display: inline-block;
	margin: 0px 10px;
	color: #999999;
	font-size: 16px;
}

div.orderListItemProductLinkOutDiv {
	position: relative;
	height: 80px;
}

div.orderListItemProductLinkInnerDiv {
	position: absolute;
	bottom: 0px;
}

div.orderListItemProductOriginalPrice {
	color: #999999;
	font-size: 14px;
}

div.orderListItemProductPrice {
	color: #3C3C3C;
	font-size: 14px;
}

td.orderListItemNumberTD {
	text-align: center;
}

td.orderItemOrderInfoPartTD {
	border: solid 1px #ECECEC;
}

span.orderListItemNumber {
	color: #3C3C3C;
}

td.orderListItemProductRealPriceTD {
	text-align: center;
}

div.orderListItemProductRealPrice {
	color: #3C3C3C;
	font-size: 14px;
	font-weight: bold;
}

div.orderListItemPriceWithTransport {
	color: #6C6C6C;
	font-size: 12px;
}

td.orderListItemButtonTD {
	text-align: center;
}

button.orderListItemReview {
	border: 1px solid #DCDCDC;
	background-color: #fff;
	border-radius: 2px;
	color: #3C3C3C;
	font-size: 12px;
	font-weight: bold;
	padding: 6px 12px;
}

button.orderListItemReview:hover {
	border-color: #C40000;
	color: #C40000;
}

button.orderListItemConfirm {
	background-color: #66B6FF;
	border-radius: 2px;
	color: white;
	font-size: 12px;
	font-weight: bold;
	border-width: 0px;
	padding: 6px 12px;
}

button.orderListItemConfirm:hover {
	background-color: #118ADB;
}

a {
	color: #999;
}

a:hover {
	text-decoration: none;
	color: #FF0036;
}
</style>

<script>
$(function(){
	$("a[orderStatus]").click(function(){
		var ordersStatus = $(this).attr("orderStatus");
		if("all" == ordersStatus){
			$("table[orderStatus]").show();
		}else{
			$("table[orderStatus]").hide();
			$("table[orderStatus="+ ordersStatus +"]").show();
		}
		
		$("div.orderType div").removeClass("selectedOrderType");
        $(this).parent("div").addClass("selectedOrderType");
	});
	
	$(".deleteOrderLink").click(function(){
		var con = confirm("是否要删除该订单？");
		if(con == true){
			var ordersId = $(this).attr("oid");
			$.post(
				"deleteOrders.action",
				{"ordersId":ordersId},
				function(data){
					if("success" == data){
						$("table[oid="+ ordersId +"]").hide();
					}
				}
			);
		}
	});
	
	
});

</script>

<div class="boughtDiv">
	<div class="orderType">
		<div class="selectedOrderType">
			<a orderStatus="all" href="#nowhere">所有订单</a>
		</div>
		<div>
			<a orderStatus="waitPay" href="#nowhere">待付款</a>
		</div>
		<div>
			<a orderStatus="waitDelivery" href="#nowhere">待发货</a>
		</div>
		<div>
			<a orderStatus="waitConfirm" href="#nowhere">待收货</a>
		</div>
		<div>
			<a orderStatus="waitReview" href="#nowhere" class="noRightborder">待评价</a>
		</div>
		<div class="orderTypeLastOne">
			<a class="noRightborder"> </a>
		</div>
	</div>
	<div style="clear: both"></div>
	<div class="orderListTitle">
		<table class="orderListTitleTable">
			<tr>
				<td>宝贝</td>
				<td width="121px">单价</td>
				<td width="121px">数量</td>
				<td width="141px">实付款</td>
				<td width="121px">交易操作</td>
			</tr>
		</table>

	</div>


	<div class="orderListItem">
		<c:forEach items="${ordersList }" var="orders">
			<table class="orderListItemTable" orderStatus="${orders.status}"
				oid="${orders.id}">
				<tr class="orderListItemFirstTR">
					<td colspan="2"><b><fmt:formatDate
								value="${orders.createDate}" pattern="yyyy-MM-dd" /></b> <span>订单号:
							${orders.ordersCode} </span></td>
					<td colspan="2"><img width="13px"
						src="img/fore/orderItemTmall.png">天猫商场</td>
					<td colspan="1"><a class="wangwanglink" href="#nowhere">
							<div class="orderItemWangWangGif"></div>
					</a></td>
					<td class="orderItemDeleteTD"><a class="deleteOrderLink"
						oid="${orders.id}" href="#nowhere"> <span
							class="orderListItemDelete glyphicon glyphicon-trash"></span>
					</a></td>
				</tr>
				<c:forEach items="${orders.ordersItemList }" var="ordersItem"
					varStatus="varStatus">
					<tr class="orderItemProductInfoPartTR">
						<td class="orderItemProductInfoPartTD"><img width="80"
							height="80" src="img/product/${ordersItem.product.id}/1.jpg">
						</td>
						<td class="orderItemProductInfoPartTD">
							<div class="orderListItemProductLinkOutDiv">
								<a href="foreproduct?pid=${ordersItem.product.id}">${ordersItem.product.name}</a>
								<div class="orderListItemProductLinkInnerDiv">
									<img src="img/fore/creditcard.png" title="支持信用卡支付"> <img
										src="img/fore/7day.png" title="消费者保障服务,承诺7天退货"> <img
										src="img/fore/promise.png" title="消费者保障服务,承诺如实描述">
								</div>
							</div>
						</td>
						<td class="orderItemProductInfoPartTD" width="100px">
							<div class="orderListItemProductOriginalPrice">￥${ordersItem.product.price}</div>
							<div class="orderListItemProductPrice">￥${ordersItem.product.price}</div>
						</td>
						<c:if test="${varStatus.count == 1 }">
							<td valign="top" rowspan="${fn:length(orders.ordersItemList)}"
								class="orderListItemNumberTD orderItemOrderInfoPartTD"
								width="100px"><span class="orderListItemNumber">${orders.totalNumber}</span>
							</td>
							<td valign="top" rowspan="${fn:length(orders.ordersItemList)}"
								width="120px"
								class="orderListItemProductRealPriceTD orderItemOrderInfoPartTD">
								<div class="orderListItemProductRealPrice">￥${orders.totalMoney}</div>
								<div class="orderListItemPriceWithTransport">(含运费：￥0.00)</div>
							</td>
							<td valign="top" rowspan="${fn:length(orders.ordersItemList)}"
								class="orderListItemButtonTD orderItemOrderInfoPartTD"
								width="100px">
								<c:if test="${orders.status == 'waitPay' }">
									<a
										href="alipayPage.action?ordersId=${orders.id}&totalMoney=${orders.totalMoney}">
										<button class="orderListItemConfirm">待付款</button>
									</a>
								</c:if> 
								<c:if test="${orders.status == 'waitConfirm' }">
									<a href="confirmPay?ordersId=${orders.id}"><button
											class="orderListItemConfirm">确认收货</button> </a>
								</c:if> 
								<!-- 
                                  <a href="alipay?order_id=${o.id}&total=${o.total}">
                                   <button class="orderListItemConfirm">付款</button>
                                  </a>
                                --> 
                                <c:if test="${orders.status == 'waitDelivery' }">
									<span>待发货</span>
								</c:if>
								 <%--  <button class="btn btn-info btn-sm ask2delivery" link="admin_order_delivery?id=${o.id}">
                                   	催卖家发货</button> --%> <c:if
									test="${orders.status == 'waitReview' }">
									<a href="review?order_id=${orders.id}">
										<button class="orderListItemReview">待评价</button>
									</a>
								</c:if>
							</td>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</c:forEach>
	</div>
</div>


<%@include file="include/footer.jsp"%>
