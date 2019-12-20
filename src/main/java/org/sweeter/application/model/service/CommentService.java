package org.sweeter.application.model.service;

import java.util.List;

import org.sweeter.application.model.dto.Comment;

public interface CommentService {
	List<Comment> getCommentList(int category, int page, int count);
	void write(Comment comment);
	void modify(Comment comment);
	void delete(String id);
	Comment getComment(int id);
	
}
