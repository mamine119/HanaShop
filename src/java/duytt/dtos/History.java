/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package duytt.dtos;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author thant
 */
public class History {

	private String date;
	private Map<String, List<Product>> history;

	public History() {
	}

	public History(String date, Map<String, List<Product>> history) {
		this.date = date;
		this.history = history;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Map<String, List<Product>> getHistory() {
		return history;
	}

	public void setHistory(Map<String, List<Product>> history) {
		this.history = history;
	}

	public void add(String orderId, Product pro) {
		if (history == null) {
			this.history = new HashMap<String, List<Product>>();
		}
		if (history.containsKey(orderId)) {
			List<Product> listTemp = history.get(orderId);
			listTemp.add(pro);
			history.put(orderId, listTemp);
		} else {
			List<Product> listTemp = new ArrayList<>();
			listTemp.add(pro);
			history.put(orderId, listTemp);
		}
	}

	public void update(String orderId, Product pro) {
		if (this.history != null) {
			if (this.history.containsKey(orderId)) {
				List<Product> listTemp = history.get(orderId);
				listTemp.add(pro);
				this.history.replace(orderId, listTemp);
			}
		}
	}
}
