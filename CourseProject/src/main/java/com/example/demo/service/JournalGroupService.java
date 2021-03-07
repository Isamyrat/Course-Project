package com.example.demo.service;

import com.example.demo.dao.JournalGroupRepository;
import com.example.demo.dao.JournalRepository;
import com.example.demo.model.Group;
import com.example.demo.model.Journal;
import com.example.demo.model.JournalGroup;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.*;

@Service
public class JournalGroupService {

    @Autowired
    private JournalGroupRepository journalGroupRepository;

    @Autowired
    private GroupService groupService;

    @Autowired
    private JournalRepository journalRepository;

    @Autowired
    private JournalService journalService;

    public JournalGroup findById(Long id) {
        Optional<JournalGroup> journalGroup = journalGroupRepository.findById(id);
        return journalGroup.orElse(new JournalGroup());
    }

    public List<JournalGroup> findAllDataForStudent(int pageNumber, int pageSize, Long idUser, Long groupNumber) {

        Group group1 = groupService.findByNumberOfGroup(groupNumber);

        Journal journal = journalService.findByGroup(group1.getNumberGroup());

        Set<User> usersSet = group1.getUserGroup();

        User user1 = new User();

        for (User user : usersSet) {
            if (user.getId().equals(idUser)) {
                user1 = user;
            }
        }
        Pageable pageable = PageRequest.of(pageNumber,pageSize);
        return journalGroupRepository.findAllByUserIdAndJournalId(user1.getId(),journal.getId(),pageable);
    }

    public void saveJournalStudent(JournalGroup journalGroup,Long groupNumber,Long userId ) {

        Group group1 = groupService.findByNumberOfGroup(groupNumber);

        Set<User> usersSet = group1.getUserGroup();

        User user1 = new User();

        for (User user : usersSet) {
            if (user.getId().equals(userId)) {
                user1 = user;
            }
        }

        Journal journal = journalRepository.findByGroup(group1.getNumberGroup());

        journalGroup.setDate(String.valueOf(LocalDate.now()));
        journalGroup.setGroupJournals(journal);
        journalGroup.setJournalUser(user1);
        journalGroupRepository.save(journalGroup);
    }

    public void editJournalGroup(JournalGroup journalGroup) {
        journalGroupRepository.save(journalGroup);
    }

    @Transactional
    @Modifying
    public void deleteJournalGroup(Long id) {
        journalGroupRepository.deleteJournalById(id);
    }
}
