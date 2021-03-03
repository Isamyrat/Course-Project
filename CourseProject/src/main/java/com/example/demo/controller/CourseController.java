package com.example.demo.controller;

import com.example.demo.model.Course;
import com.example.demo.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
public class CourseController {

    @Autowired
    private CourseService courseService;

    @GetMapping("/watchAllCoursesManager")
    public String watchAllCoursesManager(Model model) {

        model.addAttribute("allCoursesUser", courseService.courseList());

        return "manager/watchAllCoursesManager";
    }

    @GetMapping("/watchAllCoursesManagerArchive")
    public String watchAllCoursesManagerArchive(Model model) {

        model.addAttribute("allCoursesUser", courseService.coursesList());

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

        return "redirect:/watchAllCoursesManager";
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

        return "redirect:/watchAllCoursesManager";
    }

    @PostMapping("/saveCourseEditStatus")
    public String saveCourseEditStatus(@RequestParam("idCourse") Long idCourse) {

        courseService.editCourseStatus(idCourse);

        return "redirect:/watchAllCoursesManager";
    }

    @PostMapping("/saveCourseStatusEdit")
    public String saveCourseStatusEdit(@RequestParam("idCourse") Long idCourse) {

        courseService.editStatusCourse(idCourse);

        return "redirect:/watchAllCoursesManager";
    }


}