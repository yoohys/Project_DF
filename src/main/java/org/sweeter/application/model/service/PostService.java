package org.sweeter.application.model.service;

import java.util.List;

import org.sweeter.application.model.dto.Post;

public interface PostService {

	void write(Post post);

	void modify(Post post);

	void delete(int id);

	Post getPost(int id);

	List<Post> getAllPosts();

	List<Post> getPostList(int category, int page, int count);
	
	List<Post> getAllItNews();
	
	List<Post> getItNewsList(int category, int page, int count);
}
