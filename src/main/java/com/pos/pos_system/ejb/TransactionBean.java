package com.pos.pos_system.ejb;

import com.pos.pos_system.common.ProductDetails;
import com.pos.pos_system.entity.Transaction;
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
 * @author No! I AM SPARTACUS
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
        totalValue += productBean.findById(productId).getPrice();
    }

    public void emptyCart() {
        LOG.info("emptyCart");
        List<ProductDetails> delete = new ArrayList();
        for (ProductDetails i : transactionProducts) {
            delete.add(i);
        }
        transactionProducts.removeAll(delete);
        totalValue = 0.0;
    }

    public void removeProductByIdList(Collection<Integer> ids) {
        LOG.info("deleteProductsByIds");
        List<ProductDetails> delete = new ArrayList();
        for (Integer productId : ids) {
            int del = ids.size();
            for (ProductDetails i : transactionProducts) {
                if (i.getId().equals(productId) && del > 0) {
                    delete.add(i);
                    totalValue -= productBean.findById(productId).getPrice();
                    del -= 1;
                }
            }
        }
        transactionProducts.removeAll(delete);
    }

    public void returnProductValue(Double value) {
        totalValue = value;
    }

    public List<ProductDetails> findById(Integer receiptId) {
        String productsFromReceipt = em.find(Transaction.class, receiptId).getListOfProducts();
        List<ProductDetails> receiptProducts = new ArrayList<>();
        String[] separateProductNames = productsFromReceipt.split(" ");
        for (String product : separateProductNames) {
            receiptProducts.add(productBean.findByName(product));
        }
        return receiptProducts;
    }

    public Double getTotalById(Integer receiptId) {
        return em.find(Transaction.class, receiptId).getTotal();
    }

    public Double refundValueByProductId(Integer receiptId, Integer productId) {
        String productsFromReceipt = em.find(Transaction.class, receiptId).getListOfProducts();
        String[] separateProductNames = productsFromReceipt.split(" ");

        for (String product : separateProductNames) {
            if (productBean.findByName(product).getId().equals(productId)) {
                return 0.0 - productBean.findByName(product).getPrice();
            }
        }
        return 0.0;
    }

    public List<ProductDetails> displayCart() {
        return transactionProducts;
    }

    public String getListFromCart() {
        String finalReceipt = null;
        for (ProductDetails product : transactionProducts) {
            if (finalReceipt == null) {
                finalReceipt = product.getProductName();
            } else {
                finalReceipt = finalReceipt + " " + product.getProductName();
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
