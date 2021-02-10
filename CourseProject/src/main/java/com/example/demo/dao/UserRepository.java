package com.example.demo.dao;

import com.example.demo.model.Course;
import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    Optional<User> findById(Long id);

    @Query("select u from User  u where u.id = :id")
    public User findByUser(Long id);

}
