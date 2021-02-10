package com.example.demo.controller;


import com.example.demo.model.Course;
import com.example.demo.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.util.Optional;
import javax.validation.Valid;

@Controller
public class CourseController {
    @Autowired
    private CourseService courseService;

    @GetMapping("/watchAllCoursesManager")
    public String watchAllCoursesManager(Model model) {
        model.addAttribute("allCoursesUser", courseService.allCourses());
        return "manager/watchAllCoursesManager";
    }

    @GetMapping("/addCourse")
    public String addCourse(Model model) {
        model.addAttribute("courseAdd", new Course());
        return "manager/addCourse";
    }

    @PostMapping("/saveCourseAddManager")
    public String saveCourseManager(@ModelAttribute("courseAdd")
                                    @Valid Course courseForm,
                                    BindingResult bindingResult,
                                    Model model) {
        if(bindingResult.hasErrors()){
            return "manager/addCourse";
        }
        if(!courseService.saveCourse(courseForm)){
            model.addAttribute("courseLevelError", "Курсы с таким уровенем и языком уже создан!");
            model.addAttribute("courseLanguageError", "Курсы с таким уровенем и языком уже создан!");
        }

        return "redirect:/watchAllCoursesManager";
    }

    @GetMapping("/editCourseManager")
    public String editCourseManager(@RequestParam("course") Long course,
                                    Model model) {

        Course course1= courseService.courseById(course);
        model.addAttribute("editCourse", course1);

        return "manager/editCourseManager";
    }

    @PostMapping("/saveCourseEditManager")
    public String saveCourseMan(@ModelAttribute("editCourse") Course course) {

        courseService.editCourse(course);

        return "redirect:/watchAllCoursesManager";
    }

    @PostMapping("/deleteCourseManager")
    public String deleteCourseManager(@RequestParam(required = true, defaultValue = "") Long idCourse,
                                      @RequestParam(required = true, defaultValue = "") String action) {
        if(action.equals("delete")){
            courseService.deleteByIdCourse(idCourse);
        }
        return "manager/watchAllCoursesManager";
    }
}
