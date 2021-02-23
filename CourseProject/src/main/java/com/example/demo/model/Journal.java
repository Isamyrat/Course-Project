package com.example.demo.model;

import javax.persistence.*;

@Entity
@Table(name = "Journal")
public class Journal {
    @Id
    @GeneratedValue( strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "id_group", referencedColumnName = "id",nullable = false)
    private Group group_journal;

    private String date;
    private Long point;
    private String absent;

    public Journal() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Group getGroup_journal() {
        return group_journal;
    }

    public void setGroup_journal(Group group_journal) {
        this.group_journal = group_journal;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Long getPoint() {
        return point;
    }

    public void setPoint(Long point) {
        this.point = point;
    }

    public String getAbsent() {
        return absent;
    }

    public void setAbsent(String absent) {
        this.absent = absent;
    }
}
