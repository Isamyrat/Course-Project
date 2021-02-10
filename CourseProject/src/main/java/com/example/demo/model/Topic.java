package com.example.demo.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "Topic")
public class Topic {

    @Id
    @GeneratedValue( strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_course", referencedColumnName = "id",nullable = false)
    private Course course_topic;

    private String rules;
    private String text;

    public Course getCourse_topic() {
        return course_topic;
    }
    public Topic() {
    }

    public void setCourse_topic(Course course_topic) {
        this.course_topic = course_topic;
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
