package com.example.demo.service;

import com.example.demo.dao.CourseRepository;
import com.example.demo.dao.GroupRepository;
import com.example.demo.dao.UserRepository;
import com.example.demo.model.*;
import com.example.demo.model.enumModel.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
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

    public List<Group> findAll() {
        return groupRepository.getAll();
    }

    public Page<Group> findByStatus(Pageable pageable, String status) {
        return groupRepository.findAllByStatus(status, pageable);
    }

    public Group findByNumberOfGroup(Long number) {
        return groupRepository.findByNumberGroup(number);
    }

    public void editStatus(Group group) {
        Journal journal = journalService.findByGroup(group.getNumberGroup());
        journal.setStatus(group.getStatus());
        journal.setGroupNumber(group);
        journalService.editJournal(journal);
        groupRepository.save(group);
    }

    public Boolean saveGroup(Group group) {
        Journal journal = new Journal();
        Group group1 = groupRepository.findByNumberGroup(group.getNumberGroup());

        if (group1 != null) {
            return false;
        }

        User user = userRepository.findByUser(group.getUserTeacher().getId());

        Course course = courseRepository.findByCourseId(group.getCourseGroup().getId());

        group.setStatus(Status.Wait.toString());
        group.setCourseGroup(course);
        group.setUserTeacher(user);

        groupRepository.save(group);

        journal.setStatus(group.getStatus());
        journal.setGroupNumber(group);
        journalService.saveJournal(journal);
        return true;
    }

    public boolean editGroup(Group group) {
        Group group1 = groupRepository.findByNumberGroup(group.getNumberGroup());

        if (group1 != null) {
            return false;
        }

        groupRepository.save(group);
        return true;
    }


    public Boolean saveUser(CallBack callBack) {
        Group group = new Group();

        User user = userService.findUserById(callBack.getUserCallBack().getId());

        Course course = callBackService.findCourse(callBack.getCourseCallBack().getId());

        List<Group> groupList = groupRepository.findGroupsForAddStudents(course.getId(), Status.Wait.toString());

        if (groupList.size() == 0) {
            return false;
        }

        for (Group group1 : groupList) {
            group = group1;
            break;
        }

        Set<User> users = group.getUserGroup();



        if (users.size() == 7) {
            if (groupList.size() <2) {
                return false;
            }
            for (Group group1 : groupList.subList(1, groupList.size())) {
                group = group1;
                break;
            }


            Set<User> userSet = group.getUserGroup();

            if (userSet.size() == 7) {
                return false;
            }

            userSet.add(user);

            group.setUserGroup(userSet);

        } else{
            users.add(user);
            group.setUserGroup(users);

        }
        group.setCourseGroup(course);
        groupRepository.save(group);
        return true;
    }


    public List<Group> findByUser(Long id) {
        List<Group> groups = findAll();
        List<Group> groupList = new ArrayList<>();
        for (Group group : groups) {
            for (User user1 : group.getUserGroup()) {
                if (user1.getId().equals(id)) {
                    groupList.add(group);
                }
            }
        }
        return groupList;
    }

    public List<Group> findByUserList(int pageNumber, int pageSize, Long id) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        Page<Group> groups = groupRepository.findAll(pageable);
        List<Group> groupList = new ArrayList<>();
        for (Group group : groups) {
            for (User user1 : group.getUserGroup()) {
                if (user1.getId().equals(id)) {
                    groupList.add(group);
                }
            }
        }
        return groupList;
    }

    public void deleteUser(Long userId, Long groupNumber) {
        Group groupUser = groupRepository.findByNumberGroup(groupNumber);
        Set<User> userSet = groupUser.getUserGroup();

        userSet.removeIf(s -> s.getId().equals(userId));

        groupUser.setUserGroup(userSet);
        groupRepository.save(groupUser);
    }


    public List<Group> findByTeacher(int pageNumber, int pageSize, Long userId) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);
        return groupRepository.findAllByTeacherId(userId, pageable);
    }


    public List<Group> findByTeacherId(Long id) {
        return groupRepository.findByTeacherId(id);
    }

    public List<Group> findByUserId(Long id) {
        return findByUser(id);
    }

}
