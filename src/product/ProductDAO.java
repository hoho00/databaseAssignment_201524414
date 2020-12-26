package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import util.DatabaseUtil;

public class ProductDAO {
	public int write(ProductDTO productDTO) {
		String SQL = "INSERT INTO PRODUCT VALUES (?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, productDTO.getName());
			pstmt.setString(2, productDTO.getProductID());
			pstmt.setString(3, productDTO.getSupplierName());
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
