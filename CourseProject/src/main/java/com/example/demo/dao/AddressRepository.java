package com.example.demo.dao;


import com.example.demo.model.Address;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface AddressRepository  extends CrudRepository<Address,Long> {

    Optional<Address> findById(Long aLong);

    @Query("select a from  Address  a where a.user_address.id = :userId")
    List<Address> findByUser(@Param("userId")Long userId);

}
