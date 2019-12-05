package org.sweeter.application.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.sweeter.application.model.dto.Member;
import org.sweeter.application.model.service.MemberService;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/members")
@Controller
@Log4j2
public class MemberController {
	@Autowired
	MemberService memberService;

	
	@PostMapping("/login")
	public String login(Member user) {
		Member logInUser = memberService.login(user);
		log.info(logInUser);
		
		
		return "index";
	}
	
	@PostMapping("/register")
	public void register(Member member) {
		log.info(member);
		memberService.register(member);
	}
}
