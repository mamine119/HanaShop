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
public class Role {
	private String roleID;
	private String roleName;
	private boolean status;

	public Role() {
	}

	public Role(String roleID, String roleName, boolean status) {
		this.roleID = roleID;
		this.roleName = roleName;
		this.status = status;
	}

	public String getRoleID() {
		return roleID;
	}

	public void setRoleID(String roleID) {
		this.roleID = roleID;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
}
