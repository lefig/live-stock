<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>LiveStock Trading | Orders </title>
	<link rel="stylesheet" href="gen.css" />
	<link rel="stylesheet" href="manEmp.css" />
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js">
	</script>
	<script type="text/javascript">

// <!CDATA[
$(document).ready(function(){
	console.log("orders!");	
	$("#managerOrders").addClass('active');

	$('.inputA').click(function(event) {
  	event.stopPropagation();
	});

	// Show the first utility as selected
  $('.current').children('.description').show();

  // Close the current tab on click 
  $('.utility').click(function() {
    $('.utility').removeClass('current');
    $('.description').hide();
  // Open the new current tab
    $(this).addClass('current');
    $(this).children('.description').show();
   });

});

function stock_onclick() {
    console.log("stock!");
    javascript:stockForm.submit();
}

function cust_onclick() {
    console.log("cust!");
    javascript:custForm.submit();
}

// ]]>

	</script>
	
</head>
<body>
	<jsp:include page="_header.jsp"></jsp:include>
	<jsp:include page="_man_menu.jsp"></jsp:include>
	<div class="body" align="center">
	<h2>Orders</h2>
	<table border="5" id="accounts">
			<tr>
	          <th style="width: 150px"><span style="font-size: 10pt">Order Id</span></th>
	          <th style="width: 150px"><span style="font-size: 10pt">Customer Account #</span></th>
	          <th style="width: 150px"><span style="font-size: 10pt">Employee Id</span></th>
	          <th style="width: 150px"><span style="font-size: 10pt">Stock Symbol</span></th>
	          <th style="width: 150px"><span style="font-size: 10pt">Order Type</span></th>
	          <th style="width: 150px"><span style="font-size: 10pt">Num Shares</span></th>
	          <th style="width: 150px"><span style="font-size: 10pt">Price Type</span></th>	          
	          <th style="width: 150px"><span style="font-size: 10pt">Share Price</span></th>
	          <th style="width: 150px"><span style="font-size: 10pt">Time</span></th>
	          <th style="width: 150px"><span style="font-size: 10pt">Recorded</span></th>	          
	        </tr>	
	          <c:forEach var="order" items="${orders}">							
				<tr>
		            <td style="width: 50px"><span style="font-size: 10pt"><c:out value="${order.id}" /></span></td>
		            <td style="width: 150px"><span style="font-size: 10pt"><c:out value="${order.cusAccNum}" /></span></td>
		            <td style="width: 150px"><span style="font-size: 10pt"><c:out value="${order.empId}" /></span></td>
		            <td style="width: 200px"><span style="font-size: 10pt"><c:out value="${order.stockSymbol}" /></span></td>
		            <td style="width: 150px"><span style="font-size: 10pt"><c:out value="${order.orderType}" /></span></td>
		            <td style="width: 50px"><span style="font-size: 10pt"><c:out value="${order.numShares}" /></span></td>
		            <td style="width: 150px"><span style="font-size: 10pt"><c:out value="${order.priceType}" /></span></td>
		            <td style="width: 150px"><span style="font-size: 10pt"><c:out value="${order.curSharePrice}" /></span></td>
		            <td style="width: 200px"><span style="font-size: 10pt"><c:out value="${order.timestamp}" /></span></td>
		            <td style="width: 150px"><span style="font-size: 10pt"><c:out value="${order.recorded}" /></span></td>	
		        </tr>	            
		    </c:forEach>
	    </table>
	</div>
	<div class="utilities container">  
      <!-- Utility -->
      <div class="utility current">
        <div class="item row">
          <div class="col-xs-3">
             <h3>Customer Name Filter</h3>
          </div>
        </div>
        <div class="description row">
        <table>          
            <form id="custNameFilter" name="custForm" action="manOrdersCust" method="post">
            Customer Name:
			<select name="custId" class="inputA">
			    <c:forEach var="cust" items="${customers}">
			    <option value="${cust.id}"><c:out value="${cust.fname}"/> <c:out value="${cust.lname}"/></option>
			    </c:forEach>
			</select>
			<br>
			<br>
			<button value="custGo" class="btn-default" id="custGo" onclick="return cust_onclick()">Go</button>        	
			</form>  
		</table>       
        </div>
      </div>
      <!-- Utility -->
      <div class="utility">
        <div class="item row">
          <div class="col-xs-3">
            <h3>Stock Symbol Filter</h3>
          </div>
        </div>
        <div class="description row">  
          <form id="stockNameFilter" name="stockForm" action="manOrdersStock" method="post">
            Stock Name:
			<select name="stockSym" class="inputA">
			    <c:forEach var="stock" items="${stocks}">
			    <option value="${stock.stocksym}"><c:out value="${stock.stocksym}"/></option>
			    </c:forEach>
			</select>
			<br>
			<br>      
		<button value="stockGo" class="btn-default" id="stockGo" onclick="return stock_onclick()">Go</button>  
        </div>
      </div>      
    </div>
	
	<jsp:include page="_footer.jsp"></jsp:include>
</body>
</html>