/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.pos.pos_system.common;

/**
 *
 * @author No! I AM SPARTACUS
 */
public class ProductDetails implements java.io.Serializable {

    private Integer id;

    private String productName;

    private Integer price;

    private String categoryName;

    public ProductDetails(Integer id, String productName, Integer price, String categoryName) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.categoryName = categoryName;
    }

    public Integer getId() {
        return id;
    }

    public String getProductName() {
        return productName;
    }

    public Integer getPrice() {
        return price;
    }
    
    public String getCategoryName() {
        return categoryName;
    }

}
