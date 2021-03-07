package com.example.demo.service;

import com.example.demo.dao.CallBackRepository;
import com.example.demo.dao.CourseRepository;
import com.example.demo.dao.UserRepository;
import com.example.demo.model.CallBack;
import com.example.demo.model.Course;
import com.example.demo.model.User;
import com.example.demo.model.enumModel.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
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

    public List<CallBack> callBackList(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return callBackRepository.findAllByStatus(Status.Wait, pageable);
    }

    public List<CallBack> callBackListUser(int pageNumber, int pageSize, Long userId) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return callBackRepository.findAllByUserId(userId, pageable);
    }

    public List<CallBack> callBackListArchive(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return callBackRepository.findAllByStatusOrStatus(Status.Approved, Status.Denied, pageable);
    }

    public Boolean saveCallBack(User userRequestCall, Course courseRequestCall) {
        User user = userRepository.findByUser(userRequestCall.getId());
        Course course = courseRepository.findByCourseId(courseRequestCall.getId());

        CallBack callBack = new CallBack();

        callBack.setStatus(Status.Wait);

        CallBack callBack1 = callBackRepository.findByUserIdAndCallBakIdAndStatus(user.getId(), course.getId(), callBack.getStatus());

        if (callBack1 != null) {
            return false;
        }

        callBack.setStatus(Status.Wait);
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
