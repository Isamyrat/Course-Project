package com.example.demo.dao;

import com.example.demo.model.Course;
import com.example.demo.model.enumModel.Status;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {


    Optional<Course> findById(Long aLong);

    @Query("select c from Course  c where c.language = :language and  c.level = :level")
    Course findByCourse(String language,String level);

    @Query("select c from Course  c where c.id = :id")
    Course findByCourseId(Long id);

    List<Course> findByStatus(Status status);

    List<Course> findAllByStatus(Status status, Pageable pageable);
}
