package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.SendEmailService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Objects;
import java.util.ResourceBundle;

@Controller
public class RegistrationController {

    @Autowired
    private UserService userService;

    @Autowired
    private SendEmailService sendEmailService;

    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "login/registration";
    }

    @PostMapping("/registration")
    public String addUser(@ModelAttribute("userForm") @Valid User userForm,
                          BindingResult bindingResult, Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        if (bindingResult.hasErrors()) {
            return "login/registration";
        }

        if (!userService.saveUser(userForm)){
            model.addAttribute("usernameError", resourceBundle.getString("error8"));
            return "login/registration";
        }
        sendEmailService.sendRegistrationMail(userForm);

        return "redirect:/";
    }
}

