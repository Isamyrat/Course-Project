package com.example.demo.controller;

import com.example.demo.model.PersonalInformation;
import com.example.demo.model.User;
import com.example.demo.model.enumModel.Gender;
import com.example.demo.service.PersonalInformationService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;
import java.util.ResourceBundle;

@Controller
public class PersonalController {

    @Autowired
    private PersonalInformationService personalInformationService;

    @Autowired
    private UserService userService;

    @GetMapping("/personalInformationUsers{personId}")
    public String personalInformationUsers(@PathVariable("personId") Long personId,
                                           Model model) {

        model.addAttribute("person", personalInformationService.findPerson(personId))
             .addAttribute("personId",personId);

        return "user/personalInformationUsers";
    }

    @GetMapping("/addPersonalInformationUser")
    public String addPersonalInformationUser(Model model) {

        model.addAttribute("personAdd", new PersonalInformation());

        return "user/addPersonalInformationUser";
    }

    @PostMapping("/savePersonalInfos")
    public String savePersonalInfos(@ModelAttribute("personAdd")
                                    PersonalInformation personalInformation,
                                    Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages",Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        personalInformation.setUserInformation(user);
        if (!personalInformationService.savePersonInfo(personalInformation)) {
            model.addAttribute("personError", resourceBundle.getString("error11"));
            return "user/addPersonalInformationUser";
        }

        return "redirect:/personalInformationUser";
    }

    @GetMapping("/editPersonalInformationUser{personId}")
    public String editPersonalInformationUser(@PathVariable("personId") Long personId,
                                             Model model) {

    model.addAttribute("personEdit", personalInformationService.findById(personId))
            .addAttribute("personId", personId);


        return "user/editPersonalInformationUser";
    }

    @PostMapping("/savePersonalInfo")
    public String savePersonalInfo(@ModelAttribute("personEdit") PersonalInformation person) {

        personalInformationService.editPerson(person);

        return "redirect:/personalInformationUser";
    }
}
