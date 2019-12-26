package org.sweeter.application.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sweeter.application.model.dto.Question;
import org.sweeter.application.model.mapper.QAMapper;

@Service
public class QAServiceImpl implements QAService {
	@Autowired
	QAMapper qamapper;
	
	@Override
	public void write(Question question) {
		qamapper.writeQuestion(question);

	}

	@Override
	public void modify(Question question) {
		qamapper.updateQuestion(question);

	}

	@Override
	public void delete(int id) {
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

}
