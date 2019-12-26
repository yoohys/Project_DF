package org.sweeter.application.model.service;

import java.util.List;

import org.sweeter.application.model.dto.Question;



public interface QAService {
	//작성
	void write(Question question);
	//수정
	void modify(Question question);
	//삭제
	void delete(int id);
	
	Question getQuestion(int id);

	List<Question> getAllQuestions();

	List<Question> getQuestionList(int page, int count);
	
}
