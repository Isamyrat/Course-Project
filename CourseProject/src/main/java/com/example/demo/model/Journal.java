package com.example.demo.model;

import com.example.demo.model.enumModel.Status;
import com.sun.istack.NotNull;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Journal")
public class Journal {
    @Id
    @GeneratedValue( strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "GROUP_NUMBER", referencedColumnName = "id",nullable = false)
    private Group groupNumber;

    @NotNull
    @Enumerated(EnumType.STRING)
    @JoinColumn(name = "STATUS")
    private Status status;

    @OneToMany(fetch = FetchType.EAGER,mappedBy = "groupJournals", cascade = CascadeType.ALL)
    private Set<JournalGroup> journalGroupSet;

    public Journal() {
    }

    public Set<JournalGroup> getJournalGroupSet() {
        return journalGroupSet;
    }

    public void setJournalGroupSet(Set<JournalGroup> journalGroupSet) {
        this.journalGroupSet = journalGroupSet;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Group getGroupNumber() {
        return groupNumber;
    }

    public void setGroupNumber(Group groupNumber) {
        this.groupNumber = groupNumber;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
