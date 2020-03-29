package com.xm.pojo;

import java.io.Serializable;

public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;

    private String name;

    private String subTitle;

    private Float price;

    private Integer sale;

    private Integer stock;

    private Integer categoryId;

    private Integer status;
    
    private Integer productReviewCount;

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

    public String getSubTitle() {
        return subTitle;
    }

    public void setSubTitle(String subTitle) {
        this.subTitle = subTitle == null ? null : subTitle.trim();
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public Integer getSale() {
        return sale;
    }

    public void setSale(Integer sale) {
        this.sale = sale;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

	public Integer getProductReviewCount() {
		return productReviewCount;
	}

	public void setProductReviewCount(Integer productReviewCount) {
		this.productReviewCount = productReviewCount;
	}
	
	public String getProductStatus() {
		String productStatus = "";
		if(null != this.status) {
			if(this.status == 0)
				productStatus = "关闭";
			if(this.status == 1)
				productStatus = "开启";
		}
		
		return productStatus;
	}
    
}