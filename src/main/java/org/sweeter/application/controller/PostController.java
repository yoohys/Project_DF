package org.sweeter.application.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sweeter.application.model.dto.Post;
import org.sweeter.application.model.service.PostService;

@Controller
public class PostController {
	@Autowired
	PostService postService;
	
	
	@RequestMapping("/posts/{category}/{page}/{count}")
	@ResponseBody
	public List<Post> post(int category, int page, int count){
		return postService.getPostList(category, page, count);
	}
	
	@PostMapping("/post/create")
	public String create(Post post) {
		postService.create(post);
		int category = post.getCategory();
		
		return "/posts"+category+"/1/10";
	}
}
