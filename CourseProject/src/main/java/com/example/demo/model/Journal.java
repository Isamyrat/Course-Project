package com.example.demo.model;

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
    private Group group_number;

    private String status;

    @OneToMany(fetch = FetchType.EAGER,mappedBy = "group_journals", cascade = CascadeType.ALL)
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

    public Group getGroup_number() {
        return group_number;
    }

    public void setGroup_number(Group group_number) {
        this.group_number = group_number;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
