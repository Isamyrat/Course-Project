package com.example.demo.dao;

import com.example.demo.model.Group;

import com.example.demo.model.enumModel.Status;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface GroupRepository extends JpaRepository<Group, Long> {

    @Override
    Optional<Group> findById(Long aLong);

    @Query("select g from  Group  g where  g.number_group = :number")
    Group findByNumber(Long number);

    Set<Group> findByStatus(Status status);

    List<Group> findAllByStatus(Status status, Pageable pageable);

    @Query("select g from  Group g where  g.course_group.id = :id")
    Group findByCourse(Long id);

    @Query("select g from  Group g where  g.user_teacher.id = :id")
    Set<Group> findByTeacher(Long id);

    @Query("select g from  Group g where  g.user_teacher.id = :id")
    List<Group> findByTeacherId(Long id);


    @Query("select g from  Group g where  g.user_teacher.id = :id")
    List<Group> findAllByUser_teacher(@Param("id")Long id, Pageable pageable);



    @Query("select g from  Group  g where  g.course_group.id = :id and g.status = :status")
    List<Group> findForAdd(Long id, Status status);
}
