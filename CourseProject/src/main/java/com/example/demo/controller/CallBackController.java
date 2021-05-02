package com.example.demo.controller;


import com.example.demo.model.*;
import com.example.demo.model.enumModel.Status;
import com.example.demo.service.CallBackService;
import com.example.demo.service.GroupService;
import com.example.demo.service.SendEmailService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Objects;
import java.util.ResourceBundle;


@Controller
public class CallBackController {

    @Autowired
    private CallBackService callBackService;

    @Autowired
    private UserService userService;

    @Autowired
    private GroupService groupService;

    @Autowired
    private SendEmailService sendEmailService;

    @GetMapping("/watchRequestCallUser/{pageNumber}/{pageSize}")
    public String watchRequestCallUser(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("callBackManager", callBackService.callBackListUser(pageNumber,pageSize,user.getId()))
                .addAttribute("pageNumber", pageNumber)
                .addAttribute("wait", resourceBundle.getString("Wait"))
                .addAttribute("approved", resourceBundle.getString("Approved"))
                .addAttribute("denied", resourceBundle.getString("Denied"));

        return "manager/watchRequestCall";
    }


    @GetMapping("/watchRequestCall/{pageNumber}/{pageSize}")
    public String watchRequestCall(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        model.addAttribute("callBackManager", callBackService.callBackList(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber)
                .addAttribute("wait", resourceBundle.getString("Wait"));

        return "manager/watchRequestCall";
    }

    @GetMapping("/watchRequestCallArchive/{pageNumber}/{pageSize}")
    public String watchRequestCallArchive(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));

        model.addAttribute("watchRequestCallArchive", callBackService.callBackListArchive(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber)
                .addAttribute("wait", resourceBundle.getString("Wait"))
                .addAttribute("approved", resourceBundle.getString("ApprovedManager"))
                .addAttribute("denied", resourceBundle.getString("DeniedManager"));;

        return "manager/watchRequestCallArchive";
    }

    @PostMapping("/addToCourse")
    public String addToCourse(@ModelAttribute("courseId") Long courseId, Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        Course course1 = callBackService.findCourse(courseId);

        if (!callBackService.saveCallBack(user, course1)) {
            model.addAttribute("addToError", "Вы уже отправляли запрос на данный курс. Ожидайте ответа!!");
            return "manager/errors";
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
                model.addAttribute("addToErrors", "Данной группы не существует добавьте его сначала/Группа заполнена создайте новую группу.");
                return "manager/errors";
            }
        }
        sendEmailService.sendAcceptOrDeniedMail(editCallBack.getUserCallBack(),editCallBack);
        editCallBack.setCallBackDate(String.valueOf(LocalDate.now()));
        callBackService.editCallBack(editCallBack);

        return "redirect:/menuManager";
    }


    @PostMapping("/deleteCallBack")
    public String  deleteCallBack(@RequestParam(required = true, defaultValue = "" ) Long callBackId,
                              @RequestParam(required = true, defaultValue = "" ) String action) {
        if (action.equals("delete")){
            callBackService.deleteCallBack(callBackId);
        }


        return "redirect:/menuManager";
    }

}
