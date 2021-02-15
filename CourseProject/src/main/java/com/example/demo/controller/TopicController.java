package com.example.demo.controller;

import com.example.demo.model.Course;
import com.example.demo.model.Topic;
import com.example.demo.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Optional;

@Controller
public class TopicController {

    @Autowired
    private TopicService topicService;

    @GetMapping("/watchTopics{topicId}")
    public String watchTopics(@PathVariable("topicId") Long topicId,
                              Model model) {
        Topic topic = topicService.topicFind(topicId);

        model.addAttribute("allTopics",topic)
            .addAttribute("topicId",topicId);


        return "manager/watchTopics";
    }

    @GetMapping("/addTopics")
    public String addTopics(Model model) {
        model.addAttribute("topicAdd",new Topic());
        return "manager/addTopics";
    }

    @PostMapping("/saveTopicManager")
    public String saveTopicManager(@ModelAttribute("topicAdd")
                                   @Valid Topic topicForm,
                                   Model model) {
        if(!topicService.saveTopic(topicForm)) {
            model.addAttribute("topicLL", "Данный топик уже существует можете его изменить!!");
            return "manager/addTopics";
        }
        return "manager/watchTopics";
    }

    @GetMapping("/editTopics{topicId}")
    public String editTopics(@PathVariable("topicId") Long topicId,
                             Model model) {
        Topic topic1 = topicService.topicById(topicId);
        model.addAttribute("editTopic",topic1)
            .addAttribute("topicId",topicId);
        return "manager/editTopics";
    }

    @PostMapping("/saveEditTopic")
    public String saveEditTopic(@ModelAttribute("editTopic") Topic topic) {
        topicService.editTopic(topic);
        return "manager/menu";
    }

    @PostMapping("/deleteTopic")
    public String deleteTopic(@RequestParam(required = true, defaultValue = "") Long idTopic,
                              @RequestParam(required = true, defaultValue = "") String action) {

        if(action.equals("delete")){
            topicService.deleteTopic(idTopic);
        }
        return "manager/menu";
    }
}
