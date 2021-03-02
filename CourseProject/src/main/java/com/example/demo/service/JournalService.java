package com.example.demo.service;

import com.example.demo.dao.JournalRepository;
import com.example.demo.model.Group;
import com.example.demo.model.Journal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class JournalService {

    @Autowired
    private JournalRepository journalRepository;

    @Autowired
    private GroupService groupService;


    public Journal findById(Long id){
        Optional<Journal> journal = journalRepository.findById(id);
        return journal.orElse(new Journal());
    }
    public Journal findByGroup(Long groupNumber){
        return journalRepository.findByGroup(groupNumber);
    }
    public Set<Journal> findByStatus() {

        String status = "В ожидании";
        String status1 = "Началось";
        return journalRepository.findByStatusOrStatus(status,status1);
    }

    public Set<Journal> findByStatusArchive() {

        String status = "Закончилась";
        return journalRepository.findByStatus(status);
    }

    public void saveJournal(Journal journal){
        Group group = groupService.findById(journal.getGroup_number().getId());

        journal.setGroup_number(group);
        journalRepository.save(journal);

    }

    public void editJournal(Journal journal){
        journalRepository.save(journal);
    }

    @Transactional
    @Modifying
    public void deleteJournal(Long id){
        journalRepository.deleteJournalById(id);
    }


}
