package com.example.demo.dao;

import com.example.demo.model.Journal;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Repository
public interface JournalRepository extends PagingAndSortingRepository<Journal,Long> {

    Optional<Journal> findById(Long id);

    @Transactional
    @Modifying
    void deleteAllById(Long id);

    @Query("select j from Journal  j where j.group_journal.id = :id")
    Journal findByGroup_journalId(Long id);
}
