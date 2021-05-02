package com.example.demo.model;

import com.example.demo.model.enumModel.Status;
import com.sun.istack.NotNull;

import javax.persistence.*;

@Entity
@Table(name = "Call_Back")
public class CallBack {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", referencedColumnName = "id",nullable = false)
    private User userCallBack;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "course_id", referencedColumnName = "id",nullable = false)
    private Course courseCallBack;

    @JoinColumn(name = "CALLBACKDATE")
    private String callBackDate;

    @NotNull
    @JoinColumn(name = "STATUS")
    private String status;

    public CallBack() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUserCallBack() {
        return userCallBack;
    }

    public void setUserCallBack(User userCallBack) {
        this.userCallBack = userCallBack;
    }

    public Course getCourseCallBack() {
        return courseCallBack;
    }

    public void setCourseCallBack(Course courseCallBack) {
        this.courseCallBack = courseCallBack;
    }

    public String getCallBackDate() {
        return callBackDate;
    }

    public void setCallBackDate(String callBackDate) {
        this.callBackDate = callBackDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
