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
public class ManagerController {

    @Autowired
    private UserService userService;


    @GetMapping("/menuManager")
    public String menuManager() {
        return "manager/menu";
    }

    @GetMapping("/watchTeacher")
    public String watchTeacher(Model model) {

        model.addAttribute("allTeachers", userService.allUsers());

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
        return "redirect:/watchTeacher";
    }



    @GetMapping("/editTeacher{userId}")
    public String editTeacher(@PathVariable(value = "userId") Long userId,
                              Model model){

        model.addAttribute("userTeacher", userService.findUserById(userId))
            .addAttribute("userId", userId);

        return "manager/editTeacher";
    }
    @PostMapping("/saveTeachers")
    public String saveCustomers(@ModelAttribute("userTeacher")  User userTeacher) {

        userService.editTeacher(userTeacher);

        return "redirect:/watchTeacher";
    }

    @PostMapping("/deleteTeacher")
    public String  deleteUser(@RequestParam(required = true, defaultValue = "" ) Long userId,
                              @RequestParam(required = true, defaultValue = "" ) String action) {
        if (action.equals("delete")){
            userService.deleteUser(userId);
        }
        return "redirect:/watchTeacher";
    }

    @GetMapping("/watchJournalManager")
    public String watchJournalManager() {
        return "manager/watchJournalManager";
    }

    @GetMapping("/addJournal")
    public String addJournal() {
        return "manager/addJournal";
    }


    @GetMapping("/saveJournalManager")
    public String saveJournalManager() {
        return "manager/watchJournalManager";
    }


    @GetMapping("/editJournalManager")
    public String editJournalManager() {
        return "manager/editJournal";
    }

    @GetMapping("/saveJournalMan")
    public String saveJournalMan() {
        return "manager/watchJournalManager";
    }

}

