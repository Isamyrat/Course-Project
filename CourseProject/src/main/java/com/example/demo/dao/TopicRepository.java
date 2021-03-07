package com.example.demo.dao;

import com.example.demo.model.Topic;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Optional;

@Repository
public interface TopicRepository extends CrudRepository<Topic,Long> {

    @Override
    Optional<Topic> findById(Long aLong);

    @Query("select t from Topic  t where t.courseTopic.id = :courseId")
    Topic findByCourseId(@Param("courseId") Long courseId);

    @Modifying
    @Transactional
    @Query(value = "delete from Topic t where t.id = :id", nativeQuery = true)
    void deleteTopicById(Long id);
}
