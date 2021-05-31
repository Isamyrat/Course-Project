package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.model.enumModel.Roles;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class ManagerController {

    @Autowired
    private UserService userService;

    @GetMapping("/menuManager")
    public String menuManager() {
        return "manager/menu";
    }

    @GetMapping("/watchTeacher")
    public String watchTeacher(Pageable pageable, Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());


        Page<User> pages = userService.findByRole(pageable,Roles.ROLE_TEACHER.toString());

        model.addAttribute("allUsers", pages.getContent())
                .addAttribute("totalPages", pages.getTotalPages())
                .addAttribute("totalElements", pages.getTotalElements())
                .addAttribute("number", pages.getNumber())
                .addAttribute("size", pages.getSize())
                .addAttribute("person", user);

        return "manager/watchTeacher";
    }

    @GetMapping("/addTeacher")
    public String edit(Model model) {

        model.addAttribute("userTeacher", new User());

        return "manager/addTeacher";
    }

    @PostMapping("/saveTeacher")
    public String saveCustomer(@ModelAttribute("userTeacher") @Valid User userTeacher,
                               BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "manager/addTeacher";
        }
        if (!userService.saveTeacher(userTeacher)) {
            model.addAttribute("usernameError", "Пользователь с таким именем уже существует");
            return "manager/addTeacher";
        }
        return "redirect:/menuManager";
    }


    @GetMapping("/editTeacher{userId}")
    public String editTeacher(@PathVariable(value = "userId") Long userId,
                              Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("userTeacher", userService.findUserById(userId))
                .addAttribute("userId", userId)
                .addAttribute("person", user);

        return "manager/editTeacher";
    }

    @PostMapping("/saveTeachers")
    public String saveCustomers(@ModelAttribute("userTeacher") User user) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user1 = userService.getUser(userDetails.getUsername());
        userService.editPerson(user);
        if(user1.getRole().equals("ROLE_MANAGER")) {
            return "redirect:/menuManager";
        }else return "redirect:/menuAdmin";
    }

    @PostMapping("/deleteTeacher")
    public String deleteUser(@RequestParam(required = true, defaultValue = "") Long userId,
                             @RequestParam(required = true, defaultValue = "") String action, Model model) {

        if (action.equals("delete")) {
            if (!userService.deleteTeacher(userId)) {
                model.addAttribute("errorTeacher", "Данный преподаватель преподает в группе. Смените преподавателя на другой, а затем можете удалять!!!!");
                return "manager/errors";
            }
        }
        return "redirect:/personalInformationUser";
    }
}

