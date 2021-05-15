package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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
    public String userList(Pageable pageable, Model model) {
        Page<User> pages = userService.findAll(pageable);

        model.addAttribute("allUsers", pages.getContent())
                .addAttribute("totalPages", pages.getTotalPages())
                .addAttribute("totalElements", pages.getTotalElements())
                .addAttribute("number", pages.getNumber())
                .addAttribute("size", pages.getSize());

        return "login/admin";
    }


    @GetMapping("/watchManagersAdmin")
    public String managerList(Pageable pageable,Model model) {
        Page<User> pages = userService.findAll(pageable);

        model.addAttribute("allUsers", pages.getContent())
                .addAttribute("totalPages", pages.getTotalPages())
                .addAttribute("totalElements", pages.getTotalElements())
                .addAttribute("number", pages.getNumber())
                .addAttribute("size", pages.getSize());

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
        return "redirect:/menuAdmin";
    }
    @GetMapping("/addManager")
    public String edit(Model model){

        model.addAttribute("userManager", new User());

        return "admin/addManager";
    }
    @PostMapping("/saveManager")
    public String saveCustomer(@ModelAttribute("userManager") @Valid User userManager,
                               BindingResult bindingResult, Model model) {

        if (bindingResult.hasErrors()) {
            return "admin/addManager";
        }

        if (!userService.saveManager(userManager)){
            model.addAttribute("usernameError", "Пользователь с таким именем уже существует. Пожалйста напишите другой логин!!");
            return "admin/addManager";
        }

        return  "admin/menuAdmin";
    }

    @GetMapping("/menuAdmin")
    public String menuAdmin() {
        return "admin/menuAdmin";
    }

}
