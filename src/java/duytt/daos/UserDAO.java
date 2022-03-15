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

    public User checkLogin(String userID) throws SQLException {
        User result = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = MyConnection.getConnection();
            if (conn != null) {
                String sql = "SELECT *\n"
                        + "FROM tblUsers\n"
                        + "Where  userAccount=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, userID);;
                rs = stm.executeQuery();
                if (rs.next()) {
                    result=new User(rs.getString("userAccount"), rs.getString("fullName"), rs.getString("password"), rs.getInt("phone"), rs.getString("address"), rs.getString("email"), rs.getBoolean("status"), rs.getString("roleID"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return result;
    }

    public void create(User user) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = MyConnection.getConnection();
            String sql = "INSERT INTO tblUsers(userAccount,fullName,password,email,address,phone,roleID,status)\n"
                    + "VALUES(?,?,?,?,?,?,?,?)";
            stm = conn.prepareStatement(sql);
            stm.setString(1, user.getUserAccount());
            stm.setString(2, user.getFullName());
            stm.setString(3, user.getPassword());
            stm.setString(4, user.getEmail());
            stm.setString(5, user.getAddress());
            stm.setString(6, user.getPhone() + "");
            stm.setString(7, "US");
            stm.setString(8, "1");
            stm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
    }
}
