package com.example.demo.controller;

import com.example.demo.model.CallBack;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.List;

@Controller
public class PersonalController {

    @Autowired
    private PersonalInformationService personalInformationService;


    @Autowired
    private UserService userService;


    @GetMapping("/personalInformationUsers")
    public String personalInformationUsers(@RequestParam("personalId") Long personId,
                                           Model model) {

        PersonalInformation person = personalInformationService.findPerson(personId);

        model.addAttribute("person", person);

        return "user/personalInformationUser";
    }

    @GetMapping("/addPersonalInformationUser")
    public String addPersonalInformationUser(Model model) {

        model.addAttribute("personAdd", new PersonalInformation());

        return "user/addpersonalInformationUser";
    }

    @PostMapping("/savePersonalInfos")
    public String savePersonalInfos(@ModelAttribute("personAdd")
                                    @Valid PersonalInformation personalInformation,
                                    Model model) {

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User u = userService.getUser(userDetails.getUsername());


        User user = personalInformationService.findUser(u.getId());

        personalInformation.setUser_information(user);

        if (!personalInformationService.savePersonInfo(personalInformation)) {
            model.addAttribute("personError", "Пользователь с личными данными уже существует");
            return "user/addPersonalInformationUser";
        }

        return "redirect:/personalInformationUser";
    }

    @GetMapping("/editPersonalInformationUser")
    public String editPersonalInformationUser(@RequestParam("personId") Long personId,
                                             Model model) {

        PersonalInformation person = personalInformationService.findById(personId);

        model.addAttribute("personEdit", person);


        return "user/editpersonalInformationUser";
    }

    @PostMapping("/savePersonalInfo")
    public String savePersonalInfo(@ModelAttribute("personEdit") PersonalInformation person) {

        personalInformationService.editPerson(person);

        return "redirect:/personalInformationUser";
    }

}
