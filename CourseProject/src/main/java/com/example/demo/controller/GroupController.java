package com.example.demo.controller;

import com.example.demo.model.Group;
import com.example.demo.model.User;
import com.example.demo.model.enumModel.Roles;
import com.example.demo.model.enumModel.Status;
import com.example.demo.service.CourseService;
import com.example.demo.service.GroupService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
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

    @GetMapping("/watchGroup")
    public String watchGroup( Pageable pageable, Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        Page<Group> pages = groupService.findByStatus(pageable, Status.Started.toString());
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("watchGroups", pages.getContent())
                .addAttribute("start", resourceBundle.getString("Start"))
                .addAttribute("elementary", resourceBundle.getString("Elementary"))
                .addAttribute("pre_Intermediate", resourceBundle.getString("Pre_Intermediate"))
                .addAttribute("intermediate", resourceBundle.getString("Intermediate"))
                .addAttribute("upper_Intermediate", resourceBundle.getString("Upper_Intermediate"))
                .addAttribute("advanced", resourceBundle.getString("Advanced"))
                .addAttribute("english", resourceBundle.getString("English"))
                .addAttribute("french", resourceBundle.getString("French"))
                .addAttribute("russian", resourceBundle.getString("Russian"))
                .addAttribute("turkish", resourceBundle.getString("Turkish"))
                .addAttribute("totalPages", pages.getTotalPages())
                .addAttribute("totalElements", pages.getTotalElements())
                .addAttribute("number", pages.getNumber())
                .addAttribute("size", pages.getSize())
                .addAttribute("person", user);

        return "manager/watchGroup";
    }

    @GetMapping("/watchGroupWaiting")
    public String watchGroupWaiting(Pageable pageable,Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        Page<Group> pages = groupService.findByStatus( pageable, Status.Wait.toString());

        model.addAttribute("watchGroupWaiting", pages.getContent())
                .addAttribute("start", resourceBundle.getString("Start"))
                .addAttribute("elementary", resourceBundle.getString("Elementary"))
                .addAttribute("pre_Intermediate", resourceBundle.getString("Pre_Intermediate"))
                .addAttribute("intermediate", resourceBundle.getString("Intermediate"))
                .addAttribute("upper_Intermediate", resourceBundle.getString("Upper_Intermediate"))
                .addAttribute("advanced", resourceBundle.getString("Advanced"))
                .addAttribute("english", resourceBundle.getString("English"))
                .addAttribute("french", resourceBundle.getString("French"))
                .addAttribute("russian", resourceBundle.getString("Russian"))
                .addAttribute("turkish", resourceBundle.getString("Turkish"))
                .addAttribute("totalPages", pages.getTotalPages())
                .addAttribute("totalElements", pages.getTotalElements())
                .addAttribute("number", pages.getNumber())
                .addAttribute("size", pages.getSize());

        return "manager/watchGroupWaiting";
    }
    @GetMapping("/watchGroupArchive")
    public String watchGroupArchive(Pageable pageable,Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        Page<Group> pages = groupService.findByStatus(pageable,Status.Finish.toString());

        model.addAttribute("watchGroupArchive", pages.getContent())
                .addAttribute("start", resourceBundle.getString("Start"))
                .addAttribute("elementary", resourceBundle.getString("Elementary"))
                .addAttribute("pre_Intermediate", resourceBundle.getString("Pre_Intermediate"))
                .addAttribute("intermediate", resourceBundle.getString("Intermediate"))
                .addAttribute("upper_Intermediate", resourceBundle.getString("Upper_Intermediate"))
                .addAttribute("advanced", resourceBundle.getString("Advanced"))
                .addAttribute("english", resourceBundle.getString("English"))
                .addAttribute("french", resourceBundle.getString("French"))
                .addAttribute("russian", resourceBundle.getString("Russian"))
                .addAttribute("turkish", resourceBundle.getString("Turkish"))
                .addAttribute("totalPages", pages.getTotalPages())
                .addAttribute("totalElements", pages.getTotalElements())
                .addAttribute("number", pages.getNumber())
                .addAttribute("size", pages.getSize());

        return "manager/watchGroupArchive";
    }

    @GetMapping("/watchGroupUser/{pageNumber}/{pageSize}")
    public String watchGroupUser(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("watchGroups", groupService.findByUserList(pageNumber,pageSize,user.getId()))
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
                .addAttribute("turkish", resourceBundle.getString("Turkish"))
                .addAttribute("person", user);

        return "manager/watchGroup";
    }

    @GetMapping("/watchGroupTeacher/{pageNumber}/{pageSize}")
    public String watchGroupTeacher(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("watchGroups", groupService.findByTeacher(pageNumber,pageSize, user.getId()))
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
                .addAttribute("turkish", resourceBundle.getString("Turkish"))
                .addAttribute("person", user);
        return "manager/watchGroup";
    }

    @GetMapping("/watchGroupUsers{idGroup}")
    public String watchGroupUsers(@PathVariable("idGroup") Long idGroup,
                                  Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("watchUsers", groupService.findById(idGroup))
                .addAttribute("idGroup", idGroup)
                .addAttribute("person", user);


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
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages",Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        if (!groupService.saveGroup(group)) {
            model.addAttribute("groupError", resourceBundle.getString("error1"));
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
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages",Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        if (!groupService.editGroup(group)) {
            model.addAttribute("groupError", resourceBundle.getString("error1"));
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
