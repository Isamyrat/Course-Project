package com.example.demo.controller;

import com.example.demo.model.Group;
import com.example.demo.model.User;
import com.example.demo.service.CourseService;
import com.example.demo.service.GroupService;
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
public class GroupController {

    @Autowired
    private GroupService groupService;

    @Autowired
    private UserService userService;

    @Autowired
    private CourseService courseService;

    @GetMapping("/watchGroup/{pageNumber}/{pageSize}")
    public String watchGroup(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));

        model.addAttribute("watchGroups", groupService.findByStatus(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber)
                .addAttribute("start", resourceBundle.getString("Start"))
                .addAttribute("elementary", resourceBundle.getString("Elementary"))
                .addAttribute("pre_Intermediate", resourceBundle.getString("Pre_Intermediate"))
                .addAttribute("intermediate", resourceBundle.getString("Intermediate"))
                .addAttribute("upper_Intermediate", resourceBundle.getString("Upper_Intermediate"))
                .addAttribute("advanced", resourceBundle.getString("Advanced"))
                .addAttribute("english", resourceBundle.getString("English"))
                .addAttribute("french", resourceBundle.getString("French"))
                .addAttribute("russian", resourceBundle.getString("Russian"))
                .addAttribute("turkish", resourceBundle.getString("Turkish"));

        return "manager/watchGroup";
    }

    @GetMapping("/watchGroupWaiting/{pageNumber}/{pageSize}")
    public String watchGroupWaiting(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));

        model.addAttribute("watchGroupWaiting", groupService.findByStatusWaiting(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber)
                .addAttribute("start", resourceBundle.getString("Start"))
                .addAttribute("elementary", resourceBundle.getString("Elementary"))
                .addAttribute("pre_Intermediate", resourceBundle.getString("Pre_Intermediate"))
                .addAttribute("intermediate", resourceBundle.getString("Intermediate"))
                .addAttribute("upper_Intermediate", resourceBundle.getString("Upper_Intermediate"))
                .addAttribute("advanced", resourceBundle.getString("Advanced"))
                .addAttribute("english", resourceBundle.getString("English"))
                .addAttribute("french", resourceBundle.getString("French"))
                .addAttribute("russian", resourceBundle.getString("Russian"))
                .addAttribute("turkish", resourceBundle.getString("Turkish"));

        return "manager/watchGroupWaiting";
    }
    @GetMapping("/watchGroupArchive/{pageNumber}/{pageSize}")
    public String watchGroupArchive(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));

        model.addAttribute("watchGroupArchive", groupService.findByStatusArchive(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber)
                .addAttribute("start", resourceBundle.getString("Start"))
                .addAttribute("elementary", resourceBundle.getString("Elementary"))
                .addAttribute("pre_Intermediate", resourceBundle.getString("Pre_Intermediate"))
                .addAttribute("intermediate", resourceBundle.getString("Intermediate"))
                .addAttribute("upper_Intermediate", resourceBundle.getString("Upper_Intermediate"))
                .addAttribute("advanced", resourceBundle.getString("Advanced"))
                .addAttribute("english", resourceBundle.getString("English"))
                .addAttribute("french", resourceBundle.getString("French"))
                .addAttribute("russian", resourceBundle.getString("Russian"))
                .addAttribute("turkish", resourceBundle.getString("Turkish"));

        return "manager/watchGroupArchive";
    }

    @GetMapping("/watchGroupUser/{pageNumber}/{pageSize}")
    public String watchGroupUser(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("userGroup", groupService.findByUserList(pageNumber,pageSize,user.getId()))
                .addAttribute("pageNumber", pageNumber)
                .addAttribute("start", resourceBundle.getString("Start"))
                .addAttribute("elementary", resourceBundle.getString("Elementary"))
                .addAttribute("pre_Intermediate", resourceBundle.getString("Pre_Intermediate"))
                .addAttribute("intermediate", resourceBundle.getString("Intermediate"))
                .addAttribute("upper_Intermediate", resourceBundle.getString("Upper_Intermediate"))
                .addAttribute("advanced", resourceBundle.getString("Advanced"))
                .addAttribute("english", resourceBundle.getString("English"))
                .addAttribute("french", resourceBundle.getString("French"))
                .addAttribute("russian", resourceBundle.getString("Russian"))
                .addAttribute("turkish", resourceBundle.getString("Turkish"));
        return "manager/watchGroup";
    }

    @GetMapping("/watchGroupTeacher/{pageNumber}/{pageSize}")
    public String watchGroupTeacher(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("userGroup", groupService.findByTeacher(pageNumber,pageSize, user.getId()))
                .addAttribute("pageNumber", pageNumber)
                .addAttribute("start", resourceBundle.getString("Start"))
                .addAttribute("elementary", resourceBundle.getString("Elementary"))
                .addAttribute("pre_Intermediate", resourceBundle.getString("Pre_Intermediate"))
                .addAttribute("intermediate", resourceBundle.getString("Intermediate"))
                .addAttribute("upper_Intermediate", resourceBundle.getString("Upper_Intermediate"))
                .addAttribute("advanced", resourceBundle.getString("Advanced"))
                .addAttribute("english", resourceBundle.getString("English"))
                .addAttribute("french", resourceBundle.getString("French"))
                .addAttribute("russian", resourceBundle.getString("Russian"))
                .addAttribute("turkish", resourceBundle.getString("Turkish"));
        return "manager/watchGroup";
    }

    @GetMapping("/watchGroupUsers{idGroup}")
    public String watchGroupUsers(@PathVariable("idGroup") Long idGroup,
                                  Model model) {

        model.addAttribute("watchUsers", groupService.findById(idGroup))
                .addAttribute("idGroup", idGroup);

        return "manager/watchGroupUsers";
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

        return "redirect:/menuManager";
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
        return "redirect:/menuManager";
    }
    @PostMapping("/saveManagerGroup")
    public String saveManagerGroup(@ModelAttribute("groupEdit") Group group, Model model) {
        if (!groupService.editGroup(group)) {
            model.addAttribute("groupError", "Такой номер группы уже существует измените его пожалуйста!!!");
            return "manager/errors";
        }

        return "redirect:/menuManager";
    }

    @PostMapping("/deleteStud")
    public String deleteStudent(@RequestParam(required = true, defaultValue = "") Long userId,
                                @RequestParam(required = true, defaultValue = "") Long groupNumber,
                                @RequestParam(required = true, defaultValue = "") String action) {


        if (action.equals("delete")) {
            groupService.deleteUser(userId,groupNumber);
        }
        return "redirect:/menuManager";
    }
}
