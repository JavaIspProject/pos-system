/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/StatelessEjbClass.java to edit this template
 */
package com.pos.pos_system.ejb;

import com.pos.pos_system.common.CategoryDetails;
import com.pos.pos_system.common.ProductDetails;
import com.pos.pos_system.entity.Category;
import com.pos.pos_system.entity.Product;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Logger;
import javax.ejb.EJBException;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

/**
 *
 * @author Teo
 */
@Stateless
public class CategoryBean {

    private static final Logger LOG = Logger.getLogger(CategoryBean.class.getName());

    @PersistenceContext
    private EntityManager em;

    public void createCategory(String categoryName) {
        Category category = new Category();
        category.setCategoryName(categoryName);
        LOG.info("criet");
        em.persist(category);
    }

    public List<CategoryDetails> getAllCategories() {
        LOG.info("getAllCategories");
        try {
            Query query = em.createQuery("SELECT c FROM Category c");
            List<Category> category = (List<Category>) query.getResultList();
            return copyCategoryToDetails(category);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    private List<CategoryDetails> copyCategoryToDetails(List<Category> categories) {

        List<CategoryDetails> detailsList = new ArrayList<>();
        for (Category category : categories) {
            CategoryDetails categoryDetails = new CategoryDetails(category.getId(),
                    category.getCategoryName());
            detailsList.add(categoryDetails);
        }
        return detailsList;
    }

    public Collection<String> findCategoryNames(Collection<Integer> categoryIds) {
        LOG.info("findCategoryNames");
        List<String> usernames = (List<String>) em.createQuery("SELECT c.categoryName FROM Category c WHERE c.id In ?1")
                .setParameter(1, categoryIds)
                .getResultList();
        return usernames;
    }

    public ProductDetails findProductByCategoryId(Integer categoryId) {
        TypedQuery<Product> typedQuery = em.createQuery("SELECT p FROM Product p where p.product.id = :id", Product.class).
                setParameter("id", categoryId);
        List<Product> products = typedQuery.getResultList();
        if (products.isEmpty()) {
            return null;
        }
        Product product = products.get(0);
        return new ProductDetails(product.getId(), product.getProductName(), product.getPrice(), product.getCategoryName());
    }

    public void deleteCategoriesByIds(Collection<Integer> ids) {
        LOG.info("deleteCategoriesByIds");
        for (Integer id : ids) {
            Category category = em.find(Category.class, id);
            em.remove(category);
        }
    }

}
