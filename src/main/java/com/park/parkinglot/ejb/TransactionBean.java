package com.park.parkinglot.ejb;

import com.park.parkinglot.common.ProductDetails;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import javax.ejb.Stateless;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
/**
 *
 * @author Oli
 */

@Stateless
public class TransactionBean {
@Inject
ProductBean productBean;

    private static final Logger LOG = Logger.getLogger(TransactionBean.class.getName());
    List<ProductDetails> transactionProducts = new ArrayList<>();
    @PersistenceContext
    private EntityManager em;
    
    public void addProductById(Integer productId)
    {
    transactionProducts.add(productBean.findById(productId));
    }
    
    public void removeProductById(Integer productId)
    {
    transactionProducts.remove(productBean.findById(productId));
    }
    
    public void emptyCart(Integer productId)
    {
    transactionProducts.remove(productBean.findById(productId));
    }
    
    public List<ProductDetails> displayCart()
    {
    return transactionProducts;
    }
    
}
