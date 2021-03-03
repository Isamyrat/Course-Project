package com.example.demo.service;

import com.example.demo.dao.CourseRepository;
import com.example.demo.model.Course;
import com.example.demo.model.enumModel.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Optional;

@Service
public class CourseService {

    @Autowired
    CourseRepository courseRepository;

    public List<Course> allCourses(){
        return  courseRepository.findAll();
    }

    public Course courseById(Long id){
        Optional<Course> course = courseRepository.findById(id);
        return  course.orElse(new Course());
    }

    public boolean saveCourse(Course course){
        Course course1 = courseRepository.findByCourse(course.getLanguage(),course.getLevel());

        if(course1 !=null){
            return false;
        }

        courseRepository.save(course);
        return true;
    }
    public List<Course> courseList (){
        return courseRepository.findByStatus(Status.Use);
    }
    public List<Course> coursesList (){
        return courseRepository.findByStatus(Status.NotUse);
    }
    public void editCourse(Course course){
        courseRepository.save(course);
    }

    public void editCourseStatus(Long courseId){
        Course course = courseById(courseId);
        course.setStatus(Status.NotUse);
        courseRepository.save(course);
    }
    public void editStatusCourse(Long courseId){
        Course course = courseById(courseId);
        course.setStatus(Status.Use);
        courseRepository.save(course);
    }

}
