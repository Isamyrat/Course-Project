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

    Group findByNumberGroup(Long number);

    List<Group> findAllByStatus(Status status, Pageable pageable);

    @Query("select g from  Group g where  g.userTeacher.id = :id")
    List<Group> findByTeacherId(Long id);

    @Query("select g from  Group g where  g.userTeacher.id = :id")
    List<Group> findAllByTeacherId(@Param("id")Long id, Pageable pageable);

    @Query("select g from  Group  g where  g.courseGroup.id = :id and g.status = :status")
    List<Group> findGroupsForAddStudents(Long id, Status status);
}
