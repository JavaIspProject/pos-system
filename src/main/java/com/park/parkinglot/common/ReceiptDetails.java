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

    public ReceiptDetails(Integer id, String soldItemsIds) {
        this.id = id;
        this.soldItemsIds = soldItemsIds;
    }

    private Integer id;

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
