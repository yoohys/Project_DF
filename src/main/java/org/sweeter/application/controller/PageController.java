package org.sweeter.application.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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

	@GetMapping("/itnews/list/{category}/{page}/{count}")
	public String itnewsList() {
		return "itnews/list";
	}

	@GetMapping("/post/write")
	public String postWrite() {
		return "posts/write";

	}

	@GetMapping("itnews/write")
	public String itnewsWrite() {
		return "itnews/write";
	}

	@GetMapping("/post/read")
	public String postRead() {
		return "posts/read";
	}

	@GetMapping("/itnews/read")
	public String itnewsRead() {
		return "itnews/read";
	}

	@GetMapping("/questions/{page}/{count}")
	public String questionList() {
		return "questions/list";
	}

	@GetMapping("/question/write")
	public String questionWrite() {
		return "questions/write";
	}

	@GetMapping("/question/read")
	public String questionRead() {
		return "questions/read";
	}

	@GetMapping("/job/{page}/{count}")
	public String jobList() {
		return "jobs/list";
	}

	@GetMapping("/job/write")
	public String jobWrite() {
		return "jobs/write";
	}

	@GetMapping("/job/read")
	public String jobRead() {
		return "jobs/read";
	}
}
