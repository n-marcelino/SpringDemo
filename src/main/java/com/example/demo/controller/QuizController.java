package com.example.demo.controller;

import com.example.demo.model.UserSession;
import com.example.demo.service.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

@Controller
public class QuizController {

    @Autowired
    private UserSession userSession;

    @Autowired
    private QuizService quizService;

    @GetMapping("/quiz")
    public String getQuiz(Model model) {
        if (userSession.getUsername() == null) return "redirect:/login";

        quizService.shuffleQuestions();
        model.addAttribute("questions", quizService.getQuestions());
        return "quiz";
    }

    @PostMapping("/submitQuiz")
    public String submitQuiz(@RequestParam Map<String, String> allAnswers, Model model) {
        Collection<String> values = allAnswers.values();
        List<String> answers = new ArrayList<>(values);
        System.out.println("Received answers: " + answers);

        int score = quizService.calculateScore(answers);
        System.out.println("Score: " + score);

        int totalQuestions = quizService.getQuestions().size();
        double percentage = ((double) score / totalQuestions) * 100;

        model.addAttribute("score", score);
        model.addAttribute("percentage", percentage);
        model.addAttribute("quizCompleted", true);
        model.addAttribute("totalQuestions", quizService.getQuestions().size());

        userSession.setPercentage(percentage);
        userSession.setQuizCompleted(true);

        return "result";
    }
}
