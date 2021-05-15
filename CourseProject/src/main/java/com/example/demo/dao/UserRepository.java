package com.example.demo.dao;

import com.example.demo.model.Role;
import com.example.demo.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.*;

public interface UserRepository extends PagingAndSortingRepository<User, Long> {
    User findByUsername(String username);

    Optional<User> findById(Long id);

    @Query("select u from User  u where u.id = :id")
    User findByUser(Long id);

    @Query("from User")
    List<User> getAll();


}
