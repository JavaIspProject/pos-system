/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.park.parkinglot.common;

/**
 *
 * @author Oli
 */
public class TransactionDetails {
    private Long id;
    private Double total;
    private String listOfProducts;

    public Long getId() {
        return id;
    }

    public Double getTotal() {
        return total;
    }

    public String getListOfProducts() {
        return listOfProducts;
    }

    public TransactionDetails(Long id, Double total, String listOfProducts) {
        this.id = id;
        this.total = total;
        this.listOfProducts = listOfProducts;
    }
    
    
}
