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

    public List<ProductDetails> getAllCars() {
        LOG.info("getAllCars");
        try {
            Query query = em.createQuery("SELECT c FROM Product c");
            List<Product> cars = (List<Product>) query.getResultList();
            return copyCarsToDetails(cars);
        } catch (Exception ex) {
            throw new EJBException(ex);
        }
    }

    public ProductDetails findById(Integer carId) {
        Product car = em.find(Product.class, carId);
        return new ProductDetails(car.getId(), car.getLicensePlate(), car.getParkingSpot(), car.getUser().getUsername());
    }

    private List<ProductDetails> copyCarsToDetails(List<Product> cars) {

        List<ProductDetails> detailsList = new ArrayList<>();
        for (Product car : cars) {
            ProductDetails carDetails = new ProductDetails(car.getId(),
                    car.getLicensePlate(),
                    car.getParkingSpot(),
                    car.getUser().getUsername());
            detailsList.add(carDetails);
        }
        return detailsList;
    }

    public void createCar(String licensePlate, String parkingSpot, Integer userId) {
        LOG.info("createCar");
        Product car = new Product();
        car.setLicensePlate(licensePlate);
        car.setParkingSpot(parkingSpot);

        User user = em.find(User.class, userId);
        user.getCars().add(car);
        car.setUser(user);

        em.persist(car);
    }
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    public void updateCar(Integer carId, String licensePlate, String parkingSpot, Integer userId) {
        LOG.info("updateCar");
        Product car = em.find(Product.class, carId);
        car.setLicensePlate(licensePlate);
        car.setParkingSpot(parkingSpot);

        User oldUser = car.getUser();
        oldUser.getCars().remove(car);

        User user = em.find(User.class, userId);
        user.getCars().add(car);
        car.setUser(user);
    }

    public void deleteCarsByIds(Collection<Integer> ids) {
        LOG.info("deleteCarsByIds");
        for (Integer id : ids) {
            Product car = em.find(Product.class, id);
            em.remove(car);
        }
    }

    public void addPhotoToCar(Integer carId, String filename, String fileType, byte[] fileContent) {
        LOG.info("addPhotoToCar");
        Photo photo = new Photo();
        photo.setFilename(filename);
        photo.setFileType(fileType);
        photo.setFileContent(fileContent);

        Product car = em.find(Product.class, carId);
        car.setPhoto(photo);

        photo.setCar(car);
        em.persist(photo);
    }

    public PhotoDetails findPhotoByCarId(Integer carId) {
        TypedQuery<Photo> typedQuery = em.createQuery("SELECT p FROM Photo p where p.product.id = :id", Photo.class).
                setParameter("id", carId);
        List<Photo> photos = typedQuery.getResultList();
        if (photos.isEmpty()) {
            return null;
        }
        Photo photo = photos.get(0);
        return new PhotoDetails(photo.getId(), photo.getFilename(), photo.getFileType(), photo.getFileContent());
    }
}
