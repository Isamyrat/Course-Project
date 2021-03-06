package com.example.demo.controller;

import com.example.demo.service.JournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class JournalController {

    @Autowired
    private JournalService journalService;


    @GetMapping("/watchJournalManager/{pageNumber}/{pageSize}")
    public String watchJournalManager(@PathVariable int pageNumber,@PathVariable int pageSize, Model model) {

        model.addAttribute("journals", journalService.findByStatus(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber);

        return "manager/watchJournalManager";
    }

    @GetMapping("/watchJournal/{pageNumber}/{pageSize}")
    public String watchJournal(@PathVariable int pageNumber,@PathVariable int pageSize, Model model) {

        model.addAttribute("journalsArchive", journalService.findByStatusArchive(pageNumber,pageSize))
                .addAttribute("pageNumber", pageNumber);

        return "manager/watchJournal";
    }

}
