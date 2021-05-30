package com.example.demo.dao;

import com.example.demo.model.Course;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import java.util.*;

@Repository
public interface CourseRepository extends PagingAndSortingRepository<Course, Long> {

    Optional<Course> findById(Long aLong);

    @Query("select c from Course  c where c.language = :language and  c.level = :level")
    Course findByCourse(String language,String level);

    @Query("select c from Course  c where c.id = :id")
    Course findByCourseId(Long id);

    @Query("from Course")
    List<Course> getAll();

    @Query("select c from Course c where c.status = :status")
    Page<Course> findByStatusCourse(String status, Pageable pageable);

    List<Course> findByStatus(String status);
}
