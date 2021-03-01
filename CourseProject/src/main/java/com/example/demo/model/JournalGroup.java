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
    private Journal group_journals;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "USER_ID", nullable = false)
    private User journal_user;

    public JournalGroup() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getJournal_user() {
        return journal_user;
    }

    public void setJournal_user(User journal_user) {
        this.journal_user = journal_user;
    }

    public Journal getGroup_journals() {
        return group_journals;
    }

    public void setGroup_journals(Journal group_journals) {
        this.group_journals = group_journals;
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