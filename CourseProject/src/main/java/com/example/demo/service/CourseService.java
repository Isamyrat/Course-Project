package com.example.demo.service;

import com.example.demo.dao.CourseRepository;
import com.example.demo.model.Course;
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
    public Boolean deleteByIdCourse(Long id){
        if(courseRepository.findById(id).isPresent()) {
             courseRepository.deleteById(id);
            return true;
        }
        return false;
    }


    public boolean saveCourse(Course course){
        Course course1 = courseRepository.findByCourse(course.getLanguage(),course.getLevel());

        if(course1 !=null){
            return false;
        }

        courseRepository.save(course);
        return true;
    }
    public Course editCourse(Course course){
        return courseRepository.save(course);
    }

}
