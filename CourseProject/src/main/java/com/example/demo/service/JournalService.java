package com.example.demo.service;

import com.example.demo.dao.GroupRepository;
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

    @Autowired
    private GroupRepository groupRepository;


    public Journal findById(Long id){
        Optional<Journal> journal = journalRepository.findById(id);
        return journal.orElse(new Journal());
    }
    public Set<Journal> findByStatus() {

        String status = "Используется";
        return journalRepository.findByStatus(status);
    }

    public Set<Journal> findByStatusArchive() {

        String status = "Закончилась";
        return journalRepository.findByStatus(status);
    }
    /*
    public Set<Group> findAllByGroup() {

        List<Group> groupSet = groupService.findAll();

        List<Journal> journalList = findALl();

        Set<Group> groupSet1 = new HashSet<>();

        for(Journal journal : journalList){
            for(Group group1 : groupSet){
             if(!journal.getGroup_number().getId().equals(group1.getId())){
                 groupSet1.add(group1);
             }
            }
        }

        return groupSet1;
    }*/



    public List<Journal> findALl(){
        return (List<Journal>) journalRepository.findAll();
    }

    public Boolean saveJournal(Journal journal){
        Group group = groupService.findById(journal.getGroup_number().getId());

        Set<Journal> journal1 = journalRepository.findByGroup_number(group.getNumber_group());

        if(journal1.size() != 0){
            return false;
        }

        journal.setStatus("Используется");
        journal.setGroup_number(group);
        journalRepository.save(journal);
        return true;
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
