package com.example.demo.model;

import javax.persistence.*;

@Entity
@Table(name = "Journal_Group")
public class JournalGroup {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String absent;
    private String date;
    private Long point;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "JOURNAL_ID", nullable = false)
    private Journal groupJournals;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "USER_ID", nullable = false)
    private User journalUser;

    public JournalGroup() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getJournalUser() {
        return journalUser;
    }

    public void setJournalUser(User journalUser) {
        this.journalUser = journalUser;
    }

    public Journal getGroupJournals() {
        return groupJournals;
    }

    public void setGroupJournals(Journal groupJournals) {
        this.groupJournals = groupJournals;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getAbsent() {
        return absent;
    }

    public void setAbsent(String absent) {
        this.absent = absent;
    }

    public Long getPoint() {
        return point;
    }

    public void setPoint(Long point) {
        this.point = point;
    }
}