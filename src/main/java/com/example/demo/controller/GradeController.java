package com.example.demo.controller;

import com.example.demo.model.UserSession;
import com.example.demo.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;

@Controller
public class GradeController {

    @Autowired
    private UserSession userSession;

    // Endpoint to display grade page
    @GetMapping("/grade")
    public String showGrades(Model model) {
        // Dummy grades data
        Map<String, Integer> grades = new HashMap<>();
        grades.put("John", 80);
        grades.put("Mary", 100);
        grades.put("Peter", 80);

        if(userSession.getQuizCompleted()) {
            String username = userSession.getUsername();
            int grade = (int)userSession.getPercentage();

            grades.put(username, grade);
        }

        // Sort the grades by value in descending order
        List<Map.Entry<String, Integer>> sortedGrades = new ArrayList<>(grades.entrySet());
        sortedGrades.sort((entry1, entry2) -> entry2.getValue().compareTo(entry1.getValue()));

        model.addAttribute("grades", sortedGrades);
        return "grade";
    }
}
