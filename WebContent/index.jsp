<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="customer.CustomerDAO" %>
<%@ page import="customer.CustomerDTO" %>
<%@ page import="util.CSVLoad" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.ProductDTO" %>

<%@ page import="transaction.TransactionDAO" %>
<%@ page import="transaction.TransactionDTO" %>


<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.nio.charset.Charset" %>
<%@ page import="java.nio.file.Files" %>
<%@ page import="java.nio.file.Paths" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
	<%
		BufferedReader br = null;
		List<List<String>> ret = new ArrayList<List<String>>();
		String testline = "";
		int testcount = 0;

	
		try{
        	br = Files.newBufferedReader(Paths.get("C:\\Users\\msi\\Desktop\\2nd_semestry_junior\\DATABASES\\data.csv"));
        	//Charset.forName("UTF-8");
        	String line = "";
        
        	while((line = br.readLine()) != null){
        		
            	//CSV 1행을 저장하는 리스트
            	List<String> tmpList = new ArrayList<String>();
            	String array[] = line.split(",");
            	//배열에서 리스트 반환
            	tmpList = Arrays.asList(array);
            	if (testcount == 0) {
            		testline = array[0];
            	}
            	CSVLoad cs = new CSVLoad();
            	cs.addData(array);
            	System.out.println(tmpList);
            	ret.add(tmpList);
        	}
    	}catch(FileNotFoundException e){
        	e.printStackTrace();
    	}catch(IOException e){
        	e.printStackTrace();
    	}finally{
        	try{
            	if(br != null){
            	    br.close();
            	}
        	}catch(IOException e){
            	e.printStackTrace();
        	}
    	}

	%>
	<form action="./inputAction.jsp" method="post">
		<input type="submit" value="join">
	</form>
	<p> test : <% out.println(testline); %>
</body>
</html>