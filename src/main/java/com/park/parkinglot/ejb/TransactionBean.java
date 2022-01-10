package com.park.parkinglot.ejb;

import com.park.parkinglot.common.ProductDetails;
import com.park.parkinglot.entity.Transaction;
import java.util.ArrayList;
import java.util.Collection;
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
    Double totalValue = 0.0;
    @PersistenceContext
    private EntityManager em;

    public void addProductById(Integer productId) {
        transactionProducts.add(productBean.findById(productId));
        totalValue+=productBean.findById(productId).getPrice();
    }

    public void emptyCart(Collection<Integer> productId) {
        LOG.info("deleteProductsByIds");
        for (Integer id : productId) {
            ProductDetails product = productBean.findById(id);
            transactionProducts.remove(product);
            totalValue = 0.0;
            
        }
    }

    public void removeProductById(Integer productId) {
        transactionProducts.remove(productBean.findById(productId));
        totalValue-=productBean.findById(productId).getPrice();
    }

    public List<ProductDetails> displayCart() {
        return transactionProducts;
        
    }
    public String getListFromCart()
    {
        String finalReceipt=null;
    for (ProductDetails product : transactionProducts) {
            finalReceipt=finalReceipt+" "+product.getProductName();
        }
    return finalReceipt;
    }
    
    public void createReceipt() {
        LOG.info("createReceipt");
        Transaction transaction = new Transaction();
        transaction.setListOfProducts(getListFromCart());
        transaction.setTotal(totalValue);
        em.persist(transaction);
    }

}
