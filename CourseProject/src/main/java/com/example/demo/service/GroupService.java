package com.example.demo.service;

import com.example.demo.dao.CourseRepository;
import com.example.demo.dao.GroupRepository;
import com.example.demo.dao.UserRepository;
import com.example.demo.model.*;
import com.example.demo.model.enumModel.Status;
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
    private JournalService journalService;

    @Autowired
    private CallBackService callBackService;

    public Group findById(Long groupId) {
        Optional<Group> group = groupRepository.findById(groupId);
        return group.orElse(new Group());
    }

    public Set<Group> findByStatus() {

        return groupRepository.findByStatus(Status.Start);
    }

    public Set<Group> findByStatusWaiting() {

        return groupRepository.findByStatus(Status.Wait);
    }

    public List<Group> findAll() {

        return groupRepository.findAll();
    }
    public Set<Group> findByStatusOne() {

        return groupRepository.findByStatus(Status.Finish);
    }

    public Group findByNumberOfGroup(Long number) {
        return groupRepository.findByNumber(number);
    }

    public Boolean saveGroup(Group group) {
        Journal journal = new Journal();
        Group group1 = groupRepository.findByNumber(group.getNumber_group());

        if(group1 != null){
            return false;
        }

        User user = userRepository.findByUser(group.getUser_teacher().getId());

        Course course = courseRepository.findByCourseId(group.getCourse_group().getId());

        group.setStatus(Status.Wait);
        group.setCourse_group(course);
        group.setUser_teacher(user);


        groupRepository.save(group);

        journal.setStatus(group.getStatus());
        journal.setGroup_number(group);
        journalService.saveJournal(journal);
        return true;
    }
    public void editGroup(Group group) {
        groupRepository.save(group);
    }

    public void editStatus(Group group) {
        Journal journal = journalService.findByGroup(group.getNumber_group());
        journal.setStatus(group.getStatus());
        journal.setGroup_number(group);
        journalService.editJournal(journal);
        groupRepository.save(group);
    }

    public Boolean saveUser(CallBack callBack) {
        Group group = new Group();

        User user = userService.findUserById(callBack.getUserCallBack().getId());

        Course course = callBackService.findCourse(callBack.getCourseCallBack().getId());

        List<Group> groupList = groupRepository.findForAdd(course.getId(),Status.Wait);

        if(groupList.size() == 0){
            return false;
        }

        for (Group group1: groupList) {
            group = group1;
            break;
        }

        Set<User> users = group.getUserGroup();

        if(users.size()==12){

            if(groupList.size() < 2){
                return false;
            }

            for(Group group1 : groupList.subList(1,groupList.size())){
                group = group1;
                break;
            }

            Set<User> userSet = group.getUserGroup();

            userSet.add(user);

            group.setUserGroup(userSet);
            group.setCourse_group(course);

            groupRepository.save(group);
            return true;
        }else {

            users.add(user);

            group.setUserGroup(users);
            group.setCourse_group(course);

            groupRepository.save(group);
            return true;
        }
    }


    public List<Group> findByUser(Long id) {
        List<Group> groups = groupRepository.findAll();
        List<Group> groupList = new ArrayList<>();
        for (Group group : groups) {
            for (User user1 : group.getUserGroup()) {
                if(user1.getId().equals(id)) {
                    groupList.add(group);
                }
            }
        }
        return groupList;
    }

    public void deleteUser(Long userId, Long groupNumber){
        Group groupUser = groupRepository.findByNumber(groupNumber);
        Set<User> userSet = groupUser.getUserGroup();

        userSet.removeIf(s -> s.getId().equals(userId));

        groupUser.setUserGroup(userSet);
        groupRepository.save(groupUser);
    }

    public Set<Group> findByTeacher(Long id) {
        return groupRepository.findByTeacher(id);
    }

    public List<Group> findByTeacherAndStatus(Long id) {
        return groupRepository.findByTeacherAndStatus(id, Status.Wait,Status.Start);
    }

}
