package com.example.demo.service;

import com.example.demo.dao.CourseRepository;
import com.example.demo.dao.GroupRepository;
import com.example.demo.dao.UserRepository;
import com.example.demo.model.CallBack;
import com.example.demo.model.Course;
import com.example.demo.model.Group;
import com.example.demo.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class GroupService {

    @Autowired
    private GroupRepository groupRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;

    @Autowired
    private CallBackService callBackService;

    public Group findById(Long groupId) {
        Optional<Group> group = groupRepository.findById(groupId);
        return group.orElse(new Group());
    }

    public List<Group> findByStatus() {

        String status = "В ожидании";
        return groupRepository.findByStatus(status);
    }

    public List<Group> findAll() {

        return groupRepository.findAll();
    }
    public List<Group> findByStatusOne() {

        String status = "Закончилась";
        return groupRepository.findByStatus(status);
    }

    public Group findByNumberOfGroup(Long number) {
        return groupRepository.findByNumber(number);
    }

    public Boolean saveGroup(Group group) {

        Group group1 = groupRepository.findByNumber(group.getNumber_group());

        if(group1 != null){
            return false;
        }

        User user = userRepository.findByUser(group.getUser_teacher().getId());

        Course course = courseRepository.findByCourseId(group.getCourse_group().getId());

        group.setStatus("В ожидании");
        group.setCourse_group(course);
        group.setUser_teacher(user);


        groupRepository.save(group);
        return true;
    }

    public Group editStatus(Group group) {
        return groupRepository.save(group);
    }

    public Boolean saveUser(CallBack callBack) {

        Group group = new Group();
        User user = userService.findUserById(callBack.getUserCallBack().getId());

        Course course = callBackService.findCourse(callBack.getCourseCallBack().getId());


        List<Group> groupList = groupRepository.findForAdd(course.getId(),"В ожидании");

        if(groupList.size() == 0){
            return false;
        }

        for (Group group1: groupList) {
            group = group1;
            break;
        }

        Set<User> users = group.getUserGroup();

        users.add(user);

        group.setUserGroup(users);
        group.setCourse_group(course);

        groupRepository.save(group);
        return true;
    }


    public Group findByUser(Long id) {
        Group groupUser = new Group();
        List<Group> groups = groupRepository.findAll();
        for (Group group : groups) {
            for (User user1 : group.getUserGroup()) {
                if (user1.getId().equals(id)) {
                    groupUser = group;
                }
            }
        }
        return groupUser;
    }

    public boolean deleteUser(Long userId) {
        Group groupUser = new Group();

        User user = userService.findUserById(userId);

        List<Group> groups = groupRepository.findAll();


        for (Group group : groups) {
            for (User user1 : group.getUserGroup()) {
                if (user1.getId().equals(userId)) {
                    groupUser = group;
                }
            }
        }
        Set<User> userSet = groupUser.getUserGroup();

        System.out.println(userSet);

        userSet.removeIf(s -> s.getId().equals(userId));

        groupUser.setUserGroup(userSet);
        groupRepository.save(groupUser);

        return true;
    }

    public List<Group> findByTeacher(Long id) {
        return groupRepository.findByTeacher(id);
    }

}
