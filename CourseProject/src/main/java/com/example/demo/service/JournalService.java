package com.example.demo.service;

import com.example.demo.dao.JournalRepository;
import com.example.demo.model.Group;
import com.example.demo.model.Journal;
import com.example.demo.model.enumModel.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class JournalService {

    @Autowired
    private JournalRepository journalRepository;

    @Autowired
    private GroupService groupService;


    public Journal findById(Long id) {
        Optional<Journal> journal = journalRepository.findById(id);
        return journal.orElse(new Journal());
    }

    public Journal findByGroup(Long groupNumber) {
        return journalRepository.findByGroup(groupNumber);
    }

    public List<Journal> findByStatus(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return journalRepository.findAllByStatusOrStatus(Status.Wait, Status.Start, pageable);
    }

    public List<Journal> findByStatusArchive(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return journalRepository.findAllByStatus(Status.Finish, pageable);
    }

    public void saveJournal(Journal journal) {
        Group group = groupService.findById(journal.getGroupNumber().getId());

        journal.setGroupNumber(group);
        journalRepository.save(journal);

    }
    public void editJournal(Journal journal) {
        journalRepository.save(journal);
    }
}
