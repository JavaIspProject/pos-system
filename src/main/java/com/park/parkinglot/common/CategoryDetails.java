/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.park.parkinglot.common;

import java.io.Serializable;

/**
 *
 * @author Teo
 */
public class CategoryDetails implements Serializable {

    private Integer id;
    private String categoryName;

    public Integer getId() {
        return id;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public CategoryDetails(Integer id, String categoryName) {
        this.id = id;
        this.categoryName = categoryName;
    }
}
