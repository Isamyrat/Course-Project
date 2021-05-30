package com.example.demo.service;

import com.example.demo.dao.CallBackRepository;
import com.example.demo.dao.CourseRepository;
import com.example.demo.dao.UserRepository;
import com.example.demo.model.CallBack;
import com.example.demo.model.Course;
import com.example.demo.model.User;
import com.example.demo.model.enumModel.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    public Page<CallBack> callBackList(Pageable pageable, String status) {
        return callBackRepository.findByStatus(status, pageable);
    }

    public Page<CallBack> callBackListUser(Pageable pageable, Long userId) {
        return callBackRepository.findAllByUserId(userId, pageable);
    }

    public Page<CallBack> callBackListArchive(Pageable pageable, String status, String status1) {
        return callBackRepository.findAllByStatusOrStatus(status,status1, pageable);
    }

    public Boolean saveCallBack(User userRequestCall, Course courseRequestCall) {
        User user = userRepository.findByUser(userRequestCall.getId());
        Course course = courseRepository.findByCourseId(courseRequestCall.getId());

        CallBack callBack = new CallBack();

        callBack.setStatus(Status.Wait.toString());

        CallBack callBack1 = callBackRepository.findByUserIdAndCallBakIdAndStatus(user.getId(), course.getId(), callBack.getStatus());

        if (callBack1 != null) {
            return false;
        }

        callBack.setStatus(Status.Wait.toString());
        callBack.setCallBackDate(String.valueOf(LocalDate.now()));
        callBack.setUserCallBack(user);
        callBack.setCourseCallBack(course);

        callBackRepository.save(callBack);

        return true;
    }


    public Course findCourse(Long course) {
        return courseRepository.findByCourseId(course);
    }

    public void editCallBack(CallBack callBack) {
        callBackRepository.save(callBack);
    }

    public void deleteCallBack(Long callBackId) {
        callBackRepository.deleteCallBackById(callBackId);
    }

}
