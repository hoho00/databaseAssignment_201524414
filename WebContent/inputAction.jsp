<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="customer.CustomerDAO" %>
<%@ page import="customer.CustomerDTO" %>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	
	<form action="./answerAction.jsp" method="post">
		<p> 일반 검색 종류 : 
		<select name="tableName">
			<option value = "customer">customer</option>
			<option value = "transaction">transaction</option>
			<option value = "product">product</option>
		</select>
		<input type="submit" value="search">
	</form>
	
	<form action="./answer1Action.jsp" method="post">
		<p> 1. 남자보다 여자가 많이 산 상품의 이름  : 
		<input type="submit" value="search">
	</form>
	
	<form action="./answer2Action.jsp" method="post">
		<p> 2. 주어진 날 이전에 가장 많은 거래가 이루어진 k 가지 상품  : (MM/DD/YYYY)
		<input type="text" name="datePoint">
		<input type="submit" value="search">
	</form>
	
	<form action="./answer3Action.jsp" method="post">
		<p> 3. 하나의 supplier에서 m 번 이상의 제품을 산 고객의 이름  : 
		<input type="submit" value="search">
	</form>
</body>
</html>