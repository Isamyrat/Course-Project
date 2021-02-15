package com.example.demo.controller;

import com.example.demo.model.User;
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

import javax.servlet.http.HttpServletRequest;

@Controller
public class user {

    @Autowired
    private UserService userService;

    @GetMapping("/personalInformationUser")
    public String personalInformationUser(HttpServletRequest request, Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User u = userService.getUser(userDetails.getUsername());
        request.getSession().setAttribute("userId",u.getId());

        User user = userService.findUserById(u.getId());
        model.addAttribute("userId",user);

        return "user/personalInformation";
    }

    @GetMapping("/editUser")
    public String edit(HttpServletRequest request, Model model){

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();


        User u = userService.getUser(userDetails.getUsername());
        request.getSession().setAttribute("userId",u.getId());


        User user = userService.findUserById(u.getId());
        model.addAttribute("userEdit",user);

        return "user/editPersonalInformation";
    }

    @PostMapping("/saveTeacherses")
    public String saveTeacher(@ModelAttribute("userEdit")  User userTeacher) {
        userService.saveTeacher(userTeacher);

        return "redirect:/logout";
    }


    @PostMapping("/saveManagers")
    public String saveManager(@ModelAttribute("userEdit")  User userTeacher) {
        userService.saveManager(userTeacher);

        return "redirect:/logout";
    }
    @PostMapping("/saveUsers")
    public String saveUser(@ModelAttribute("userEdit")  User userTeacher) {
        userService.saveUser(userTeacher);

        return "redirect:/logout";
    }
    @PostMapping("/saveAdmins")
    public String saveAdmin(@ModelAttribute("userEdit")  User userTeacher) {
        userService.saveAdmin(userTeacher);

        return "redirect:/logout";
    }


}
