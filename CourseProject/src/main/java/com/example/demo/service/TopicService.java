package com.example.demo.service;

import com.example.demo.dao.CourseRepository;
import com.example.demo.dao.TopicRepository;
import com.example.demo.model.Course;
import com.example.demo.model.Topic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class TopicService {

    @Autowired
    TopicRepository topicRepository;

    @Autowired
    CourseRepository courseRepository;

    @Autowired
    CourseService courseService;

    public Topic topicById(Long id){
        Optional<Topic> topic = topicRepository.findById(id);
        return topic.orElse(new Topic());
    }


    public Boolean saveTopic(Topic topic){
        Course course = courseService.courseById(topic.getCourseTopic().getId());

        Topic topic1 = topicRepository.findByCourseId(course.getId());

        if(topic1 != null){
            return false;
        }

        topic.setCourseTopic(course);
        topicRepository.save(topic);
        return true;
    }

    public  Topic topicFind(Long course){
        return topicRepository.findByCourseId(course);
    }

    public void editTopic(Topic topic){
        topicRepository.save(topic);
    }

    public void deleteTopic(Long topicId) {
        topicRepository.deleteTopicById(topicId);
    }

}
