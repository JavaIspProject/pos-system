/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.park.parkinglot.common;

/**
 *
 * @author Teo
 */
public class ProductDetails implements java.io.Serializable {

    private Integer id;

    private String productName;

    private Integer price;

    private Integer categoryId;

    public ProductDetails(Integer id, String productName, Integer price, Integer categoryId) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.categoryId = categoryId;
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
    
    public Integer getCategoryId() {
        return categoryId;
    }

}
