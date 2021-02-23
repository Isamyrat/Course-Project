package com.example.demo.controller;

import com.example.demo.model.Group;
import com.example.demo.model.User;
import com.example.demo.service.CourseService;
import com.example.demo.service.GroupService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class GroupController {

    @Autowired
    private GroupService groupService;

    @Autowired
    private UserService userService;

    @Autowired
    private CourseService courseService;

    @GetMapping("/watchGroup")
    public String watchGroup(Model model) {

        model.addAttribute("watchGroups", groupService.findByStatus());

        return "manager/watchGroup";
    }

    @GetMapping("/watchGroupUsers{idGroup}")
    public String watchGroupUsers(@PathVariable("idGroup") Long idGroup,
                                  Model model) {

        model.addAttribute("watchUsers", groupService.findById(idGroup))
                .addAttribute("idGroup", idGroup);

        return "manager/watchGroupUsers";
    }

    @GetMapping("/watchGroupArhiv")
    public String watchGroupArhiv(Model model) {

        model.addAttribute("watchUsersArhiv", groupService.findByStatusOne());

        return "manager/watchGroupArhiv";
    }

    @GetMapping("/watchGroupUser")
    public String watchGroupUser(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("userGroup", groupService.findByUser(user.getId()));
        return "manager/watchGroup";
    }

    @GetMapping("/watchGroupTeacher")
    public String watchGroupTeacher(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("userGroup", groupService.findByTeacher(user.getId()));
        return "manager/watchGroup";
    }

    @GetMapping("/addGroup")
    public String addGroup(Model model) {

        model.addAttribute("users", userService.allUsers())
                .addAttribute("courses", courseService.allCourses())
                .addAttribute("group", new Group());

        return "manager/addGroup";
    }

    @PostMapping("/saveGroupManager")
    public String saveGroupManager(@ModelAttribute("group") Group group, Model model) {

        if (!groupService.saveGroup(group)) {
            model.addAttribute("groupError", "Такой номер группы уже существует измените его пожалуйста!!!");
            return "manager/addGroup";
        }

        return "redirect:/watchGroup";
    }

    @GetMapping("/editGroupManager{groupId}")
    public String editGroupManager(@PathVariable("groupId") Long groupId,
                                   Model model) {

        model.addAttribute("group", groupService.findByNumberOfGroup(groupId))
                .addAttribute("groupId", groupId);
        return "manager/editGroupManager";
    }

    @PostMapping("/saveGroupMan")
    public String saveGroupMan(@ModelAttribute("groupEdit") Group group) {
        groupService.editStatus(group);
        return "redirect:/watchGroup";
    }

    @PostMapping("/deleteStud")
    public String deleteStudent(@RequestParam(required = true, defaultValue = "") Long userId,
                                @RequestParam(required = true, defaultValue = "") String action) {

        if (action.equals("delete")) {
            groupService.deleteUser(userId);
        }
        return "redirect:/watchGroup";
    }
}
