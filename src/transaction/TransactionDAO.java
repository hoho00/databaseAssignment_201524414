package transaction;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DatabaseUtil;

public class TransactionDAO {
	public int write(TransactionDTO transactionDTO) {
		String SQL = "INSERT INTO TRANSACTION VALUES (?, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, transactionDTO.getTransactionNumber());
			pstmt.setString(2, transactionDTO.getProductID());
			pstmt.setString(3, transactionDTO.getPrice());
			pstmt.setString(4, transactionDTO.getDate());
			pstmt.setString(5, transactionDTO.getCustomerName());
			return pstmt.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				if(pstmt != null) pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try  {
				if (rs != null) rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
}