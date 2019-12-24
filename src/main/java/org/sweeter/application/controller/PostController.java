package org.sweeter.application.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	public Map<String, List<Post>> PostList() {
		Map<String, List<Post>> map = new HashMap<String, List<Post>>();
		List<Post> ls = postService.getAllPosts();
		map.put("data", ls);

		return map;
	}

	@RequestMapping("/itnews/all")
	@ResponseBody
	public Map<String, List<Post>> ItnewsList() {
		Map<String, List<Post>> map = new HashMap<String, List<Post>>();
		List<Post> ls = postService.getAllItNews();
		map.put("data", ls);

		return map;
	}

	@RequestMapping("/posts/{category}/{page}/{count}")
	@ResponseBody
	public List<Post> postList(@PathVariable int category, @PathVariable int page, @PathVariable int count) {
		return postService.getPostList(category, page, count);
	}
	
	@RequestMapping("/itnews/{category}/{page}/{count}")
	@ResponseBody
	public List<Post> ItNewsList(@PathVariable int category, @PathVariable int page, @PathVariable int count){
		return postService.getItNewsList(category,page,count);
	}
	// 게시물 상세 보기
	@RequestMapping("/post/read/{id}")
	@ResponseBody
	public Post post(@PathVariable int id) {
		return postService.getPost(id);

	}
	@RequestMapping("/itnews/read/{id}")
	@ResponseBody
	public Post ItNews(@PathVariable int id) {
		return postService.getPost(id);
	}
	
	// 게시물 작성
	@PostMapping("/post/write")
	public String write(Post post) {
		postService.write(post);
		return "redirect:/post/list/2/1/10";
	}
	@PostMapping("/itnews/write")
	public String Itwrite(Post post) {
		postService.itWrite(post);
		return "redirect:/itnews/list/1/1/10";
	}

	// 게시물 수정
	@PostMapping("/post/modify")
	public ModelAndView postModify(Post post, HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		ModelAndView mav = new ModelAndView();
//		System.out.println(post.getWriter());
//		System.out.println(session.getAttribute("userId"));

		if (post.getWriter().equals(session.getAttribute("userId"))) {
			mav.addObject("post", post);
			mav.setViewName("/posts/modify");
			return mav;

		} else {

			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('글을 쓴 유저만 수정이 가능합니다.'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("/post/" + post.getId());
			return mav;
		}
	}
	@PostMapping("/posts/modify")
	public ModelAndView modify(Post post) {
		System.out.println(post.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/post/" + post.getId());
		postService.modify(post);

		return mav;
	}
	
	@PostMapping("/itnews/modify")
	public String ItModify(Post post) {
		System.out.println(post.getId());
		postService.modify(post);
		
		return "redirect:/itnews/" + post.getId();
	}

	// 게시물 삭제
	@GetMapping("/post/delete/{id}")
	public String delete(@PathVariable int id) {
		// DB에 게시물 정보 삭제
		postService.delete(id);
		// 게시물목록 이동
		return "redirect:/post/list/2/1/10";

	}
	@GetMapping("/itnews/delete/{id}")
	public String ItDelete(@PathVariable int id) {
		//DB에서 게시물 정보 삭제
		postService.delete(id);
		//게시물 목록 이동
		return "redirect:/itnews/list/1/1/10";
	}

	// 게시글 내용 조회
	@GetMapping("/post/{id}")
	public String read(@PathVariable int id) {
		return "posts/read";

	}
	@GetMapping("itnews/{id}")
	public String ItRead(@PathVariable int id) {
		return "itnews/read";
	}
	
}
