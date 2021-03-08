package com.example.demo.model;

import com.example.demo.model.enumModel.Status;
import com.sun.istack.NotNull;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "GROUPCOURSE")
public class Group {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_course", nullable = false)
    Course courseGroup;


    private Long numberGroup;

    @NotNull
    @Enumerated(EnumType.STRING)
    @JoinColumn(name = "STATUS")
    private Status status;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_teacher", referencedColumnName = "id")
    private User userTeacher;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_user")
    Set<User> userGroup;

    @OneToOne(mappedBy = "groupNumber", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Journal journal;

    public Group() {
    }

    public User getUserTeacher() {
        return userTeacher;
    }

    public void setUserTeacher(User userTeacher) {
        this.userTeacher = userTeacher;
    }

    public Set<User> getUserGroup() {
        return userGroup;
    }

    public void setUserGroup(Set<User> userGroup) {
        this.userGroup = userGroup;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Course getCourseGroup() {
        return courseGroup;
    }

    public void setCourseGroup(Course courseGroup) {
        this.courseGroup = courseGroup;
    }

    public Journal getJournal() {
        return journal;
    }

    public void setJournal(Journal journal) {
        this.journal = journal;
    }

    public Long getNumberGroup() {
        return numberGroup;
    }

    public void setNumberGroup(Long numberGroup) {
        this.numberGroup = numberGroup;
    }
}
