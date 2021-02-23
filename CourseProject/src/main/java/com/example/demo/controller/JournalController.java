package com.example.demo.controller;

import com.example.demo.model.Journal;
import com.example.demo.service.GroupService;
import com.example.demo.service.JournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
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

        model.addAttribute("journals", journalService.findALl());

        return "manager/watchJournalManager";
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

    @GetMapping("/editJournalManager{journalId}")
    public String editJournalManager(@PathVariable("journalId") Long journalId,
                                     Model model) {

        model.addAttribute("editJournal", journalService.findById(journalId))
                .addAttribute("journalId" , journalId);


        return "manager/editJournal";
    }

    @PostMapping("/saveJournalMan")
    public String saveJournalMan(@ModelAttribute("editJournal") Journal journal) {

        journalService.editJournal(journal);

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
