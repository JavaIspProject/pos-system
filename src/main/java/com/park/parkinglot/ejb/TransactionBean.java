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
    private List<ProductDetails> transactionProducts = new ArrayList<>();
    private Double totalValue = 0.0;
    private TransactionBean transactionBean;

    public Double getTotalValue() {
        return totalValue;
    }
    @PersistenceContext
    private EntityManager em;

    public void addProductById(Integer productId) {
        transactionProducts.add(productBean.findById(productId));
        totalValue+=productBean.findById(productId).getPrice();
    }

    public void emptyCart() {
        LOG.info("emptyCart");
        List<ProductDetails>delete=new ArrayList();
        for (ProductDetails i : transactionProducts) {
           delete.add(i);
        }
        transactionProducts.removeAll(delete);
        totalValue = 0.0;
    }
    
    public void removeProductByIdList(Collection<Integer> ids) {
     LOG.info("deleteProductsByIds");
        List<String>delete=new ArrayList();
        for (Integer productId : ids) {
            delete.add(productBean.findById(productId).getProductName());
            totalValue-=productBean.findById(productId).getPrice();
        }
        for(ProductDetails prd : transactionProducts){
            System.out.println(prd.getId()+" "+prd.getProductName()+" "+prd.getPrice()+" "+prd.getCategoryName());
        }
        System.out.println(delete);
        System.out.println("delete");
        for(String i : delete){
            System.out.println(productBean.findByProductName(i).getProductName());
            transactionProducts.remove(productBean.findByProductName(i));
        }
        ProductDetails prdDtl=new ProductDetails(551,"masda",89999,"M");
        transactionProducts.remove(prdDtl);
        System.out.println(transactionProducts);
 }

    public List<ProductDetails> displayCart() {
        return transactionProducts;
        
    }
    public String getListFromCart()
    {
        String finalReceipt=null;
    for (ProductDetails product : transactionProducts) {
        if(finalReceipt==null){
            finalReceipt=product.getProductName();
        }else{
            finalReceipt=finalReceipt+" "+product.getProductName();
        }  
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
