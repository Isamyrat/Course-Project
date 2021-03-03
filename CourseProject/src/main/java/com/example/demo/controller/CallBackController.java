package com.example.demo.controller;


import com.example.demo.model.*;
import com.example.demo.model.enumModel.Status;
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
    public String saveApprove(@ModelAttribute("editCallBack") CallBack editCallBack,
                                Model model) {


        if (editCallBack.getStatus().equals(Status.Approved)) {
            if (!groupService.saveUser(editCallBack)) {
                model.addAttribute("addToError", "Данной группы еще не существует добавьте его сначала. Группа заполнена создайте новую группу.");
                return "redirect:/watchGroup";
            }
        }


        editCallBack.setCallBackDate(String.valueOf(LocalDate.now()));
        callBackService.editCallBack(editCallBack);
        return "redirect:/personalInformationUser";
    }


    @PostMapping("/deleteCallBack")
    public String  deleteCallBack(@RequestParam(required = true, defaultValue = "" ) Long callBackId,
                              @RequestParam(required = true, defaultValue = "" ) String action) {
        if (action.equals("delete")){
            callBackService.deleteCallBack(callBackId);
        }

        return "manager/menu";
    }

}
