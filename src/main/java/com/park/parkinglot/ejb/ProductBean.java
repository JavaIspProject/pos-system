/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/J2EE/EJB30/StatelessEjbClass.java to edit this template
 */
package com.park.parkinglot.ejb;

import com.park.parkinglot.common.ProductDetails;
import com.park.parkinglot.common.PhotoDetails;
import com.park.parkinglot.entity.Product;
import com.park.parkinglot.entity.Photo;
import com.park.parkinglot.entity.User;
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
public class ProductBean {

    private static final Logger LOG = Logger.getLogger(ProductBean.class.getName());

    @PersistenceContext
    private EntityManager em;

    public List<ProductDetails> getAllProducts() {
        LOG.info("getAllProducts");
        try {
            Query query = em.createQuery("SELECT p FROM Product p");
            List<Product> products = (List<Product>) query.getResultList();
            return copyProductsToDetails(products);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    
    public ProductDetails findById(Integer productId) {
        Product product = em.find(Product.class, productId);
        return new ProductDetails(product.getId(), product.getProductName(), product.getPrice(), product.getCategoryName());
    }

    private List<ProductDetails> copyProductsToDetails(List<Product> products) {

        List<ProductDetails> detailsList = new ArrayList<>();
        for (Product product : products) {
            ProductDetails productDetails = new ProductDetails(product.getId(),
                    product.getProductName(),
                    product.getPrice(),
                    product.getCategoryName());
            detailsList.add(productDetails);
        }
        return detailsList;
    }

    public void createProduct(String productName, Integer price, Integer categoryId) {
        LOG.info("createProduct");
        Product product = new Product();
        product.setProductName(productName);
        product.setPrice(price);
        product.setCategoryId(categoryId);

        //User user = em.find(User.class, userId);
        //user.getProducts().add(product);
        //product.setUser(user);

        em.persist(product);
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public void updateProduct(Integer productId, String productName, Integer price, Integer categoryId) {
        LOG.info("updateProducts");
        Product product = em.find(Product.class, productId);
        product.setProductName(productName);
        product.setPrice(price);
        product.setCategoryId(categoryId);

        //User oldUser = product.getUser();
        //oldUser.getProducts().remove(product);

        //User user = em.find(User.class, userId);
        //user.getProducts().add(product);
        //product.setUser(user);
    }

    public void deleteProductsByIds(Collection<Integer> ids) {
        LOG.info("deleteProductsByIds");
        for (Integer id : ids) {
            Product product = em.find(Product.class, id);
            em.remove(product);
        }
    }

    public void addPhotoToProduct(Integer productId, String filename, String fileType, byte[] fileContent) {
        LOG.info("addPhotoToProduct");
        Photo photo = new Photo();
        photo.setFilename(filename);
        photo.setFileType(fileType);
        photo.setFileContent(fileContent);

        Product product = em.find(Product.class, productId);
        product.setPhoto(photo);

        photo.setProduct(product);
        em.persist(photo);
    }

    public PhotoDetails findPhotoByProductId(Integer productId) {
        TypedQuery<Photo> typedQuery = em.createQuery("SELECT p FROM Photo p where p.product.id = :id", Photo.class).
                setParameter("id", productId);
        List<Photo> photos = typedQuery.getResultList();
        if (photos.isEmpty()) {
            return null;
        }
        Photo photo = photos.get(0);
        return new PhotoDetails(photo.getId(), photo.getFilename(), photo.getFileType(), photo.getFileContent());
    }
}
