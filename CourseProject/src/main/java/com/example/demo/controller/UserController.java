package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.SendEmailService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class UserController {

    @Autowired
    private UserService userService;


    @GetMapping("/personalInformationUser")
    public String personalInformationUser(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("userId", userService.findUserById(user.getId()));
        return "user/personalInformation";
    }

    @GetMapping("/editUser")
    public String edit(Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("userEdit", userService.findUserById(user.getId()));

        return "user/editPersonalInformation";
    }

    @PostMapping("/savePerson")
    public String saveTeacher(@ModelAttribute("userEdit") User user) {
        userService.editPerson(user);

        return "redirect:/personalInformationUser";
    }

}
