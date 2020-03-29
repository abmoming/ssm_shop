package com.xm.pojo;

import java.io.Serializable;
import java.util.List;

public class Category implements Serializable{
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String name;
    
    private List<Product> productList;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

	public List<Product> getProductList() {
		return productList;
	}

	public void setProductList(List<Product> productList) {
		this.productList = productList;
	}
    
}