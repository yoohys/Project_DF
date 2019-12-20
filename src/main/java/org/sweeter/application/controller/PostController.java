package org.sweeter.application.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sweeter.application.model.dto.Post;
import org.sweeter.application.model.service.PostService;

@Controller
public class PostController {
	@Autowired
	PostService postService;

	@RequestMapping("/posts/all")
	@ResponseBody
	public Map<String, List<Post>> testPostList() {
		Map<String, List<Post>> map = new HashMap<String, List<Post>>();
		List<Post> ls = postService.getAllPosts();
		map.put("data", ls);

		return map;
	}

	@RequestMapping("/posts/{category}/{page}/{count}")
	@ResponseBody
	public List<Post> postList(@PathVariable int category, @PathVariable int page, @PathVariable int count) {
		return postService.getPostList(category, page, count);
	}

	@RequestMapping("/post/read/{id}")
	@ResponseBody
	public Post post(@PathVariable int id) {
		return postService.getPost(id);

	}

	// 게시물 작성
	@PostMapping("/post/write")
	public String write(Post post, HttpServletRequest req) {
		postService.write(post);
		return "redirect:/post/list/2/1/10";

	}

	// 게시물 수정
	@PostMapping("/posts/modify")
	public String modify(Post post) {
		postService.modify(post);
		return "redirect:/post/modify";
	}

	// 게시물 삭제
	@PostMapping("/post/delete")
	public String delete(@PathVariable String id) {
		// DB에 게시물 정보 삭제
		postService.delete(id);
		// 게시물목록 이동
		return "/post/list/2/1/10";

	}

	// 게시글 내용 조회
	@GetMapping("/post/{id}")
	public String read(@PathVariable int id) {
		return "posts/read";

	}

}
