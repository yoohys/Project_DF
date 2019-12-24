package org.sweeter.application.model.mapper;

import java.util.List;

import org.sweeter.application.model.dto.Comment;
import org.sweeter.application.model.dto.Post;

public interface CommentMapper {
	
	public void writeComment(Comment comment);
	public void updateComment(Comment comment);
	public void deleteComment(int id);
	
	public List<Comment> getAllCommentByPost(int post);
	public List<Comment> getAllComment();	
	public Comment getCommentById(int id);


}
