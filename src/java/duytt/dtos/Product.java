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
public class Product implements Serializable{
	private String proID;
	private String proName;
	private float price;
	private String descript;
	private String createDate;
	private String image;
	private int quanity;
	private boolean status;
	private String cateId;
	private String hsd;

	public Product() {
	}

	public Product(String proID, String proName, float price, String descript, String createDate, String image, int quanity, boolean status, String cateId, String hsd) {
		this.proID = proID;
		this.proName = proName;
		this.price = price;
		this.descript = descript;
		this.createDate = createDate;
		this.image = image;
		this.quanity = quanity;
		this.status = status;
		this.cateId = cateId;
		this.hsd = hsd;
	}

	public String getProID() {
		return proID;
	}

	public void setProID(String proID) {
		this.proID = proID;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public float getPrice() {
		return price;
	}

	public void setPrice(float price) {
		this.price = price;
	}

	public String getDescript() {
		return descript;
	}

	public void setDescript(String descript) {
		this.descript = descript;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public int getQuanity() {
		return quanity;
	}

	public void setQuanity(int quanity) {
		this.quanity = quanity;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getCateId() {
		return cateId;
	}

	public void setCateId(String cateId) {
		this.cateId = cateId;
	}

	public String getHsd() {
		return hsd;
	}

	public void setHsd(String hsd) {
		this.hsd = hsd;
	}

	
	
	
	
}
