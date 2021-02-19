package com.example.demo.dao;

import com.example.demo.model.Topic;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface TopicRepository extends CrudRepository<Topic,Long> {

    @Override
    Optional<Topic> findById(Long aLong);

    @Query("select t from Topic  t where t.course_topic.id = :courseId")
    Topic findByCourse_topicId(@Param("courseId") Long courseId);


}
