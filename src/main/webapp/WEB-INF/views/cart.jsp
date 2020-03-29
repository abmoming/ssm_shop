<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header.jsp" %>
<%@include file="include/top.jsp" %>
<%@include file="include/mini-search.jsp" %>
<style>
    div.cartDiv {
        max-width: 1013px;
        margin: 10px auto;
        color: black;
    }

    table.cartProductTable {
        width: 100%;
        font-size: 12px;
    }

    tr.cartProductItemTR {
        border: 1px solid #CCCCCC;
    }

    tr.cartProductItemTR td {
        padding: 20px 20px;
    }

    table.cartProductTable th {
        font-weight: normal;
        color: #3C3C3C;
        padding: 20px 20px;
    }

    img.cartProductImg {
        padding: 1px;
        border: 1px solid #EEEEEE;
        width: 80px;
        height: 80px;
    }

    table.cartProductTable th.selectAndImage {
        width: 140px;
    }

    table.cartProductTable th.operation {
        width: 30px;
    }

    div.cartProductLinkOutDiv {
        position: relative;
        height: 80px;
    }

    a.cartProductLink {
        color: #3C3C3C;
    }

    a.cartProductLink:hover {
        color: #FF0036;
        text-decoration: underline;
    }

    div.cartProductLinkInnerDiv {
        position: absolute;
        bottom: 0;
        height: 20px;
    }

    span.cartProductItemOringalPrice {
        text-decoration: line-through;
        color: #9C9C9C;
        display: block;
        font-weight: bold;
        font-size: 14px;
    }

    span.cartProductItemPromotionPrice {
        font-family: Arial;
        font-size: 14px;
        font-weight: bold;
        color: #FF0036;
    }

    div.cartProductChangeNumberDiv {
        border: solid 1px #E5E5E5;
        width: 80px;
    }

    div.cartProductChangeNumberDiv a {
        width: 14px;
        display: inline-block;
        text-align: center;
        color: black;
        text-decoration: none;
    }

    div.cartProductChangeNumberDiv input {
        border: solid 1px #AAAAAA;
        width: 42px;
        display: inline-block;
    }

    span.cartProductItemSmallSumPrice {
        font-family: Arial;
        font-size: 14px;
        font-weight: bold;
        color: #FF0036;
    }

    img.cartProductItemIfSelected, img.selectAllItem {
        cursor: pointer;
    }

    div.cartDiv {
        max-width: 1013px;
        margin: 10px auto;
        color: black;
    }

    div.cartTitle button {
        background-color: #AAAAAA;
        border: 1px solid #AAAAAA;
        color: white;
        width: 53px;
        height: 25px;
        border-radius: 2px;
    }

    span.cartTitlePrice {
        color: #C40000;
        font-size: 14px;
        font-weight: bold;
        margin-left: 5px;
        margin-right: 3px;
    }

    div.cartFoot {
        background-color: #E5E5E5;
        line-height: 50px;
        margin: 20px 0px;
        color: black;
        padding-left: 20px;
    }

    div.cartFoot button {
        background-color: #AAAAAA;
        border: 0px solid #AAAAAA;
        color: white;
        width: 120px;
        height: 50px;
        font-size: 20px;
        text-align: center;
    }

    img.cartProductItemIfSelected, img.selectAllItem {
        cursor: pointer;
    }

    span.cartSumNumber {
        color: #C40000;
        font-weight: bold;
        font-size: 16px;
    }

    span.cartSumPrice {
        color: #C40000;
        font-weight: bold;
        font-size: 20px;
    }
</style>

