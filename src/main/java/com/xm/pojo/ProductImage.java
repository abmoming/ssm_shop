package com.xm.pojo;

import java.io.Serializable;

public class ProductImage implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;

    private Integer productId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }
}