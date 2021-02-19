package com.example.demo.controller;

import com.example.demo.model.PersonalInformation;
import com.example.demo.model.User;
import com.example.demo.service.PersonalInformationService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class PersonalController {

    @Autowired
    private PersonalInformationService personalInformationService;


    @Autowired
    private UserService userService;


    @GetMapping("/personalInformationUsers{personId}")
    public String personalInformationUsers(@PathVariable("personId") Long personId,
                                           Model model) {

        PersonalInformation person = personalInformationService.findPerson(personId);

        model.addAttribute("person", person)
             .addAttribute("personId",personId);

        return "user/personalInformationUsers";
    }

    @GetMapping("/addPersonalInformationUser")
    public String addPersonalInformationUser(Model model) {

        model.addAttribute("personAdd", new PersonalInformation());

        return "user/addpersonalInformationUser";
    }

    @PostMapping("/savePersonalInfos")
    public String savePersonalInfos(@ModelAttribute("personAdd")
                                    PersonalInformation personalInformation,
                                    Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User u = userService.getUser(userDetails.getUsername());


        User user = personalInformationService.findUser(u.getId());

        personalInformation.setUser_information(user);

        if (!personalInformationService.savePersonInfo(personalInformation)) {
            model.addAttribute("personError", "Пользователь с личными данными уже существует, вы можете изменить их");
            return "user/addpersonalInformationUser";
        }

        return "redirect:/personalInformationUser";
    }

    @GetMapping("/editPersonalInformationUser{personId}")
    public String editPersonalInformationUser(@PathVariable("personId") Long personId,
                                             Model model) {

        PersonalInformation person = personalInformationService.findById(personId);

        model.addAttribute("personEdit", person)
            .addAttribute("personId", personId);


        return "user/editpersonalInformationUser";
    }

    @PostMapping("/savePersonalInfo")
    public String savePersonalInfo(@ModelAttribute("personEdit") PersonalInformation person) {

        personalInformationService.editPerson(person);

        return "redirect:/personalInformationUser";
    }

}
