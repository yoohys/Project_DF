package org.sweeter.application.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.sweeter.application.model.dto.Post;

@Controller
public class PageController {
	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@GetMapping("/members/login")
	public String login() {
		return "members/login";
	}

	@GetMapping("/members/register")
	public String register() {
		return "members/register";
	}

	@GetMapping("/members/modify")
	public String info() {
		return "members/modify";
	}

	@GetMapping("/post/list/{category}/{page}/{count}")
	public String postList() {
		return "posts/list";
	}

	@GetMapping("/news/list/{category}/{page}/{count}")
	public String newsList() {
		return "news/list";
	}

	@GetMapping("/post/write")
	public String postWrite() {
		return "posts/write";

	}

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

	@GetMapping("/post/read")
	public String postRead() {
		return "posts/read";
	}

}
