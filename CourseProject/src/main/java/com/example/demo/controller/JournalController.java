package com.example.demo.controller;

import com.example.demo.model.Journal;
import com.example.demo.service.GroupService;
import com.example.demo.service.JournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class JournalController {

    @Autowired
    private JournalService journalService;

    @Autowired
    private GroupService groupService;


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

    @GetMapping("/addJournal")
    public String addJournal(Model model) {

        model.addAttribute("journalAdd", new Journal())
                .addAttribute("groups", groupService.findAll());

        return "manager/addJournal";
    }


    @PostMapping("/saveJournalManager")
    public String saveJournalManager(@ModelAttribute("journalAdd") Journal journal,
                                     Model model) {

        if(!journalService.saveJournal(journal)){
            model.addAttribute("journalError", "Для данной группы журнал уже существует!!");
            return "manager/addJournal";
        }
        return "redirect:/watchJournalManager";
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
