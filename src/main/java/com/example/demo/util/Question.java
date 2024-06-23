package com.example.demo.util;

public class Question {
	private String question;
	private String[] choices;

	public Question(String question, String[] choices) {
		this.question = question;
		this.choices = choices;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String[] getChoices() {
		return choices;
	}

	public void setChoices(String[] choices) {
		this.choices = choices;
	}
}