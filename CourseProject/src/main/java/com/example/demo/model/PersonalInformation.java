package com.example.demo.model;


import com.example.demo.model.enumModel.Gender;
import com.example.demo.model.enumModel.Status;
import com.sun.istack.NotNull;

import javax.persistence.*;

@Entity
@Table(name = "Personal_Information")
public class PersonalInformation {


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "id_human",referencedColumnName = "id",nullable = false)
    private User user_information;


    private String number;

    private String age;

    @NotNull
    @Enumerated(EnumType.STRING)
    @JoinColumn(name = "GENDER")
    private Gender gender;


    public PersonalInformation() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public User getUser_information() {
        return user_information;
    }

    public void setUser_information(User user_information) {
        this.user_information = user_information;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }
}
