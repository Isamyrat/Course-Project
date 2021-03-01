package com.example.demo.dao;

import com.example.demo.model.Group;
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

    Set<Group> findByStatus(String status);

    @Query("select g from  Group g where  g.course_group.id = :id")
    Group findByCourse(Long id);

    @Query("select g from  Group g where  g.user_teacher.id = :id")
    Set<Group> findByTeacher(Long id);

    @Query("select g from  Group  g where  g.course_group.id = :id and g.status = :status")
    List<Group> findForAdd(Long id, String status);
}
