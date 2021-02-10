package com.example.demo.model;


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
    private String status;
    private String gender;

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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
