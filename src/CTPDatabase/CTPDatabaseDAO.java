package CTPDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DatabaseUtil;

public class CTPDatabaseDAO{
	
	public int join(String customerName, String customerPhone, String customerAddress) {
		String SQL = "INSERT INTO CTPDATABASE VALUES (?, ?)";
		try {
			Connection conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, customerName);
			pstmt.setString(2, customerPhone);
			pstmt.setString(3, customerAddress);
			return pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	

}
