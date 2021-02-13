package com.example.demo.service;

import com.example.demo.dao.CallBackRepository;
import com.example.demo.dao.CourseRepository;
import com.example.demo.dao.UserRepository;
import com.example.demo.model.CallBack;
import com.example.demo.model.Course;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.*;

@Service
public class CallBackService {
    @Autowired
    private CallBackRepository callBackRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CourseRepository courseRepository;

    public CallBack findById(Long userId) {
        Optional<CallBack> callBack = callBackRepository.findById(userId);
        return callBack.orElse(new CallBack());
    }

    public List<CallBack> findAll(String status1, String status2) {
        return callBackRepository.findByStatuss(status1, status2);
    }

    public List<CallBack> findByStatus(String status) {
        return callBackRepository.findByStatus(status);
    }

    public Boolean saveCallBack(CallBack callBack) {
        User user = userRepository.findByUser(callBack.getUserCallBack().getId());
        Course course = courseRepository.findByCourseId(callBack.getCourseCallBack().getId());
        callBack.setStatus("В ожидании");
        callBack.setCallBackDate(String.valueOf(LocalDate.now()));
        callBack.setUserCallBack(user);
        callBack.setCourseCallBack(course);
        callBackRepository.save(callBack);
        return true;
    }

    public List<CallBack> callBackFind(Long userID) {
        return callBackRepository.findByUser(userID);
    }


    public Course findCourse(Long course) {
        return courseRepository.findByCourseId(course);
    }

    public CallBack editCallBack(CallBack callBack) {
        return callBackRepository.save(callBack);
    }

}
