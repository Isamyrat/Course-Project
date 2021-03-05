package com.example.demo.dao;

import com.example.demo.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.*;


public interface RoleRepository extends JpaRepository<Role, Long> {
    <T>List<T> findByName(String name);

    Optional<Role> findById(Long id);
}