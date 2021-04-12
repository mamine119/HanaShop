/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.dtos;

import java.io.Serializable;

/**
 *
 * @author thant
 */
public class Category implements Serializable{
	private String cateID;
	private String cateName;
	private boolean status;

	public Category() {
	}

	public Category(String cateID, String cateName, boolean status) {
		this.cateID = cateID;
		this.cateName = cateName;
		this.status = status;
	}

	public String getCateID() {
		return cateID;
	}

	public void setCateID(String cateID) {
		this.cateID = cateID;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
	
	
}
