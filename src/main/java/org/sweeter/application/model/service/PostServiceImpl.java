package org.sweeter.application.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.sweeter.application.model.dto.Post;
import org.sweeter.application.model.mapper.PostMapper;

public class PostServiceImpl implements PostService{
	@Autowired 
	PostMapper postMapper;
	
	@Override
	public List<Post> getPostList(int category, int page, int count) {
		return postMapper.getPostList(category, page, count);
	}
	
}
