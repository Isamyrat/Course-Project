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

    public List<CallBack> findAll() {
        String status1 = "Одобрено";
        String status2 = "Отказано";

        return callBackRepository.findByStatuss(status1, status2);
    }

    public List<CallBack> findByStatus() {

        String status = "В ожидании";

        return callBackRepository.findByStatus(status);
    }

    public Boolean saveCallBack(User userRequestCall, Course courseRequestCall) {

        User user = userRepository.findByUser(userRequestCall.getId());

        Course course = courseRepository.findByCourseId(courseRequestCall.getId());

        CallBack callBack = new CallBack();

        callBack.setStatus("В ожидании");

        CallBack callBack1 = callBackRepository.findByUserSingle(user.getId(), course.getId(), callBack.getStatus());

        if(callBack1 != null){
            return false;
        }

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

    public void editCallBack(CallBack callBack) {
         callBackRepository.save(callBack);
    }


    public void deleteCallBack(Long callBackId) {
        callBackRepository.deleteCallBackId(callBackId);
    }

}