<script>
$(function(){
	$("img.cartProductItemIfSelected").click(function(){
		var status = $(this).attr("selectit");
		if("selectit" == status){
			$(this).attr("src","img/fore/cartNotSelected.png");
			$(this).attr("selectit","false");
			$(this).parents("tr.cartProductItemTR").css("background-color", "#fff");
		}else{
			$(this).attr("src","img/fore/cartSelected.png");
			$(this).attr("selectit","selectit");
			$(this).parents("tr.cartProductItemTR").css("background-color", "#FFF8E1");
		}
		syncSelect();
		syncCreateOrderButton();
		calcCartSumPriceAndNumber();
	});
	
	function syncSelect(){
		var selectAll = true;
		$(".cartProductItemIfSelected").each(function(){
			var status = $(this).attr("selectit");
			if("false" == status){
				selectAll = false;
			}
		})
		
		if(selectAll){
			$("img.selectAllItem").attr("selectit","selectit");
			$("img.selectAllItem").attr("src","img/fore/cartSelected.png");
		}else{
			$("img.selectAllItem").attr("selectit","false");	//当全选之后,点击某一个取消时候;要把全选按钮的状态值改为false;否则下次点击全选时状态依旧为selectit
			$("img.selectAllItem").attr("src","img/fore/cartNotSelected.png");
		}
	}
	
	function calcCartSumPriceAndNumber(){
		var totalMoney = 0;
		var totalNumber = 0;
		$("img.cartProductItemIfSelected[selectit='selectit']").each(function(){
			var orderItemId = $(this).attr("orderItemId");
			var price = $("span.cartProductItemSmallSumPrice[orderItemId='"+ orderItemId +"']").text();
			price = price.replace(/,/g, "");
			price = price.replace(/,/g, "");
			totalMoney += new Number(price);
			
			var num = $("input.orderItemNumberSetting[orderItemId='"+ orderItemId +"']").val();
			totalNumber += new Number(num);
			
		});
		
		$("span.cartTitlePrice").html("￥"+parseFloat(totalMoney).toFixed(2));
		$("span.cartSumNumber").html(totalNumber);
		$("span.cartSumPrice").html("￥"+parseFloat(totalMoney).toFixed(2));
	}
	
	function syncCreateOrderButton(){
		var selectAny = false;
		$("img.cartProductItemIfSelected").each(function(){
			var status = $(this).attr("selectit");
			if("selectit" == status){
				selectAny = true;
			}
		});
		
		if(selectAny){
			$("button.createOrderButton").css("background-color","#C40000");
			$("button.createOrderButton").removeAttr("disabled");
		}else{
			$("button.createOrderButton").css("background-color", "#AAAAAA");
			$("button.createOrderButton").attr("disabled","disabled");
		}
	}
	
	/* 全选*/
	$("img.selectAllItem").click(function(){
		var status = $("img.selectAllItem").attr("selectit");
		if("selectit" == status){
			$("img.selectAllItem").attr("selectit","false");
			$("img.selectAllItem").attr("src","img/fore/cartNotSelected.png");
			$(".cartProductItemIfSelected").each(function(){
				$(this).attr("selectit","false");
				$(this).attr("src","img/fore/cartNotSelected.png");
			});
		}else{
			$("img.selectAllItem").attr("selectit","selectit");
			$("img.selectAllItem").attr("src","img/fore/cartSelected.png");
			$(".cartProductItemIfSelected").each(function(){
				$(this).attr("selectit","selectit");
				$(this).attr("src","img/fore/cartSelected.png");
			});
		}

		calcCartSumPriceAndNumber();
		syncCreateOrderButton();
		
	});
	
	/* 
		数量加减
		阻止冒泡事件:防止点击子类触发父类event.stopPropagation()
		阻止默认事件:使元素本身功能无效event.preventDefault()
	*/
	$("a.numberMinus").click(function(){
		var product_id = $(this).attr("product_id");
		var price = $("span.cartProductItemPromotionPrice[product_id='"+product_id+"']").text();
		var num = $("input.orderItemNumberSetting[product_id='"+product_id+"']").val();
		
		num --;
		if(num <= 0)
			num = 1;
		totalPriceWithIncreaseAndDecrease(price,num,product_id);
	});
		
	$("a.numberPlus").click(function(){
		var product_id = $(this).attr("product_id");
		var price = $("span.cartProductItemPromotionPrice[product_id='"+product_id+"']").text();
		var stock = $(this).attr("stock");
		var num = $("input.orderItemNumberSetting[product_id='"+product_id+"']").val();
		
		num ++;
		if(num >= stock)
			num = stock;
		totalPriceWithIncreaseAndDecrease(price,num,product_id);
	});
	
	//键盘按下弹起时触发
	$("input.orderItemNumberSetting").keyup(function(){
		var product_id = $(this).attr("product_id");
		var stock = $("a.numberPlus[product_id='"+product_id+"']").attr("stock");
		var price = $("span.cartProductItemPromotionPrice[product_id='"+product_id+"']").text();
		var num = $("input.orderItemNumberSetting[product_id='"+product_id+"']").val();
		num = parseInt(num);
		//如果参数值为 NaN 或字符串、对象、undefined等非数字值则返回 true, 否则返回 false。
		if(isNaN(num))  
			num = 1;
		if(num <= 0)
			num = 1;
		if(num >= stock)
			num = stock;
		totalPriceWithIncreaseAndDecrease(price,num,product_id);
	});
	
	function totalPriceWithIncreaseAndDecrease(price,num,product_id){
		var price = price.replace(/￥/g, "");
		var totalPrice = new Number(price * num);
		totalPrice = parseFloat(totalPrice).toFixed(1);  //将变量转换为Float类型,并保留1位小数
		$("input.orderItemNumberSetting[product_id='"+product_id+"']").val(num);
		$("span.cartProductItemSmallSumPrice[product_id='"+product_id+"']").html(totalPrice);
		calcCartSumPriceAndNumber();
		
		//修改数量同时,修改改用户下对应商品的数量
		var page = "changeOrderItemNumber.action";
		$.get(
			page,
			{product_id:product_id,num:num},
			function(data){
				if("success" != data)
					location.href="login.jsp";	
			}
		);
	}
	
	/* 点击结算按钮 */
	$("button.createOrderButton").click(function(){
		var params = "";
		$("img.cartProductItemIfSelected").each(function(){
			var status = $(this).attr("selectit");
			if("selectit" == status){
				var orderItemId = $(this).attr("orderItemId");
				params += "&ordersItemId=" + orderItemId;
			}
		});
		params = params.substring(1);
		location.href="buyPage.action?" + params;
	});
	
});
	


	
</script>

