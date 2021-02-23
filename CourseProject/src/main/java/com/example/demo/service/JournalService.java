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


    public List<Journal> findALl(){
        return (List<Journal>) journalRepository.findAll();
    }

    public Boolean saveJournal(Journal journal){
        Group group = groupService.findById(journal.getGroup_journal().getId());

        Journal journal1 = journalRepository.findByGroup_journalId(group.getId());

        if(journal1 != null){
            return false;
        }

        journal.setGroup_journal(group);
        journalRepository.save(journal);
        return true;
    }

    public void editJournal(Journal journal){
        journalRepository.save(journal);
    }

    @Transactional
    @Modifying
    public void deleteJournal(Long id){
        journalRepository.deleteAllById(id);
    }


}
