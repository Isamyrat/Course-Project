package com.example.demo.model;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.util.Collection;
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


     @ManyToMany(fetch = FetchType.EAGER)
    private Set<Role> roles;

    @OneToOne(mappedBy = "user_requestCall")
    private RequestCall requestCall;

    @OneToMany(fetch = FetchType.EAGER, mappedBy = "user_address", cascade = CascadeType.ALL)
    private Set<Address> address;

    @OneToMany(fetch = FetchType.EAGER,mappedBy = "userCallBack", cascade = CascadeType.ALL)
    private Set<CallBack> callBack;


 /*   @ManyToOne(fetch = FetchType.EAGER)
    @JoinTable(name = "GroupCourse")
    @JoinColumn(name = "ID_HUMAN", referencedColumnName = "id")
    private Group groupUser;*/

    /*@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(table = "GroupCourse", name = "id_human")
    private Group groupUser;*/

    @OneToOne(fetch = FetchType.EAGER, mappedBy = "user_information", cascade = CascadeType.ALL)
    private PersonalInformation personalInformation;

    public User() {
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
    public RequestCall getRequestCall() {
        return requestCall;
    }

    public void setRequestCall(RequestCall requestCall) {
        this.requestCall = requestCall;
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
        return getRoles();
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

}
