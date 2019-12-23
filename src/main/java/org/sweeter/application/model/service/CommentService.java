package org.sweeter.application.model.service;

import java.util.List;

import org.sweeter.application.model.dto.Comment;
import org.sweeter.application.model.dto.Post;

public interface CommentService {

	void write(Comment comment);

	void modify(Comment comment);

	void delete(String id);

	List<Comment> getCommentList(int post);

	Comment getComment(int id);

}
