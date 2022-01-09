/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.park.parkinglot.common;

/**
 *
 * @author boo_b
 */
public class ReceiptDetails {

    public ReceiptDetails(Integer id, String soldItemsIds, Double total) {
        this.id = id;
        this.soldItemsIds = soldItemsIds;
        this.total = total;
    }

    private Integer id;

    private Double total;

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    private String soldItemsIds;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSoldItemsIds() {
        return soldItemsIds;
    }

    public void setSoldItemsIds(String soldItemsIds) {
        this.soldItemsIds = soldItemsIds;
    }

}
