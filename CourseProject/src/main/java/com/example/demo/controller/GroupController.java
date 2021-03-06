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

    @GetMapping("/watchGroup/{pageNumber}/{pageSize}")
    public String watchGroup(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {

        model.addAttribute("watchGroups", groupService.findByStatus(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber);

        return "manager/watchGroup";
    }

    @GetMapping("/watchGroupWaiting/{pageNumber}/{pageSize}")
    public String watchGroupWaiting(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {

        model.addAttribute("watchGroupWaiting", groupService.findByStatusWaiting(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber);

        return "manager/watchGroupWaiting";
    }
    @GetMapping("/watchGroupArchive/{pageNumber}/{pageSize}")
    public String watchGroupArchive(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {

        model.addAttribute("watchGroupArchive", groupService.findByStatusArchive(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber);

        return "manager/watchGroupArchive";
    }
    @GetMapping("/watchGroupUsers{idGroup}")
    public String watchGroupUsers(@PathVariable("idGroup") Long idGroup,
                                  Model model) {

        model.addAttribute("watchUsers", groupService.findById(idGroup))
                .addAttribute("idGroup", idGroup);

        return "manager/watchGroupUsers";
    }

    @GetMapping("/watchGroupUser/{pageNumber}/{pageSize}")
    public String watchGroupUser(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("userGroup", groupService.findByUserList(pageNumber,pageSize,user.getId()))
                .addAttribute("pageNumber", pageNumber);
        return "manager/watchGroup";
    }

    @GetMapping("/watchGroupTeacher/{pageNumber}/{pageSize}")
    public String watchGroupTeacher(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();

        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("userGroup", groupService.findByTeacher(pageNumber,pageSize, user.getId()))
                .addAttribute("pageNumber", pageNumber);
        return "manager/watchGroup";
    }

    @GetMapping("/addGroup")
    public String addGroup(Model model) {

        model.addAttribute("users", userService.allUsers())
                .addAttribute("courses", courseService.courseList())
                .addAttribute("group", new Group());

        return "manager/addGroup";
    }

    @PostMapping("/saveGroupManager")
    public String saveGroupManager(@ModelAttribute("group") Group group, Model model) {

        if (!groupService.saveGroup(group)) {
            model.addAttribute("groupError", "Такой номер группы уже существует измените его пожалуйста!!!");
            return "manager/errors";
        }

        return "redirect:/watchGroup/${0}/${3}";
    }

    @GetMapping("/editGroupManager{groupId}")
    public String editGroupManager(@PathVariable("groupId") Long groupId,
                                   Model model) {

        model.addAttribute("group", groupService.findByNumberOfGroup(groupId))
                .addAttribute("groupId", groupId);
        return "manager/editGroupManager";
    }

    @GetMapping("/editGroupStatus{groupId}")
    public String editGroupStatus(@PathVariable("groupId") Long groupId,
                                   Model model) {

        model.addAttribute("group", groupService.findByNumberOfGroup(groupId))
                .addAttribute("groupId", groupId);
        return "manager/editGroupStatus";
    }

    @GetMapping("/editGroupTeacher{groupId}")
    public String editGroupTeacher(@PathVariable("groupId") Long groupId,
                                   Model model) {

        model.addAttribute("group", groupService.findByNumberOfGroup(groupId))
                .addAttribute("teacher", userService.allUsers());
        return "manager/editGroupTeacher";
    }

    @PostMapping("/saveGroupMan")
    public String saveGroupMan(@ModelAttribute("groupEdit") Group group) {
        groupService.editStatus(group);
        return "redirect:/watchGroup/${0}/${3}";
    }
    @PostMapping("/saveManagerGroup")
    public String saveManagerGroup(@ModelAttribute("groupEdit") Group group) {
        groupService.editGroup(group);
        return "redirect:/watchGroup/${0}/${3}";
    }

    @PostMapping("/deleteStud")
    public String deleteStudent(@RequestParam(required = true, defaultValue = "") Long userId,
                                @RequestParam(required = true, defaultValue = "") Long groupNumber,
                                @RequestParam(required = true, defaultValue = "") String action) {


        if (action.equals("delete")) {
            groupService.deleteUser(userId,groupNumber);
        }
        return "redirect:/watchGroup/${0}/${3}";
    }
}
