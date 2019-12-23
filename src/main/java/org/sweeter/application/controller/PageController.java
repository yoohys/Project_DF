package org.sweeter.application.controller;

import javax.servlet.http.HttpServletRequest;
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

	@GetMapping("/post/write")
	public String postWrite() {
		return "posts/write";

	}

	@PostMapping("/post/modify")
	public ModelAndView postModify(Post post, HttpServletRequest req) {
		HttpSession session = req.getSession();
		ModelAndView mav = new ModelAndView();
		
		if (post.getWriter() != session.getAttribute("userId")) {
			mav.setViewName("post/list/2/1/10");
			return mav;
		} else {
			mav.addObject("post", post);
			mav.setViewName("posts/modify");
			return mav;
		}
	}

	@GetMapping("/post/read")
	public String postRead() {
		return "posts/read";
	}

}
