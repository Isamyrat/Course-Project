package com.example.demo.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "GroupC")
public class Group {

    @Id
    @GeneratedValue( strategy = GenerationType.IDENTITY)
    private Long id;


    @ManyToOne
    @JoinColumn(name = "id_course", nullable = false)
    Course course_group;

   /* @OneToMany(mappedBy = "groupUser")
    private Set<User> user;
    */

    private String number_group;


    @OneToOne(mappedBy = "group_journal")
    private Journal journal;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Course getCourse_group() {
        return course_group;
    }

    public void setCourse_group(Course course_group) {
        this.course_group = course_group;
    }

    public Journal getJournal() {
        return journal;
    }

    public void setJournal(Journal journal) {
        this.journal = journal;
    }

    public String getNumber_group() {
        return number_group;
    }

    public void setNumber_group(String number_group) {
        this.number_group = number_group;
    }
}
