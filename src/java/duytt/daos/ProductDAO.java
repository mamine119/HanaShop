/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.daos;

import duytt.dtos.Category;
import duytt.dtos.History;
import duytt.dtos.Product;
import duytt.dtos.User;
import duytt.utils.MyConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author thant
 */
public class ProductDAO {

	public List<Product> getProduct(String sql) throws ClassNotFoundException, SQLException {
		List<Product> result = null;
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				pst = cn.prepareStatement(sql);
				rs = pst.executeQuery();
				while (rs.next()) {
					String proID = rs.getString("foodId");
					String proName = rs.getString("foodName");
					float price = rs.getFloat("price");
					String descript = rs.getString("desciption");
					String createDate = rs.getString("createDate");
					String image = rs.getString("image");
					int quanity = rs.getInt("quantity");
					boolean status = rs.getBoolean("status");
					String cateId = rs.getString("categoryId");
					String hsd = rs.getString("hsd");
					if (result == null) {
						result = new ArrayList<>();
					}
					result.add(new Product(proID, proName, price, descript, createDate, image, quanity, status, cateId,hsd));
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

	public int getPage(String sql) throws ClassNotFoundException, SQLException {
		int result = 0;
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				pst = cn.prepareStatement(sql);
				rs = pst.executeQuery();
				if (rs.next()) {
					result = rs.getInt("soluong");
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

	public List<Category> getCate() throws ClassNotFoundException, SQLException {
		List<Category> result = null;
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				String sql = "select [categoryId],[categoryName],[status] from [dbo].[tblCategory] where status = 1";
				pst = cn.prepareStatement(sql);
				rs = pst.executeQuery();
				while (rs.next()) {
					String cateID = rs.getString("categoryId");
					String cateName = rs.getString("categoryName");
					boolean status = rs.getBoolean("status");
					if (result == null) {
						result = new ArrayList<>();
					}
					result.add(new Category(cateID, cateName, status));
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

	public String getMinPrice() throws ClassNotFoundException, SQLException {
		String result = null;
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				String sql = "select min(price) as min from tblFood";
				pst = cn.prepareStatement(sql);
				rs = pst.executeQuery();
				if (rs.next()) {
					result = rs.getString("min");
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

	public String getMaxPrice() throws ClassNotFoundException, SQLException {
		String result = null;
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				String sql = "select max(price) as max from tblFood";
				pst = cn.prepareStatement(sql);
				rs = pst.executeQuery();
				if (rs.next()) {
					result = rs.getString("max");
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

	public Product getAProduct(String proID) throws ClassNotFoundException, SQLException {
		Product result = null;
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				String sql = "select [foodId],[foodName],[price],[desciption],[createDate],[image],[quantity],[status],[categoryId],hsd from [dbo].[tblFood] where [foodId]=?";
				pst = cn.prepareStatement(sql);
				pst.setString(1, proID);
				rs = pst.executeQuery();
				if (rs.next()) {
					String proName = rs.getString("foodName");
					float price = rs.getFloat("price");
					String descript = rs.getString("desciption");
					String createDate = rs.getString("createDate");
					String image = rs.getString("image");
					int quanity = rs.getInt("quantity");
					boolean status = rs.getBoolean("status");
					String cateId = rs.getString("categoryId");
					String hsd = rs.getString("hsd");
					result = new Product(proID, proName, price, descript, createDate, image, quanity, status, cateId,hsd);
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

	public String addOrder(User user, float total) throws SQLException, ClassNotFoundException {
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		String orderIDNext = "";
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				String orderID = "";
				String sqlMaxOrder = "SELECT MAX([orderId]) as maxor FROM [tblOders]";
				pst = cn.prepareStatement(sqlMaxOrder);
				rs = pst.executeQuery();
				if (rs.next()) {
					orderID = rs.getString("maxor");
				}
				if (orderID == null) {
					orderID = "0";
				}
				orderIDNext = String.valueOf(Integer.parseInt(orderID) + 1);
				Date date = new Date();
				SimpleDateFormat smp = new SimpleDateFormat("yyyy-MM-dd");
				String dat = smp.format(date);
				String sql = "insert into [dbo].[tblOders]([orderId],[userAccount],[totalPrice],[date],[fullName],[phone],[email],[address]) values (?,?,?,?,?,?,?,?)";
				pst = cn.prepareStatement(sql);
				pst.setInt(1, Integer.parseInt(orderIDNext));
				pst.setString(2, user.getUserAccount());
				pst.setFloat(3, total);
				pst.setString(4, dat);
				pst.setString(5, user.getFullName());
				pst.setInt(6, user.getPhone());
				pst.setString(7, user.getEmail());
				pst.setString(8, user.getAddress());
				pst.executeUpdate();
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
		return orderIDNext;
	}

	public void createOrderDetail(String orderID, String proID, float price, int quanity) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement pst = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				String sql = "insert into [dbo].[tblOderDetail]([orderId],[foodId],[price],[quanity]) values(?,?,?,?)";
				pst = cn.prepareStatement(sql);
				pst.setString(1, orderID);
				pst.setString(2, proID);
				pst.setFloat(3, price);
				pst.setInt(4, quanity);
				pst.executeUpdate();
			}
		} finally {
			if (pst != null) {
				pst.close();
			}
			if (cn != null) {
				cn.close();
			}
		}
	}

	
	public void updateQuanity(int quanity, String proID) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement pst = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				String sql = "update [dbo].[tblFood] set [quantity] = ? where [foodId]=?";
				pst = cn.prepareStatement(sql);
				pst.setInt(1, quanity);
				pst.setString(2, proID);
				pst.executeUpdate();
			}
		} finally {
			if (pst != null) {
				pst.close();
			}
			if (cn != null) {
				cn.close();
			}
		}
	}

	public void updatePro(Product pro) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement pst = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				String sql = "update [dbo].[tblFood] set [foodName]=?,[price]=?,[desciption]=?,[createDate]=?,[image]=?,[quantity]=?,[status]=?,[categoryId]=?,hsd=? where [foodId]=?";
				pst = cn.prepareStatement(sql);
				pst.setString(1, pro.getProName());
				pst.setFloat(2, pro.getPrice());
				pst.setString(3, pro.getDescript());
				pst.setString(4, pro.getCreateDate());
				pst.setString(5, pro.getImage());
				pst.setInt(6, pro.getQuanity());
				pst.setBoolean(7, pro.isStatus());
				pst.setString(8, pro.getCateId());
				pst.setString(9, pro.getHsd());
				pst.setString(10, pro.getProID());
				
				pst.executeUpdate();
			}
		} finally {
			if (pst != null) {
				pst.close();
			}
			if (cn != null) {
				cn.close();
			}
		}
	}

	private int checkDate(List<History> list, String date) {
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getDate().equals(date)) {
				return i;
			}
		}
		return -1;
	}

	public List<History> getHistory(String sql) throws ClassNotFoundException, SQLException {
		List<History> result = null;
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				pst = cn.prepareStatement(sql);
				rs = pst.executeQuery();
				while (rs.next()) {
					History his = null;
					String proID = rs.getString("foodId");
					String proName = rs.getString("foodName");
					float price = rs.getFloat("price");
					String image = rs.getString("image");
					int quanity = rs.getInt("quanity");
					String date = rs.getString("date");
					String orderId = rs.getString("orderId");
					if (result == null) {
						result = new ArrayList<>();

						his = new History(date, null);
						Product tmp = new Product(proID, proName, price, "", "", image, quanity, true, "","");
						his.add(orderId, tmp);
						result.add(his);

					} else {
							if (checkDate(result, date)<0) {
								his = new History(date, null);
								Product tmp = new Product(proID, proName, price, "", "", image, quanity, true, "","");
								his.add(orderId, tmp);
								result.add(his);
							} else {
								int indexHis=checkDate(result, date);
								if (result.get(indexHis).getHistory().containsKey(orderId)) {
									List<Product> listTemp = result.get(indexHis).getHistory().get(orderId);
									Product tmp = new Product(proID, proName, price, "", "", image, quanity, true, "","");
									listTemp.add(tmp);
									result.get(indexHis).getHistory().replace(orderId, listTemp);
								} else {
									List<Product> listTemp = new ArrayList<>();
									Product tmp = new Product(proID, proName, price, "", "", image, quanity, true, "","");
									listTemp.add(tmp);
									result.get(indexHis).getHistory().put(orderId, listTemp);
								}
							}
						

					}
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
	public void deleteProduct(String proId) throws SQLException, ClassNotFoundException
	{
		Connection cn=null;
		PreparedStatement pst=null;
		try {
			cn=MyConnection.getConnection();
			if(cn!=null)
			{
				String sql="update [dbo].[tblFood] set [status]=0 where [foodId]=?";
				pst=cn.prepareStatement(sql);
				pst.setString(1, proId);
				pst.executeUpdate();
			}
		} finally{
			if(pst!=null)
			{
				pst.close();
			}
			if(cn!=null)
			{
				cn.close();
			}
		}
	}
	public void addProduct(Product pro) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement pst = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				String sql = "insert into [dbo].[tblFood]([foodId],[foodName],[price],[desciption],[createDate],[image],[quantity],[status],[categoryId],[hsd]) values(?,?,?,?,?,?,?,?,?,?)";
				pst = cn.prepareStatement(sql);
				pst.setString(1, pro.getProID());
				pst.setString(2, pro.getProName());
				pst.setFloat(3, pro.getPrice());
				pst.setString(4, pro.getDescript());
				pst.setString(5, pro.getCreateDate());
				pst.setString(6, pro.getImage());
				pst.setInt(7, pro.getQuanity());
				pst.setBoolean(8, pro.isStatus());
				pst.setString(9, pro.getCateId());
				pst.setString(10, pro.getHsd());
				pst.executeUpdate();
			}
		} finally {
			if (pst != null) {
				pst.close();
			}
			if (cn != null) {
				cn.close();
			}
		}
	}
	public void writeRecord(String userId,String proId,String action) throws ClassNotFoundException, SQLException {
		Connection cn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			cn = MyConnection.getConnection();
			if (cn != null) {
				String orderID = "";
				String sqlMaxRe = "Select Max(id) as maxRe from [dbo].[tblHistory]";
				pst = cn.prepareStatement(sqlMaxRe);
				rs = pst.executeQuery();
				if (rs.next()) {
					orderID = rs.getString("maxRe");
				}
				if (orderID == null) {
					orderID = "0";
				}
				String reIdNext = String.valueOf(Integer.parseInt(orderID) + 1);
				String sql = "insert into [dbo].[tblHistory]([id],[date],[userAccount],[foodId],[action]) values(?,GETDATE(),?,?,?)";
				pst = cn.prepareStatement(sql);
				pst.setString(1, reIdNext);
				pst.setString(2, userId);
				pst.setString(3, proId);
				pst.setString(4, action);
				pst.executeUpdate();
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
	}
}
