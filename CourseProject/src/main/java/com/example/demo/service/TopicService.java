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

    public Topic topicById(Long id){
        Optional<Topic> topic = topicRepository.findById(id);
        return topic.orElse(new Topic());
    }

    public List<Topic> allTopics(){
        return (List<Topic>) topicRepository.findAll();
    }

    public Boolean deleteTopic(Long id){
        if(topicRepository.findById(id).isPresent()){
            topicRepository.deleteById(id);

            return true;
        }
        return false;
    }
    public Boolean saveTopic(Topic topic){
        Course course = courseRepository.findByCourse(topic.getCourse_topic().getLanguage(),topic.getCourse_topic().getLevel());

        if(course==null){
            return false;
        }

        Topic topic1 = topicRepository.findByCourse_topicId(course.getId());


        if(topic1 != null){
            return false;
        }


        topic.setCourse_topic(course);
        topicRepository.save(topic);
        return true;
    }

    public  Topic topicFind(Long course){
        return topicRepository.findByCourse_topicId(course);
    }

    public Topic editTopic(Topic topic){
        return topicRepository.save(topic);
    }


}
