package com.example.demo.controller;


import com.example.demo.model.*;
import com.example.demo.model.enumModel.Status;
import com.example.demo.service.CallBackService;
import com.example.demo.service.GroupService;
import com.example.demo.service.SendEmailService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    @GetMapping("/watchRequestCallUser")
    public String watchRequestCallUser(Pageable pageable, Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());
        Page<CallBack> pages = callBackService.callBackListUser(pageable,user.getId());

        model.addAttribute("callBackManager", pages.getContent())
                .addAttribute("wait", resourceBundle.getString("Wait"))
                .addAttribute("approved", resourceBundle.getString("Approved"))
                .addAttribute("denied", resourceBundle.getString("Denied"))
                .addAttribute("start", resourceBundle.getString("Start"))
                .addAttribute("elementary", resourceBundle.getString("Elementary"))
                .addAttribute("pre_Intermediate", resourceBundle.getString("Pre_Intermediate"))
                .addAttribute("intermediate", resourceBundle.getString("Intermediate"))
                .addAttribute("upper_Intermediate", resourceBundle.getString("Upper_Intermediate"))
                .addAttribute("advanced", resourceBundle.getString("Advanced"))
                .addAttribute("english", resourceBundle.getString("English"))
                .addAttribute("french", resourceBundle.getString("French"))
                .addAttribute("russian", resourceBundle.getString("Russian"))
                .addAttribute("turkish", resourceBundle.getString("Turkish"))
                .addAttribute("person", user)
                .addAttribute("totalPages", pages.getTotalPages())
                .addAttribute("totalElements", pages.getTotalElements())
                .addAttribute("number", pages.getNumber())
                .addAttribute("size", pages.getSize());

        return "manager/watchRequestCall";
    }


    @GetMapping("/watchRequestCall")
    public String watchRequestCall(Pageable pageable, Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        Page<CallBack> pages = callBackService.callBackList(pageable, Status.Wait.toString());

        User user = userService.getUser(userDetails.getUsername());
        model.addAttribute("callBackManager", pages.getContent())
                .addAttribute("wait", resourceBundle.getString("Wait"))
                .addAttribute("start", resourceBundle.getString("Start"))
                .addAttribute("elementary", resourceBundle.getString("Elementary"))
                .addAttribute("pre_Intermediate", resourceBundle.getString("Pre_Intermediate"))
                .addAttribute("intermediate", resourceBundle.getString("Intermediate"))
                .addAttribute("upper_Intermediate", resourceBundle.getString("Upper_Intermediate"))
                .addAttribute("advanced", resourceBundle.getString("Advanced"))
                .addAttribute("english", resourceBundle.getString("English"))
                .addAttribute("french", resourceBundle.getString("French"))
                .addAttribute("russian", resourceBundle.getString("Russian"))
                .addAttribute("turkish", resourceBundle.getString("Turkish"))
                .addAttribute("person", user)
                .addAttribute("totalPages", pages.getTotalPages())
                .addAttribute("totalElements", pages.getTotalElements())
                .addAttribute("number", pages.getNumber())
                .addAttribute("size", pages.getSize());

        return "manager/watchRequestCall";
    }

    @GetMapping("/watchRequestCallArchive")
    public String watchRequestCallArchive(Pageable pageable,Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));

        Page<CallBack> pages = callBackService.callBackListArchive(pageable, Status.Approved.toString(),Status.Denied.toString());

        model.addAttribute("watchRequestCallArchive", pages.getContent())
                .addAttribute("wait", resourceBundle.getString("Wait"))
                .addAttribute("approved", resourceBundle.getString("ApprovedManager"))
                .addAttribute("denied", resourceBundle.getString("DeniedManager"))
                .addAttribute("start", resourceBundle.getString("Start"))
                .addAttribute("elementary", resourceBundle.getString("Elementary"))
                .addAttribute("pre_Intermediate", resourceBundle.getString("Pre_Intermediate"))
                .addAttribute("intermediate", resourceBundle.getString("Intermediate"))
                .addAttribute("upper_Intermediate", resourceBundle.getString("Upper_Intermediate"))
                .addAttribute("advanced", resourceBundle.getString("Advanced"))
                .addAttribute("english", resourceBundle.getString("English"))
                .addAttribute("french", resourceBundle.getString("French"))
                .addAttribute("russian", resourceBundle.getString("Russian"))
                .addAttribute("turkish", resourceBundle.getString("Turkish"))
                .addAttribute("totalPages", pages.getTotalPages())
                .addAttribute("totalElements", pages.getTotalElements())
                .addAttribute("number", pages.getNumber())
                .addAttribute("size", pages.getSize());

        return "manager/watchRequestCallArchive";
    }

    @PostMapping("/addToCourse")
    public String addToCourse(@ModelAttribute("courseId") Long courseId, Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        Course course1 = callBackService.findCourse(courseId);
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages",Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        if (!callBackService.saveCallBack(user, course1)) {
            model.addAttribute("addToError", resourceBundle.getString("error5"));
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
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages",Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        if (editCallBack.getStatus().equals(Status.Approved.toString())) {
            if (!groupService.saveUser(editCallBack)) {
                model.addAttribute("addToErrors", resourceBundle.getString("error6"));
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
