package com.example.demo.service;

import com.example.demo.dao.JournalRepository;
import com.example.demo.model.Group;
import com.example.demo.model.Journal;
import com.example.demo.model.enumModel.Status;
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
        return journalRepository.findByStatusOrStatus(Status.Wait,Status.Start);
    }

    public Set<Journal> findByStatusArchive() {

        return journalRepository.findByStatus(Status.Finish);
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