<title>购物车</title>
<div class="cartDiv">
    <div class="cartTitle pull-right">
        <span>已选商品  (不含运费)</span>
        <span class="cartTitlePrice">￥0.00</span>
        <button class="createOrderButton" disabled="disabled">结 算</button>
    </div>

    <div class="cartProductList">
        <table class="cartProductTable">
            <thead>
            <tr>
                <th class="selectAndImage">
                    <img selectit="false" class="selectAllItem" src="img/fore/cartNotSelected.png">
                    全选

                </th>
                <th>商品信息</th>
                <th>单价</th>
                <th>数量</th>
                <th width="120px">金额</th>
                <th class="operation">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ordersItemList}" var="ordersItem">
                <tr orderItemId="${ordersItem.id}" class="cartProductItemTR">
                    <td>
                        <img selectit="false" orderItemId="${ordersItem.id}" class="cartProductItemIfSelected"
                             src="img/fore/cartNotSelected.png">
                        <a style="display:none" href="#nowhere"><img src="img/fore/cartSelected.png"></a>
                        <img class="cartProductImg"
                             src="img/product/${ordersItem.product.id}/1.jpg">
                    </td>
                    <td>
                        <div class="cartProductLinkOutDiv">
                            <a href="/showProduct?product_id=${ordersItem.product.id}"
                               class="cartProductLink">${ordersItem.product.name}</a>
                            <div class="cartProductLinkInnerDiv">
                                <img src="img/fore/creditcard.png" title="支持信用卡支付">
                                <img src="img/fore/7day.png" title="消费者保障服务,承诺7天退货">
                                <img src="img/fore/promise.png" title="消费者保障服务,承诺如实描述">
                            </div>
                        </div>

                    </td>
                    <td>
                        <span class="cartProductItemOringalPrice" product_id="${ordersItem.product.id}">￥${ordersItem.product.price}</span>
                        <span class="cartProductItemPromotionPrice" product_id="${ordersItem.product.id}">￥${ordersItem.product.price}</span>

                    </td>
                    
                    <td>

                        <div class="cartProductChangeNumberDiv">
<%--                             <span class="hidden orderItemStock " product_id="${orderItem.product.id}">${orderItem.product.stock}</span> --%>
<!--                             <span class="hidden orderItemPromotePrice " -->
<%--                                   product_id="${orderItem.product.id}">${orderItem.product.price}</span> --%>
                            <a product_id="${ordersItem.product.id}" class="numberMinus" href="#nowhere">-</a>
                            <input product_id="${ordersItem.product.id}" orderItemId="${ordersItem.id}" class="orderItemNumberSetting"
                                   autocomplete="off" value="${ordersItem.number}">
                            <a stock="${ordersItem.product.stock}" product_id="${ordersItem.product.id}" class="numberPlus"
                               href="#nowhere">+</a>
                        </div>

                    </td>
                    
                    <td>
                            <span class="cartProductItemSmallSumPrice" orderItemId="${ordersItem.id}" product_id="${ordersItem.product.id}">
                                    ${ordersItem.product.price*ordersItem.number}
                            </span>

                    </td>
                    <td>
                        <a class="deleteOrderItem" orderItemId="${ordersItem.id}" href="#nowhere">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>

    <div class="cartFoot">
        <img selectit="false" class="selectAllItem" src="img/fore/cartNotSelected.png">
        <span>全选</span>
        <!--         <a href="#">删除</a> -->

        <div class="pull-right">
            <span>已选商品 <span class="cartSumNumber">0</span> 件</span>

            <span>合计 (不含运费): </span>
            <span class="cartSumPrice">￥0.00</span>
            <button class="createOrderButton" disabled="disabled">结 算</button>
        </div>

    </div>

</div>


<%@include file="include/footer.jsp" %>



