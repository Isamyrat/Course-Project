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


    @GetMapping("/watchJournalManager")
    public String watchJournalManager(Model model) {

        model.addAttribute("journals", journalService.findByStatus());

        return "manager/watchJournalManager";
    }

    @GetMapping("/watchJournal")
    public String watchJournal(Model model) {

        model.addAttribute("journalsArchive", journalService.findByStatusArchive());

        return "manager/watchJournal";
    }


    @PostMapping("/deleteJournal")
    public String deleteJournal(@RequestParam(required = true, defaultValue = "") Long journalId,
                                @RequestParam(required = true, defaultValue = "") String action) {

        if(action.equals("delete")){
            journalService.deleteJournal(journalId);
        }
        return "redirect:/watchJournalManager";
    }

}
