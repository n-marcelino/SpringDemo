package com.example.demo.service;

import com.example.demo.model.Question;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@Service
public class QuizService {

    private List<Question> questions;

    public QuizService() {
        questions = new ArrayList<>();
        questions.add(new Question("What country has the highest life expectancy?",
                new String[]{"Philippines", "Hong Kong", "USA", "Singapore"}, "Hong Kong"));
        questions.add(new Question("How many elements are in the periodic table?",
                new String[]{"119", "118", "117", "120"}, "118"));
        questions.add(new Question("Who was the Ancient Greek God of the Sun?",
                new String[]{"Athena", "Hades", "Apollo", "Venus"}, "Apollo"));
        questions.add(new Question("What country drinks the most coffee per capita?",
                new String[]{"Russia", "China", "USA", "Finland"}, "Finland"));
        questions.add(new Question("What Renaissance artist is buried in Rome's Pantheon?",
                new String[]{"Donatello", "Leonardo", "Michelangelo", "Raphael"}, "Raphael"));
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public int calculateScore(List<String> userAnswers) {
        int score = 0;

        for (int i = 0; i < questions.size(); i++) {
            Question question = questions.get(i);
            String correctAnswer = question.getCorrectAnswer();
            String userAnswer = userAnswers.get(i);

            if (userAnswer != null && userAnswer.equals(correctAnswer)) {
                score++;
            }
        }

        return score;
    }

    public void shuffleQuestions() {
        Collections.shuffle(questions); // Shuffle questions
        for (Question question : questions) {
            List<String> choicesList = Arrays.asList(question.getChoices());
            Collections.shuffle(choicesList);
            question.setChoices(choicesList.toArray(new String[0])); // Convert back to array and set
        }
    }
}
