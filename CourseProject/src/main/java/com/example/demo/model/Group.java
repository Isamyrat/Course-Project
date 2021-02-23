package com.example.demo.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "GROUPCOURSE")
public class Group {

    @Id
    @GeneratedValue( strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_course", nullable = false)
    Course course_group;

    private Long number_group;

    private String  status;

    @OneToOne(mappedBy = "group_journal", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Journal journal;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_teacher", referencedColumnName = "id")
    private User user_teacher;


    @ManyToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_user")
    Set<User> userGroup;

    public Group() {
    }


    public User getUser_teacher() {
        return user_teacher;
    }

    public void setUser_teacher(User user_teacher) {
        this.user_teacher = user_teacher;
    }

    public Set<User> getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(Set<User> userGroup) {
        this.userGroup = userGroup;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

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

    public Long getNumber_group() {
        return number_group;
    }

    public void setNumber_group(Long number_group) {
        this.number_group = number_group;
    }
}
