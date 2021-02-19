package com.example.demo.controller;

import com.example.demo.model.Topic;
import com.example.demo.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class TopicController {

    @Autowired
    private TopicService topicService;

    @GetMapping("/watchTopics{topicId}")
    public String watchTopics(@PathVariable("topicId") Long topicId,
                              Model model) {

        model.addAttribute("allTopics", topicService.topicFind(topicId))
                .addAttribute("topicId", topicId);


        return "manager/watchTopics";
    }

    @GetMapping("/addTopics")
    public String addTopics(Model model) {
        model.addAttribute("topicAdd", new Topic());
        return "manager/addTopics";
    }

    @PostMapping("/saveTopicManager")
    public String saveTopicManager(@ModelAttribute("topicAdd")
                                           Topic topicForm,
                                   Model model) {

        if (!topicService.saveTopic(topicForm)) {
            model.addAttribute("topicLL", "Такого курса не существует!!")
                    .addAttribute("topicLevel", "Данный топик уже существует можете его изменить");
            return "manager/addTopics";
        }
        return "redirect:/menuManager";
    }

    @GetMapping("/editTopics{topicId}")
    public String editTopics(@PathVariable("topicId") Long topicId,
                             Model model) {

        model.addAttribute("editTopic", topicService.topicById(topicId))
                .addAttribute("topicId", topicId);
        return "manager/editTopics";
    }

    @PostMapping("/saveEditTopic")
    public String saveEditTopic(@ModelAttribute("editTopic") Topic topic) {
        topicService.editTopic(topic);
        return "manager/menu";
    }
}
