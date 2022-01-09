/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/StatelessEjbClass.java to edit this template
 */
package com.park.parkinglot.ejb;

import com.park.parkinglot.common.ReceiptDetails;
import com.park.parkinglot.entity.Receipt;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author boo_b
 */
@Stateless
public class ReceiptBean {

    @Inject
    Receipt receipt;
    @Inject
    ProductBean productBean;
    
    @PersistenceContext
    private EntityManager em;
    private static final Logger LOG = Logger.getLogger(TransactionBean.class.getName());
    
    public String[] getProductsByReceiptById(Integer receiptId){
      Receipt receipt = em.find(Receipt.class, receiptId);
      String[] individualProductsId=receipt.getSoldItemsIds().split(" ");
      String[] individualProducts = new String[individualProductsId.length];
      for(int i=0;i<individualProductsId.length;i++)
      {
      individualProducts[i]=productBean.findById(Integer.parseInt(individualProductsId[i])).getProductName();
      }
      return individualProducts;
    }
}
