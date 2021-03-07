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

    @GetMapping("/watchAllCoursesManager/{pageNumber}/{pageSize}")
    public String watchAllCoursesManager(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {

        model.addAttribute("allCourses", courseService.findCourse(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber);

        return "manager/watchAllCoursesManager";
    }

    @GetMapping("/watchAllCoursesManagerArchive/{pageNumber}/{pageSize}")
    public String watchAllCoursesManagerArchive(@PathVariable int pageNumber,@PathVariable int pageSize,Model model) {

        model.addAttribute("allCoursesArchive", courseService.findByStatusList(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber);

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