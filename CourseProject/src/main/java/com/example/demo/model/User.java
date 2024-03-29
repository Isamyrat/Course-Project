package com.example.demo.model;

import com.example.demo.model.enumModel.Roles;
import com.sun.istack.NotNull;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;


@Entity
@Table(name = "user")
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Size(min=2, message = "Не меньше 5 знаков")
    private String username;
    @Size(min=2, message = "Не меньше 5 знаков")
    private String password;
    private String name;
    private String surname;

    @NotNull
    @JoinColumn(name = "ROLE")
    private String role;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "userAddress", cascade = CascadeType.ALL)
    private Set<Address> address;

    @OneToMany(fetch = FetchType.EAGER,mappedBy = "userCallBack", cascade = CascadeType.ALL)
    private Set<CallBack> callBack;

    @OneToOne(fetch = FetchType.EAGER,mappedBy = "userTeacher",cascade = CascadeType.ALL)
    private Group group;

    @ManyToMany(fetch = FetchType.EAGER, mappedBy = "userGroup",cascade = CascadeType.ALL)
    private Set<Group> groups;

    @OneToOne(fetch = FetchType.EAGER, mappedBy = "userInformation", cascade = CascadeType.ALL)
    private PersonalInformation personalInformation;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "journalUser", cascade = CascadeType.ALL)
    private Set<JournalGroup> journalGroups;



    public User() {
    }
    public Set<JournalGroup> getJournalGroups() {
        return journalGroups;
    }

    public void setJournalGroups(Set<JournalGroup> journalGroups) {
        this.journalGroups = journalGroups;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public Set<Address> getAddress() {
        return address;
    }

    public void setAddress(Set<Address> address) {
        this.address = address;
    }


    public PersonalInformation getPersonalInformation() {
        return personalInformation;
    }

    public void setPersonalInformation(PersonalInformation personalInformation) {
        this.personalInformation = personalInformation;
    }

    public Set<CallBack> getCallBack() {
        return callBack;
    }

    public void setCallBack(Set<CallBack> callBack) {
        this.callBack = callBack;
    }

    public Set<Group> getGroups() {
        return groups;
    }

    public void setGroups(Set<Group> groups) {
        this.groups = groups;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Long getId() {
        return id;
    }


    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return  null;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}
