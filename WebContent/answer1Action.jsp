<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<title>Insert title here</title>
</head>
<body>

<table width="300" border="1">
<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = DatabaseUtil.getConnection();
	
	try {
		
		String SQL = "select distinct p1.name from product p1, customer c1, transaction t1 where c1.gender=' Male' > c1.gender= ' Female' and c1.name=t1.customerName and t1.productID=p1.productID;";
		
		pstmt = conn.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			String productName = rs.getString("name");
			%>
			<tr>
				<td><%=productName%></td>
			</tr>
			<% 
		}
		
	} catch(SQLException ex) {
		ex.printStackTrace();
	} finally {
		
	}
	
%>
</table>
</body>
</html>