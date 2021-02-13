package com.example.demo.controller;

import com.example.demo.model.Course;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
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

        String status = "В ожидании";

        List<Group>  groups = groupService.findByStatus(status);

        model.addAttribute("watchGroups", groups);
        return "manager/watchGroup";
    }

    @GetMapping("/watchGroupUsers")
    public String watchGroupUsers(@RequestParam("idGroup") Long idGroup,
                                  Model model) {

        Group group = groupService.findById(idGroup);

        model.addAttribute("watchUsers", group);

        return "manager/watchGroupUsers";
    }


    @GetMapping("/watchGroupArhiv")
    public String watchGroupArhiv(Model model) {

        String status = "Закончилась";

        List<Group> group = groupService.findByStatus(status);

        model.addAttribute("watchUsersArhiv", group);

        return "manager/watchGroupArhiv";
    }

    @GetMapping("/watchGroupUser")
    public String watchGroupUser(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();


        User u = userService.getUser(userDetails.getUsername());

        Group group = groupService.findByUser(u.getId());

        model.addAttribute("userGroup",group);
        return "user/watchCource";
    }
    @GetMapping("/watchGroupTeacher")
    public String watchGroupTeacher(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();


        User u = userService.getUser(userDetails.getUsername());

        List<Group> group = groupService.findByTeacher(u.getId());

        model.addAttribute("userGroup",group);
        return "teacher/watchGroup";
    }



    @GetMapping("/addGroup")
    public String addGroup(Model model) {
        List<User> user = userService.allUsers();

        List<Course> courses = courseService.allCourses();

        model.addAttribute("users", user);

        model.addAttribute("courses", courses);

        model.addAttribute("group", new Group());
        return "manager/addGroup";
    }


    @PostMapping("/saveGroupManager")
    public String saveGroupManager(@ModelAttribute ("group") Group group)
    {

        Course course = courseService.courseById(group.getCourse_group().getId());
        User user  = userService.findUserById(group.getUser_teacher().getId());
        group.setCourse_group(course);
        group.setUser_teacher(user);
        groupService.saveGroup(group);
        return "redirect:/watchGroup";
    }

    @GetMapping("/editGroupManager")
    public String editGroupManager(@RequestParam("editGroup") Long editGroup,
                                   Model model) {
        Group group = groupService.findByNumberOfGroup(editGroup);
        model.addAttribute("groupEdit",group);
        return "manager/editGroupManager";
    }




    @PostMapping("/saveGroupMan")
    public String saveGroupMan(@ModelAttribute("groupEdit") Group group) {
        groupService.editStatus(group);
        return "redirect:/watchGroup";
    }

}
