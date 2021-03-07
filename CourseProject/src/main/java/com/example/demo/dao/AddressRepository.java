package com.example.demo.dao;


import com.example.demo.model.Address;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Repository
public interface AddressRepository  extends CrudRepository<Address,Long> {

    Optional<Address> findById(Long aLong);

    @Query("select a from  Address  a where a.userAddress.id = :userId")
    List<Address> findByUserId(@Param("userId") Long userId);

    @Query("select a from  Address  a where a.userAddress.id = :userId and a.country = :country and a.city = :city and a.district = :district and a.street = :street and a.house = :house and  a.apartment = :apartment")
    Address findByUserIdAndAddress(@Param("userId") Long userId, @Param("country") String country, @Param("city") String city, @Param("district") String district, @Param("street") String street, @Param("house") String house, @Param("apartment") String apartment);

    @Modifying
    @Transactional
    @Query(value = "delete from Address  a where a.id = :id", nativeQuery = true)
    void deleteAddressById(Long id);

    @Modifying
    @Transactional
    @Query(value = "delete from Address where ID_HUMAN = :id", nativeQuery = true)
    void deleteAllByUserId(Long id);
}
