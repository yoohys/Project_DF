package org.sweeter.application.model.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sweeter.application.model.dto.Comment;
import org.sweeter.application.model.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService{
	@Autowired 
	CommentMapper commentMapper;
	
	@Override
	public List<Comment> getCommentList(int category, int page, int count) {
	
		return commentMapper.getAllComment();
	}


	@Override
	public Comment getComment(int id) {
		return commentMapper.getCommentById(id);
	}
	
	

	
	@Override
	public void write(Comment comment) {
		commentMapper.writeComment(comment);
	}
	
	@Override
	public void modify(Comment comment) {
		commentMapper.updateComment(comment);
		
	}

	@Override
	public void delete(String id) {
		commentMapper.deleteComment(id);
		
	}
}
