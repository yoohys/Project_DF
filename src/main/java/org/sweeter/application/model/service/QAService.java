package org.sweeter.application.model.service;

import java.util.List;

import org.sweeter.application.model.dto.Answer;
import org.sweeter.application.model.dto.Question;

public interface QAService {
	// Question 부분

	void write(Question question);

	void modify(Question question);

	void deleteQ(int id);

	Question getQuestion(int id);

	List<Question> getAllQuestions();

	List<Question> getQuestionList(int page, int count);

	// Answer 부분

	void write(Answer answer);

	void modify(Answer answer);

	void deleteA(int id);

	List<Answer> getAnswerList(int question);

	Answer getAnswer(int id);

}
