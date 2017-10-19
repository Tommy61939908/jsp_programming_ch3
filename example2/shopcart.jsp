<%@page import="com.liuchang.EShop"%>
<%@page import="com.liuchang.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! 
	private static String EXAMPLE = "/example2";
	private static String SHOP_PAGE = "/estore.jsp";
	private static String CART_PAGE = "/shopcart.jsp";
	private String dispPrice (String price){
		int len = price.length();
		if(len <= 2){
			return price;
		}
		else{
			return "$" + price.substring(0, len - 2) + "." + price.substring(len-2);
		}
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Cart</title>
</head>
<body>
<%
	int quan = 1;
	String action = request.getParameter("action");
	if (action.equals("inc")){
		String oldQuan = request.getParameter("quan");
		quan = Integer.parseInt(oldQuan);
		quan++;
	}
%>
<table width="600">
    <tr>
        <td>
            <h1></h1>
            <table border="1">
                <tr><th colspan="5">Your shopping cart</th></tr>
                <tr>
                    <th>Quantity</th>
                    <th>Item</th>
                    <th>Price</th>
                    <th>Extended</th>
                    <th>Add</th>
                </tr>
                <%
                		String sku = request.getParameter("sku");
                		Product item = null;
                		if(sku != null){
                			item = EShop.getItem(sku);
                		}
                %>
                <tr>
                    <td><%= quan %></td>
                    <td><%= item.getName() %></td>
                    <td><%= dispPrice(String.valueOf(item.getPrice())) %></td>
                    <td><%= dispPrice(String.valueOf(item.getPrice() * quan)) %></td>
                    <td>
                    		<a href="<%=request.getContextPath() + EXAMPLE +CART_PAGE + "?action=inc&quan=" + quan + "&sku=" + sku %>">
                    			<b>Add 1</b>
                    		</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5"><a href=<%= request.getContextPath() + EXAMPLE + SHOP_PAGE %>>Return to Shopping</a></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>