package com.example.demo.model;

import com.example.demo.model.enumModel.Status;
import com.sun.istack.NotNull;

import javax.persistence.*;
import java.util.*;

@Entity
@Table(name = "Course")
public class Course {

    @Id
    @GeneratedValue( strategy = GenerationType.AUTO)
    private Long id;

    @JoinColumn(name = "LANGUAGE")
    private String language;

    @JoinColumn(name = "START_DATE")
    private String start_date;

    @JoinColumn(name = "PRICE")
    private Long price;

    @JoinColumn(name = "LEVEL")
    private String level;

    @JoinColumn(name = "DAYS")
    private String days;

    @JoinColumn(name = "TIME")
    private String time;

    @NotNull
    @Enumerated(EnumType.STRING)
    @JoinColumn(name = "STATUS")
    private Status status;


    @JoinColumn(name = "DURATION")
    private String duration;

    @OneToOne(fetch = FetchType.EAGER,mappedBy = "course_topic", cascade = CascadeType.ALL)
    private Topic topic;


    @OneToMany(fetch = FetchType.EAGER,mappedBy = "courseCallBack", cascade = CascadeType.ALL)
    private Set<CallBack> callBack;



    @OneToMany(fetch = FetchType.EAGER,mappedBy = "course_group",cascade = CascadeType.ALL)
    private Set<Group> group;

    public Course() {
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public Set<CallBack> getCallBack() {
        return callBack;
    }

    public void setCallBack(Set<CallBack> callBack) {
        this.callBack = callBack;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

    public Set<Group> getGroup() {
        return group;
    }

    public void setGroup(Set<Group> group) {
        this.group = group;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getStart_date() {
        return start_date;
    }

    public void setStart_date(String start_date) {
        this.start_date = start_date;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

}
