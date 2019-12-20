package org.sweeter.application.model.mapper;

import java.util.List;

import org.sweeter.application.model.dto.Post;

public interface PostMapper {
	
	public void writePost(Post post);
	public Post updatePost(Post post);
	public Post deletePost(int id);
	
	public List<Post> getPostList(int category, int page, int count);
	public List<Post> getAllPost();	
	public Post getPostById(int id);
	
	

}
