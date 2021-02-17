package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class AdminController {
    @Autowired
    private UserService userService;

    @GetMapping("/admin")
    public String userList(Model model) {

        model.addAttribute("allUsers", userService.allUsers());

        return "login/admin";
    }

    @GetMapping("/watchManagersAdmin")
    public String managerList(Model model) {

        model.addAttribute("allUsers", userService.allUsers());

        return "admin/watchAllManagers";
    }

    @PostMapping("/admin")
    public String  deleteUser(@RequestParam(required = true, defaultValue = "" ) Long userId,
                              @RequestParam(required = true, defaultValue = "" ) String action) {


        if (action.equals("delete")){
            userService.deleteUser(userId);
        }
        return "login/admin";
    }
    @GetMapping("/addManager")
    public String edit(Model model){
        model.addAttribute("userManager", new User());

        return "admin/addManager";
    }
    @PostMapping("/saveUser")
    public String saveCustomer(@ModelAttribute("userManager") @Valid User userManager,
                               BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "admin/addManager";
        }
        if (!userService.saveManager(userManager)){
            model.addAttribute("usernameError", "Пользователь с таким именем уже существует");
            return "admin/addManager";
        }
        return "redirect:/admin";
    }

    @GetMapping("/menuAdmin")
    public String menuAdmin() {
        return "admin/menuAdmin";
    }


}
