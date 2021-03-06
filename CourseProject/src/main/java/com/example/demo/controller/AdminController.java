package com.example.demo.controller;

import com.example.demo.model.User;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.security.PermitAll;
import javax.validation.Valid;

@Controller
public class AdminController {

    @Autowired
    private UserService userService;

    @GetMapping("/admin/{pageNumber}/{pageSize}")
    public String userList(@PathVariable int pageNumber,@PathVariable int pageSize, Model model) {

        model.addAttribute("allUsers", userService.allUser(pageNumber,pageSize))
                        .addAttribute("pageNumber", pageNumber);

        return "login/admin";
    }

    @GetMapping("/watchManagersAdmin/{pageNumber}/{pageSize}")
    public String managerList(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {


        model.addAttribute("allUsers", userService.allManagers(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber);


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

        return "redirect:/menuAdmin";
    }

    @GetMapping("/menuAdmin")
    public String menuAdmin() {
        return "admin/menuAdmin";
    }

}
