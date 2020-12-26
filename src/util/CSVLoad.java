package util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.StringTokenizer;

import customer.CustomerDAO;
import customer.CustomerDTO;
import product.ProductDAO;
import product.ProductDTO;
import transaction.TransactionDAO;
import transaction.TransactionDTO;



public class CSVLoad {
	
	public CSVLoad() {
		
	}
	
	public void addData(String[] array ) {
    	
    	if (array[0].equals("T")) {
   		 	TransactionDAO transactionDAO = new TransactionDAO();
   		 	String transactionNumber = array[1];
   		 	String productID = array[2];
   		 	String price = array[3];
   		 	String date = array[4];
   		 	String customerName = array[5];
   		 	
   		 	transactionNumber.replaceAll(" ", "");
   		 	productID.replaceAll(" ", "");
   		 	price.replaceAll(" ", "");
   		 	date.replaceAll(" ", "");
   		 	customerName.replaceAll(" ", "");
   		 	
    		transactionDAO.write(new TransactionDTO(transactionNumber, productID, price, date, customerName));
    	}
    	
    	else if (array[0].equals("P")) {
    		ProductDAO productDAO = new ProductDAO();
    		String name = array[1];
    		String productID = array[2];
    		String supplierName = array[3];
    		
    		name.replaceAll(" ", "");
    		productID.replaceAll(" ", "");
    		supplierName.replaceAll(" ", "");
    		
    		productDAO.write(new ProductDTO(name, productID, supplierName));
    	}
    	
    	if (array[0].equals("C")) {
    		CustomerDAO customerDAO = new CustomerDAO();
    		String name = array[1];
    		String phone = array[2];
    		String address = array[3];
    		String gender = array[4];
    		
    		name.replaceAll(" ", "");
    		phone.replaceAll(" ", "");
    		address.replaceAll(" ", "");
    		gender.replaceAll(" ", "");
    		customerDAO.write(new CustomerDTO(name, phone, address, gender));
			}
	}
	

}
