package org.sweeter.application.model.mapper;

import java.util.List;


import org.sweeter.application.model.dto.Question;

public interface QAMapper {

	public void writeQuestion(Question question);
	public void updateQuestion(Question question);
	public void deleteQuestion(int id);
	public List<Question> getQuestionList(int page, int count);
	public List<Question> getAllQuestion();
	public Question getQuestionById(int id);
	
}
