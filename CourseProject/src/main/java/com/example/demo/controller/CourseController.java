package com.example.demo.controller;

import com.example.demo.model.Course;
import com.example.demo.model.User;
import com.example.demo.service.CourseService;
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
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private UserService userService;

    @GetMapping("/watchAllCoursesManager/{pageNumber}/{pageSize}")
    public String watchAllCoursesManager(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = userService.getUser(userDetails.getUsername());

        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));

        model.addAttribute("allCourses", courseService.findCourse(pageNumber,pageSize))
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

        return "manager/watchAllCoursesManager";
    }

    @GetMapping("/watchAllCoursesManagerArchive/{pageNumber}/{pageSize}")
    public String watchAllCoursesManagerArchive(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));

        model.addAttribute("allCoursesArchive", courseService.findByStatusList(pageNumber,pageSize))
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

        return "manager/watchAllCoursesManagerArchive";
    }

    @GetMapping("/addCourse")
    public String addCourse(Model model) {

        model.addAttribute("courseAdd", new Course());

        return "manager/addCourse";
    }

    @PostMapping("/saveCourseAddManager")
    public String saveCourseManager(@ModelAttribute("courseAdd")
                                    Course courseForm,
                                    Model model) {

        if(!courseService.saveCourse(courseForm)){
            model.addAttribute("courseLanguageError", "Курсы с таким уровенем и языком уже создан!");
            return "manager/addCourse";
        }

        return "redirect:/menuManager";
    }

    @GetMapping("/editCourseManager{courseId}")
    public String editCourseManager(@PathVariable("courseId") Long courseId,
                                    Model model) {

        model.addAttribute("editCourse", courseService.courseById(courseId))
            .addAttribute("courseId", courseId);

        return "manager/editCourseManager";
    }

    @PostMapping("/saveCourseEditManager")
    public String saveCourseMan(@ModelAttribute("editCourse") Course course) {

        courseService.editCourse(course);

        return "redirect:/menuManager";
    }

    @PostMapping("/saveCourseEditStatus")
    public String saveCourseEditStatus(@RequestParam("idCourse") Long idCourse) {

        courseService.editCourseStatus(idCourse);

        return "redirect:/menuManager";
    }

    @PostMapping("/saveCourseStatusEdit")
    public String saveCourseStatusEdit(@RequestParam("idCourse") Long idCourse) {

        courseService.editStatusCourse(idCourse);

        return "redirect:/menuManager";
    }

}