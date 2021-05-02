package com.example.demo.model;

import com.example.demo.model.enumModel.Gender;
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
    private User userInformation;

    private String number;
    private String age;

    @NotNull
    @JoinColumn(name = "GENDER")
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

    public User getUserInformation() {
        return userInformation;
    }

    public void setUserInformation(User userInformation) {
        this.userInformation = userInformation;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
