package org.sweeter.application.model.mapper;

import java.util.List;

import org.sweeter.application.model.dto.Question;
import org.sweeter.application.model.dto.Answer;

public interface QAMapper {
	
	//Question 부분
	public void writeQuestion(Question question);
	public void updateQuestion(Question question);
	public void deleteQuestion(int id);
	public List<Question> getQuestionList(int page, int count);
	public List<Question> getAllQuestion();
	public Question getQuestionById(int id);
	
	//Answer 부분
	public void writeAnswer(Answer answer);
	public void updateAnswer(Answer answer);
	public void deleteAnswer(int id);
	public List<Answer> getAllAnswerByQuestion(int question);
	public List<Answer> getAllAnswer();	
	public Answer getAnswerById(int id);

}
