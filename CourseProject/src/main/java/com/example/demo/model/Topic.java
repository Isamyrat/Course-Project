package com.example.demo.model;

import javax.persistence.*;

@Entity
@Table(name = "Topic")
public class Topic {

    @Id
    @GeneratedValue( strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_course", referencedColumnName = "id",nullable = false)
    private Course courseTopic;

    private String rules;
    private String text;

    public Topic() {
    }

    public Course getCourseTopic() {
        return courseTopic;
    }

    public void setCourseTopic(Course courseTopic) {
        this.courseTopic = courseTopic;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRules() {
        return rules;
    }

    public void setRules(String rules) {
        this.rules = rules;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
