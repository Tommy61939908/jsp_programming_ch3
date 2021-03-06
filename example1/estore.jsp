<%@page import="com.liuchang.Product"%>
<%@page import="com.liuchang.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.liuchang.EShop"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
public void jspInit(){
	getServletContext().setAttribute("cats", EShop.getCats());	
}
public void jspDestroy(){
	getServletContext().removeAttribute("cats");
}
public String disPrice(String price){
	int len = price.length();
	if (len <= 2){
		return price;
	} else{
		return "$" + price.substring(0, len - 2) + "." + price.substring(len - 2);
	}
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Mall</title>
</head>
<body>
<table border="1">
    <tr>
        <td width="20%">
        	<%
        		@SuppressWarnings("unchecked")
        		ArrayList<Category> cats = (ArrayList<Category>)application.getAttribute("cats");
        		for(int i = 0; i < cats.size(); i++){
        			Category curCat = (Category) cats.get(i);
        	%>
            <a href=<%= request.getRequestURL() + "?catid=" + curCat.getId() %>>
            <%= curCat.getName() %>
            </a><br>
        <%
            } 
        %>
        </td>
        <td>
            <h1></h1>
            <table border="1">
                <tr><th align="left">Item</th><th align="left">Price</th></tr>
                <%
                String selectedCat = request.getParameter("catid");
                if(selectedCat == null){
                		selectedCat = "1";
                }
                ArrayList<Product> items = (ArrayList<Product>) EShop.getItems(selectedCat);
                for(int i = 0; i < items.size(); i++){
                		Product curItem = (Product) items.get(i);
                %>
                <tr>
                    <td><%= curItem.getName() %></td>
                    <td><%= disPrice(String.valueOf(curItem.getPrice())) %></td>
                </tr>
                <%
                }
                %>
            </table>
        </td>
    </tr>
</table>
</body>
</html>