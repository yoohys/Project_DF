package org.sweeter.application.model.service;

import java.util.List;

import org.sweeter.application.model.dto.Post;

public interface PostService {
	List<Post> getPostList(int category, int page, int count);
	void write(Post post);
	void modify(Post post);
	void delete(String id);
	Post getPost(int id);
}
