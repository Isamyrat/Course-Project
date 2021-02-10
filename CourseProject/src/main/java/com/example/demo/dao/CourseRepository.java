package com.example.demo.dao;

import com.example.demo.model.Course;
import com.example.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {


    Optional<Course> findById(Long aLong);

    @Query("select c from Course  c where c.language = :language and  c.level = :level")
    public Course findByCourse(String language,String level);

    @Query("select c from Course  c where c.id = :id")
    public Course findByCourseId(Long id);
}
