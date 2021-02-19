package com.example.demo.controller;


import com.example.demo.model.*;
import com.example.demo.service.CallBackService;
import com.example.demo.service.GroupService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.*;

@Controller
public class CallBackController {

    @Autowired
    private CallBackService callBackService;

    @Autowired
    private UserService userService;

    @Autowired
    private GroupService groupService;

    @GetMapping("/watchRequestCallUser")
    public String watchRequestCallUser(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("callBack", callBackService.callBackFind(user.getId()));

        return "manager/watchRequestCall";
    }

    @GetMapping("/watchRequestCall")
    public String watchRequestCall(Model model) {

        model.addAttribute("callBackManager", callBackService.findByStatus());

        return "manager/watchRequestCall";
    }

    @GetMapping("/watchRequestCallArhiv")
    public String watchRequestCallArhiv(Model model) {

        model.addAttribute("callBackManagerArhiv", callBackService.findAll());

        return "manager/watchRequestCallArhiv";
    }

    @PostMapping("/addToCourse")
    public String addToCourse(@ModelAttribute("courseId") Long courseId, Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        Course course1 = callBackService.findCourse(courseId);

        if (!callBackService.saveCallBack(user, course1)) {
            model.addAttribute("addToError", "Вы уже отправляли запрос на данный курс. Ожидайте ответа!!");
            return "redirect:/watchAllCoursesManager";
        }

        return "redirect:/personalInformationUser";
    }

    @GetMapping("/editCallBack{callBackId}")
    public String editTopics(@PathVariable("callBackId") Long callBackId,
                             Model model) {

        model.addAttribute("editCallBack", callBackService.findById(callBackId))
                .addAttribute("callBackId", callBackId);
        return "user/editCallBack";
    }

    @PostMapping("/saveApprove")
    public String saveApprove(@ModelAttribute("editCallBack") CallBack editCallBack) {

        User user = userService.findUserById(editCallBack.getUserCallBack().getId());

        Course course = callBackService.findCourse(editCallBack.getCourseCallBack().getId());

        Group group = groupService.findByCourseS(course.getId());

        Set<User> users = new HashSet<>();

        users.add(user);

        group.setUserGroup(users);
        group.setCourse_group(course);

        if (editCallBack.getStatus().equals("Approve")) {
            editCallBack.setStatus("Одобрено");
            groupService.saveUser(group);
        } else if (editCallBack.getStatus().equals("NotApprove")) {
            editCallBack.setStatus("Отказано");
        }


        editCallBack.setCallBackDate(String.valueOf(LocalDate.now()));
        callBackService.editCallBack(editCallBack);
        return "redirect:/personalInformationUser";
    }

}
