package com.example.demo.model;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

@Component
@SessionScope
public class UserSession {
    private String username;
    private double percentage;
    private boolean quizCompleted;

    // Getter and Setter for username
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    // Getter and Setter for quizCompleted
    public boolean getQuizCompleted() {
        return quizCompleted;
    }

    public void setQuizCompleted(boolean quizCompleted) {
        this.quizCompleted = quizCompleted;
    }

    // Getter and Setter for percentage (corrected name)
    public double getPercentage() {
        return percentage;
    }

    public void setPercentage(double percentage) {
        this.percentage = percentage;
    }

    public void reset() {
        this.username = null;
        this.quizCompleted = false;
        this.percentage = 0.0;
    }

}


