<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*"  %>
<%@ page import="util.DatabaseUtil"  %>

<%@ page import="customer.CustomerDAO" %>
<%@ page import="customer.CustomerDTO" %>
<%@ page import="util.CSVLoad" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.ProductDTO" %>

<%@ page import="transaction.TransactionDAO" %>
<%@ page import="transaction.TransactionDTO" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<table width="300" border="1">
<%
	request.setCharacterEncoding("UTF-8");
	String customerOption = null;
	String transactionOption = null;
	String productOption = null;
	
	String keyword = request.getParameter("keyword");
	
	customerOption = request.getParameter("customerOption");
	transactionOption = request.getParameter("transactionOption");
	productOption = request.getParameter("productOption");
	
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = DatabaseUtil.getConnection();
	
	CustomerDTO customerDTO = new CustomerDTO();
	ProductDTO productDTO = new ProductDTO();
	TransactionDTO transactionDTO = new TransactionDTO();
	
	
	try {
		
	
	if(customerOption != null) {
		String SQL = "select * from customer " + "where " + customerOption + " = ' " + keyword + "'";
		
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		
		
		
		%>
			<tr>
				<th>name</th>
				<th>phone</th>
				<th>address</th>
				<th>gender</th>
			</tr>
		<%

		while(rs.next()) {
			customerDTO.setName(rs.getString("name"));
			customerDTO.setPhone(rs.getString("phone"));
			customerDTO.setAddress(rs.getString("address"));
			customerDTO.setGender(rs.getString("gender"));
			
			%>
				<tr>
					<td><%=customerDTO.getName()%></td>
					<td><%=customerDTO.getPhone()%></td>
					<td><%=customerDTO.getAddress()%></td>
					<td><%=customerDTO.getGender()%></td>
				</tr>
			<% 	
		}
	}
	
	else if (transactionOption != null) {
		String SQL = "select * from transaction " + "where " + transactionOption + " = ' " + keyword + "'";
		
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		
		%>
			<tr>
				<th>transactionNumber</th>
				<th>productID</th>
				<th>price</th>
				<th>date</th>
				<th>customerName</th>
			</tr>
		<%

		while(rs.next()) {
			transactionDTO.setTransactionNumber(rs.getString("transactionNumber"));
			transactionDTO.setProductID(rs.getString("productID"));
			transactionDTO.setPrice(rs.getString("price"));
			transactionDTO.setDate(rs.getString("date"));
			transactionDTO.setCustomerName(rs.getString("customerName"));
			
			%>
				<tr>
					<td><%=transactionDTO.getTransactionNumber() %></td>
					<td><%=transactionDTO.getProductID()%></td>
					<td><%=transactionDTO.getPrice()%></td>
					<td><%=transactionDTO.getDate()%></td>
					<td><%=transactionDTO.getCustomerName()%></td>
				</tr>
			<% 	
		}
	}
	
	else if (productOption != null) {
		
		String SQL = "select * from product " + "where " + productOption + " = ' " + keyword + "'";
		
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		
		%>
			<tr>
				<th>name</th>
				<th>productID</th>
				<th>supplierName</th>
				
			</tr>
		<%

		while(rs.next()) {
			productDTO.setName(rs.getString("name"));
			productDTO.setProductID(rs.getString("productID"));
			productDTO.setSupplierName(rs.getString("supplierName"));
			
			%>
				<tr>
					<td><%=productDTO.getName() %></td>
					<td><%=productDTO.getProductID()%></td>
					<td><%=productDTO.getSupplierName()%></td>
				</tr>
			<% 	
		}
		
	}
	
	} catch(SQLException ex) {
		ex.printStackTrace();
	}finally {
		if(rs!= null) {
			rs.close();
		}
		
		if (pstmt != null) {
			pstmt.close();
		}
		
		if (conn != null) {
			conn.close();
		}
	}
%>

</table>
</body>
</html>