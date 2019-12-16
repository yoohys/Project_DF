package org.sweeter.application.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sweeter.application.model.dto.Member;
import org.sweeter.application.model.dto.Post;
import org.sweeter.application.model.service.PostService;

@Controller
public class PostController {
	@Autowired
	PostService postService;
	
	
	@RequestMapping("/posts/{category}/{page}/{count}")
	@ResponseBody
	public List<Post> post(@PathVariable int category, @PathVariable int page,@PathVariable int count){
		return postService.getPostList(category, page, count);
	}

	//게시물 작성
	@PostMapping("/post/write")
	public ModelAndView create(Post post) {
		ModelAndView mav = new ModelAndView();
		postService.create(post);
		int category = post.getCategory();
		mav.setViewName("/posts/"+category+"/1/10");
		return mav;
	}
	
	//게시물 수정
	@PostMapping("/post/modify")
	public String modify(Post post) {
		postService.modify(post);
		
		return "/post/list";

	}
	
	//게시물 삭제
	@PostMapping("/post/delete")
	public String delete(@PathVariable String id) {
		//DB에 게시물 정보 삭제
		postService.delete(id);
		//게시물목록 이동
		return "/post/list";
		
	}
}
