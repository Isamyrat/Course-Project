package com.example.demo.model;


import javax.persistence.*;

@Entity
@Table(name = "Request_Call")
public class RequestCall {


    @Id
    @GeneratedValue( strategy = GenerationType.AUTO)
    private Long id;


    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "id_human")
    private User user_requestCall;

    private String request_call_date;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser_requestCall() {
        return user_requestCall;
    }

    public void setUser_requestCall(User user_requestCall) {
        this.user_requestCall = user_requestCall;
    }

    public String getRequest_call_date() {
        return request_call_date;
    }

    public void setRequest_call_date(String request_call_date) {
        this.request_call_date = request_call_date;
    }
}
