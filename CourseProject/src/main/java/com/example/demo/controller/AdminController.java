package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

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

    @PostMapping("/deleteManager")
    public String  deleteManager(@RequestParam(required = true, defaultValue = "" ) Long userId,
                              @RequestParam(required = true, defaultValue = "" ) String action,Model model) {


        if (action.equals("delete")){
            userService.deleteManager(userId);
        }
        return "redirect:/menuAdmin";
    }
    @PostMapping("/deleteUsers")
    public String  deleteUsers(@RequestParam(required = true, defaultValue = "" ) Long userId,
                              @RequestParam(required = true, defaultValue = "" ) String action,Model model) {


        if (action.equals("delete")){
            if(!userService.deleteStudents(userId)){
                model.addAttribute("errorStudent", "Данный студент учится/учился в группе, вам необходитмо его удалить из группы, а затем вы можете его удалить польностью!!!!");
                return "manager/errors";
            }
        }
        return "redirect:/admin";
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
            model.addAttribute("usernameError", "Пользователь с таким именем уже существует. Пожалйста напишите другой логин!!");
            return "admin/addManager";
        }

        return "redirect:/admin";
    }

    @GetMapping("/menuAdmin")
    public String menuAdmin() {
        return "admin/menuAdmin";
    }

}
