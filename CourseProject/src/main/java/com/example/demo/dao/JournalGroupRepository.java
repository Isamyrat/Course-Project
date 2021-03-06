package com.example.demo.dao;

import com.example.demo.model.JournalGroup;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;
import java.util.List;


@Repository
public interface JournalGroupRepository extends JpaRepository<JournalGroup, Long> {

    @Override
    Optional<JournalGroup> findById(Long aLong);

    @Query("select jg from  JournalGroup  jg where jg.journal_user.id = :idUser and jg.group_journals.id = :idJournal")
    List<JournalGroup> findByUser(@Param("idUser") Long idUser, @Param("idJournal") Long idJournal);

    @Query("select jg from  JournalGroup  jg where jg.journal_user.id = :idUser and jg.group_journals.id = :idJournal")
    List<JournalGroup> findAllByJournal_userAndId(@Param("idUser") Long idUser, @Param("idJournal") Long idJournal, Pageable pageable);

    @Query("select jg from  JournalGroup  jg where jg.journal_user.id = :idUser")
    List<JournalGroup> findByUserId(@Param("idUser") Long idUser);

    @Modifying
    @Transactional
    @Query(value = "delete from JOURNAL_GROUP  jg where jg.id = :id", nativeQuery = true)
    void deleteJournalGroupById(Long id);

    @Modifying
    @Transactional
    @Query(value = "delete from Journal_Group  where USER_ID = :id", nativeQuery = true)
    void deleteAllByJournal_user(Long id);
}
