/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/StatelessEjbClass.java to edit this template
 */
package com.park.parkinglot.ejb;

import com.park.parkinglot.common.ReceiptDetails;
import com.park.parkinglot.entity.Receipt;
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
    
    @PersistenceContext
    private EntityManager em;
    private static final Logger LOG = Logger.getLogger(TransactionBean.class.getName());
    
    public void printReceiptById(Integer receiptId){
        
    }
    
     public ReceiptDetails findById(Integer receiptId) {
        Receipt receipt = em.find(Receipt.class, receiptId);
        return new ReceiptDetails(receipt.getId(), receipt.getSoldItemsIds(),receipt.getTotal());
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
