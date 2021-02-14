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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

        List<CallBack> callBacks = callBackService.callBackFind(user.getId());

        model.addAttribute("callBack",callBacks);

        return "manager/watchRequestCall";
    }

    @GetMapping("/watchRequestCall")
    public String watchRequestCall(Model model) {

        String status = "В ожидании";

        List<CallBack> callBack  = callBackService.findByStatus(status);

        model.addAttribute("callBackManager", callBack);

        return "manager/watchRequestCall";
    }

    @GetMapping("/watchRequestCallArhiv")
    public String watchRequestCallArhiv(Model model) {

        String status1 = "Одобрено";
        String status2 = "Отказано";
        List<CallBack> callBack  = callBackService.findAll(status1,status2);

        model.addAttribute("callBackManagerArhiv", callBack);

        return "manager/watchRequestCallArhiv";
    }

    @PostMapping("/addToCourse")
    public String addToCourse(@ModelAttribute("course") Long course) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User u = userService.getUser(userDetails.getUsername());

        CallBack callBack = new CallBack();

        Course course1 = callBackService.findCourse(course);

        callBack.setCourseCallBack(course1);
        callBack.setUserCallBack(u);

        callBackService.saveCallBack(callBack);

        return "redirect:/";
    }

    @GetMapping("/editCallBack")
    public String editTopics(@RequestParam("callBackId") Long callBackId,
                             Model model) {
        CallBack callBack = callBackService.findById(callBackId);
        model.addAttribute("editCallBack",callBack);
        return "user/editCallBack";
    }

    @PostMapping("/saveApprove")
    public String saveApprove(@ModelAttribute("editCallBack") CallBack editCallBack) {


        User user = userService.findUserById(editCallBack.getUserCallBack().getId());
        Course course = callBackService.findCourse(editCallBack.getCourseCallBack().getId());
        Group group = groupService.findByCourseS(course.getId());

        System.out.println(user.toString()  + "  " + course.toString());
        Set<User> users = new HashSet<>();
        users.add(user);
        group.setUserGroup(users);
        group.setCourse_group(course);
        System.out.println(group.getCourse_group()  + " " + group.getUserGroup());



        if (editCallBack.getStatus().equals("Approve")) {
            editCallBack.setStatus("Одобрено");
            groupService.saveUser(group);
        }else if (editCallBack.getStatus().equals("NotApprove")) {
            editCallBack.setStatus("Отказано");
        }


        editCallBack.setCallBackDate(String.valueOf(LocalDate.now()));
        callBackService.editCallBack(editCallBack);
        return "redirect:/";
    }

}
