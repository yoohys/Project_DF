package org.sweeter.application.model.mapper;

import java.util.List;

import org.sweeter.application.model.dto.Comment;


public interface CommentMapper {
	public List<Comment> getCommentList(int category, int page, int count);
	public List<Comment> getAllComment();	
	public Comment getCommentById(int id);
	public Comment updateComment(Comment comment);
	public Comment deleteComment(String id);
	public void writeComment(Comment comment);

}
