package com.example.demo.dao;

import com.example.demo.model.Journal;
import com.example.demo.model.enumModel.Status;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public interface JournalRepository extends CrudRepository<Journal,Long> {

    Optional<Journal> findById(Long id);

    List<Journal> findAllByStatus(Status status, Pageable pageable);

    List<Journal> findAllByStatusOrStatus(Status status, Status status1, Pageable pageable);

    @Query("select j from  Journal  j where j.group_number.number_group = :groupNumber")
    Set<Journal> findByGroup_number(@Param("groupNumber") Long groupNumber);

    @Query("select j from  Journal  j where j.group_number.number_group = :groupNumber")
    Journal findByGroup(@Param("groupNumber") Long groupNumber);

    Set<Journal> findByStatus(Status status);

    @Query("select j from  Journal  j where j.status = :status or j.status = :status1")
    Set<Journal> findByStatusOrStatus(Status status,Status status1);

}
