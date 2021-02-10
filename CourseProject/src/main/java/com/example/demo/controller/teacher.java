package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class teacher {

    @GetMapping("/personalInformationTeachers")
    public String personal() {
        return "user/personalInformation";
    }

    @GetMapping("/watchJournal")
    public String watchJournal() {
        return "teacher/watchJournal";
    }

    @GetMapping("/editJournal")
    public String editJournal() {
        return "teacher/savejournal";
    }

    @GetMapping("/saveJournal")
    public String saveJournal() {
        return "teacher/watchJournal";
    }


}