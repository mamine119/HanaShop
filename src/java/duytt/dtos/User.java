/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.dtos;

/**
 *
 * @author thant
 */
public class User {
	private String userAccount;
	private String fullName;
	private String password;
	private int phone;
	private String address;
	private String email;
	private boolean status;
	private String roleID;

	public User() {
	}

	public User(String userAccount, String fullName, String password, int phone, String address, String email, boolean status, String roleID) {
		this.userAccount = userAccount;
		this.fullName = fullName;
		this.password = password;
		this.phone = phone;
		this.address = address;
		this.email = email;
		this.status = status;
		this.roleID = roleID;
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getRoleID() {
		return roleID;
	}

	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}
	
	
}
