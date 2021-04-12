/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.daos;

import duytt.dtos.User;
import duytt.utils.MyConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author thant
 */
public class UserDAO {

	public User checkLogin(String userAccount, String password) throws ClassNotFoundException, SQLException {
		User result = null;
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				String sql = "SELECT [userAccount],[fullName],[phone],[address],[email],[status],[roleID] FROM [dbo].[tblUsers] WHERE [userAccount]=? and password=?";
				pst = cn.prepareStatement(sql);
				pst.setString(1, userAccount);
				pst.setString(2, password);
				rs = pst.executeQuery();
				if (rs.next()) {
					String Account = rs.getString("userAccount");
					String fullName = rs.getString("fullName");
					String pass = "";
					int phone = rs.getInt("phone");
					String address = rs.getString("address");
					String email = rs.getString("email");
					boolean status = rs.getBoolean("status");
					String roleID = rs.getString("roleID");
					result = new User(Account, fullName, pass, phone, address, email, status, roleID);
				}
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (cn != null) {
				cn.close();
			}
		}

		return result;
	}
}
