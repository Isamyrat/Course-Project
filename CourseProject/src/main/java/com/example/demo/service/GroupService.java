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
    private CourseService courseService;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;


    public Group findById(Long groupId) {
        Optional<Group> group = groupRepository.findById(groupId);
        return group.orElse(new Group());
    }

    public List<Group> findByStatus(String status) {
        return groupRepository.findByStatus(status);
    }

    public Group findByNumberOfGroup(Long number) {
        return groupRepository.findByNumber(number);
    }

    public Boolean saveGroup(Group group) {
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

    public void saveUser(Group group) {
/*        System.out.println(group.getCourse_group()  + " " + group.getUserGroup());

        Course courses = courseRepository.findByCourseId(group.getCourse_group().getId());
        System.out.println(group.getCourse_group()  + " " + group.getUserGroup());

        User userGroup = new User();


        for (User user1 : group.getUserGroup()) {
            userGroup.setId(user1.getId());
        }
        System.out.println(group.getCourse_group()  + " " + group.getUserGroup());

        Set<User> userSet = new HashSet<>();
        User userGroups = userRepository.findByUser(userGroup.getId());
        System.out.println(group.getCourse_group()  + " " + group.getUserGroup());

        userSet.add(userGroups);

        Group group1  = groupRepository.findByCourse(courses.getId());


        System.out.println(group.getCourse_group()  + " " + group.getUserGroup());

        group1.setCourse_group(courses);
        group1.setUserGroup(userSet);*/
        System.out.println(group.getCourse_group()  + " " + group.getUserGroup());
        groupRepository.save(group);/*
        Course course = courseRepository.findByCourseId(callBack.getCourseCallBack().getId());

        Set<User> users = Collections.singleton(callBack.getUserCallBack());

        group.setCourse_group(course);

        group.setUserGroup(users);

        Course course1 = courseRepository.findByCourseId(group.getCourse_group().getId());

        Group group1 = groupRepository.findByCourse(course1.getId());

        group1.setUserGroup(users);
        group1.setCourse_group(course);
        groupRepository.save(group1);

        return true;*/
    }

    public Group findByUser(Long id) {
        User user = new User();
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

    public Group findByTeacher(Long id) {
        return groupRepository.findByTeacher(id);
    }

    public Group findByCourseS(Long id) {
        return groupRepository.findByCourse(id);
    }

}
