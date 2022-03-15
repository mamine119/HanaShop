/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author thant
 */
public class Cart {
	private String cusID;
        private Status Status;
	private Map<String, Product> cart;

	public Cart(String cusID, Map<String, Product> cart) {
		this.cusID = cusID;
		this.cart = cart;
	}

    public Cart(String cusID, Status Status, Map<String, Product> cart) {
        this.cusID = cusID;
        this.Status = Status;
        this.cart = cart;
    }

    public Status getStatus() {
        return Status;
    }

    public void setStatus(Status Status) {
        this.Status = Status;
    }

	public Cart() {
	}

	public String getCusID() {
		return cusID;
	}

	public void setCusID(String cusID) {
		this.cusID = cusID;
	}

	public Map<String, Product> getCart() {
		return cart;
	}

	public void setCart(Map<String, Product> cart) {
		this.cart = cart;
	}
	
	public void add(Product pro)
	{
		if(cart==null)
		{
			this.cart=new HashMap<String, Product>();
		}
		cart.put(pro.getProID(), pro);
	}
	public void delete(String id) {
		if(this.cart==null){
			return;
		}
		if(this.cart.containsKey(id)){
			this.cart.remove(id);
		}
	}
	
	public void update(Product pro) {
		if(this.cart!=null){
			if(this.cart.containsKey(pro.getProID())){
				this.cart.replace(pro.getProID(), pro);
			}
		}		
	}
}
