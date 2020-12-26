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

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	request.setCharacterEncoding("UTF-8");

	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = DatabaseUtil.getConnection();
	String datePoint = request.getParameter("datePoint");
	SimpleDateFormat transFormat = new SimpleDateFormat("MM/dd/yyyy");
	
	Date to = transFormat.parse(datePoint);
	
	
	try {
		String SQL = "select ";
		
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
	}
	

%>

</body>
</html>