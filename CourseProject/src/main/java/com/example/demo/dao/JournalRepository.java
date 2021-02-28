package com.example.demo.dao;

import com.example.demo.model.Journal;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Repository
public interface JournalRepository extends CrudRepository<Journal,Long> {

    Optional<Journal> findById(Long id);

    @Query("select j from  Journal  j where j.group_number.number_group = :groupNumber")
    Set<Journal> findByGroup_number(@Param("groupNumber") Long groupNumber);

    Set<Journal> findByStatus(String status);

    @Modifying
    @Transactional
    @Query(value = "delete from Journal j where j.id = :id", nativeQuery = true)
    void deleteJournalById(Long id);
}
