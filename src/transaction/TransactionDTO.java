package transaction;


public class TransactionDTO {
	
	String transactionNumber;
	String productID;
	String price;
	String date;
	String customerName;
	public String getTransactionNumber() {
		return transactionNumber;
	}
	public void setTransactionNumber(String transactionNumber) {
		this.transactionNumber = transactionNumber;
	}
	public String getProductID() {
		return productID;
	}
	public void setProductID(String productID) {
		this.productID = productID;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	 
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	
	public TransactionDTO() {
		
	}
	
	public TransactionDTO(String transactionNumber, String productID, String price, String date, String customerName) {
		super();
		this.transactionNumber = transactionNumber;
		this.productID = productID;
		this.price = price;
		this.date = date;
		this.customerName = customerName;
	}
	
	
	
}