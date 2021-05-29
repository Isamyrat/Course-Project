package com.example.demo.dao;

import com.example.demo.model.Group;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface GroupRepository extends PagingAndSortingRepository<Group, Long> {

    @Override
    Optional<Group> findById(Long aLong);

    Group findByNumberGroup(Long number);

    Page<Group> findAllByStatus(String status, Pageable pageable);

    @Query("from Group")
    List<Group> getAll();

    @Query("select g from  Group g where  g.userTeacher.id = :id")
    List<Group> findByTeacherId(Long id);

    @Query("select g from  Group g where  g.userTeacher.id = :id")
    List<Group> findAllByTeacherId(@Param("id")Long id, Pageable pageable);

    @Query("select g from  Group  g where  g.courseGroup.id = :id and g.status = :status")
    List<Group> findGroupsForAddStudents(Long id, String status);
}
