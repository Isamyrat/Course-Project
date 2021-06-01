package com.example.demo.controller;

import com.example.demo.model.Topic;
import com.example.demo.model.User;
import com.example.demo.service.CourseService;
import com.example.demo.service.TopicService;
import com.example.demo.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;
import java.util.ResourceBundle;

@Controller
public class TopicController {

    @Autowired
    private TopicService topicService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private UserService userService;

    @GetMapping("/watchTopics{topicId}")
    public String watchTopics(@PathVariable("topicId") Long topicId,
                              Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        User user = userService.getUser(userDetails.getUsername());

        model.addAttribute("allTopics", topicService.topicFind(topicId))
                .addAttribute("topicId", topicId)
                .addAttribute("person", user);

        return "manager/watchTopics";
    }

    @GetMapping("/addTopics")
    public String addTopics(Model model) {
        model.addAttribute("topicAdd", new Topic())
                .addAttribute("courses", courseService.courseList());
        return "manager/addTopics";
    }

    @PostMapping("/saveTopicManager")
    public String saveTopicManager(@ModelAttribute("topicAdd")
                                           Topic topicForm,
                                   Model model) {
        ResourceBundle resourceBundle = ResourceBundle.getBundle("locale/messages", Objects.requireNonNull(
                Objects.requireNonNull(LocaleContextHolder.getLocaleContext()).getLocale()));
        if (!topicService.saveTopic(topicForm)) {

            model.addAttribute("topicLL",  resourceBundle.getString("error2"));
            return "manager/errors";
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
        return "redirect:/menuManager";
    }

    @PostMapping("/deleteTopic")
    public String  deleteTopic(@RequestParam(required = true, defaultValue = "" ) Long topicId,
                              @RequestParam(required = true, defaultValue = "" ) String action) {

        if (action.equals("delete")){
            topicService.deleteTopic(topicId);
        }
        return "redirect:/menuManager";
    }

}
