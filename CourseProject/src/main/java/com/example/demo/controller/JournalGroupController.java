package com.example.demo.controller;

import com.example.demo.model.JournalGroup;
import com.example.demo.model.User;
import com.example.demo.service.GroupService;
import com.example.demo.service.JournalGroupService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class JournalGroupController {
    @Autowired
    private JournalGroupService journalGroupService;


    @Autowired
    private UserService userService;

    @GetMapping("/watchJournalGroup/{userId}/{groupNumber}/{pageNumber}/{pageSize}")
    public String watchJournalGroup(@PathVariable("userId") Long userId,
                                    @PathVariable("groupNumber") Long groupNumber,
                                    @PathVariable int pageNumber,@PathVariable int pageSize,
                                    Model model) {

        model.addAttribute("watchGroups", journalGroupService.findAllDataForStudent(pageNumber,pageSize,userId,groupNumber))
                .addAttribute("userId",userId)
                .addAttribute("groupNumber", groupNumber)
                .addAttribute("pageNumber", pageNumber);

        return "manager/watchJournalGroup";
    }

    @GetMapping("/watchJournalGroupUser{groupNumber}/{pageNumber}/{pageSize}")
    public String watchJournalGroupUser(@PathVariable("groupNumber") Long groupNumber,
                                        @PathVariable int pageNumber,@PathVariable int pageSize,
                                        Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());


        model.addAttribute("watchGroups", journalGroupService.findAllDataForStudent(pageNumber,pageSize,user.getId(),groupNumber))
                .addAttribute("groupNumber", groupNumber)
                .addAttribute("pageNumber", pageNumber);


        return "user/watchJournalGroupUser";
    }

    @GetMapping("/addJournalGroup/{userId}/{groupNumber}")
    public String addJournalGroup(@PathVariable("userId") Long userId,
                                  @PathVariable("groupNumber") Long groupNumber,
                           Model model) {

        model.addAttribute("userId", userId)
                .addAttribute("groupNumber", groupNumber)
                .addAttribute("journalGroup", new JournalGroup());

        return "manager/addJournalGroup";
    }

    @PostMapping("/saveJournalGroupManager")
    public String saveJournalGroupManager(@ModelAttribute("journalGroup") JournalGroup journalGroup,
                                   @RequestParam("groupNumber") Long groupNumber,
                                   @RequestParam("userId") Long userId) {

        journalGroupService.saveJournalStudent(journalGroup,groupNumber,userId);
        return "redirect:/";
    }
    @GetMapping("/editJournalGroup{journalGroupId}")
    public String editJournalGroup(@PathVariable("journalGroupId") Long journalGroupId,
                                  Model model) {

        model.addAttribute("journalGroupEdit", journalGroupService.findById(journalGroupId))
                .addAttribute("journalGroupId", journalGroupId);

        return "manager/editJournalGroup";
    }


    @PostMapping("/saveJournalGroup")
    public String saveJournalGroup(@ModelAttribute("journalGroupEdit") JournalGroup journalGroup) {

       journalGroupService.editJournalGroup(journalGroup);

        return "redirect:/";
    }

    @PostMapping("/deleteJournalGroup")
    public String  deleteJournalGroup(@RequestParam(required = true, defaultValue = "" ) Long journalGroupId,
                                 @RequestParam(required = true, defaultValue = "" ) String action) {

        if (action.equals("delete")){
            journalGroupService.deleteJournalGroup(journalGroupId);
        }

        return "redirect:/";
    }
}
