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

    List<Journal> findAllByStatus(String status, Pageable pageable);

    List<Journal> findAllByStatusOrStatus(String status, String status1, Pageable pageable);

    @Query("select j from  Journal  j where j.groupNumber.numberGroup = :groupNumber")
    Journal findByGroup(@Param("groupNumber") Long groupNumber);
}

