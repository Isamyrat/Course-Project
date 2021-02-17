package com.example.demo.dao;

import com.example.demo.model.Course;
import com.example.demo.model.Group;
import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface GroupRepository extends JpaRepository<Group, Long> {
    @Override
    Optional<Group> findById(Long aLong);

    @Query("select g from  Group  g where  g.number_group = :number")
    Group findByNumber(Long number);

    List<Group> findByStatus(String status);

    @Query("select g from  Group g where  g.course_group.id = :id")
    Group findByCourse(Long id);

    @Query("select g from  Group g where  g.user_teacher.id = :id")
    List<Group> findByTeacher(Long id);

    @Query("select  g.userGroup from Group g where g.id = :id")
    Set<User> user(Long id);
}
