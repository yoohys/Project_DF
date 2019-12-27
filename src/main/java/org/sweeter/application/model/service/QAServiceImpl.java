package org.sweeter.application.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sweeter.application.model.dto.Answer;
import org.sweeter.application.model.dto.Question;
import org.sweeter.application.model.mapper.QAMapper;

@Service
public class QAServiceImpl implements QAService {
	@Autowired
	QAMapper qamapper;

	// Question 부분
	@Override
	public void write(Question question) {
		qamapper.writeQuestion(question);

	}

	@Override
	public void modify(Question question) {
		qamapper.updateQuestion(question);

	}

	@Override
	public void deleteQ(int id) {
		qamapper.deleteQuestion(id);

	}

	@Override
	public Question getQuestion(int id) {
		return qamapper.getQuestionById(id);
	}

	@Override
	public List<Question> getAllQuestions() {
		return qamapper.getAllQuestion();
	}

	@Override
	public List<Question> getQuestionList(int page, int count) {
		return qamapper.getQuestionList(page, count);
	}

	// Answer 부분
	@Override
	public void write(Answer answer) {
		qamapper.writeAnswer(answer);

	}

	@Override
	public void modify(Answer answer) {
		qamapper.updateAnswer(answer);

	}

	@Override
	public void deleteA(int id) {
		qamapper.deleteAnswer(id);

	}

	@Override
	public List<Answer> getAnswerList(int question) {
		return qamapper.getAllAnswerByQuestion(question);
	}

	@Override
	public Answer getAnswer(int id) {
		return qamapper.getAnswerById(id);

	}
}
