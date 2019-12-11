package org.sweeter.application.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

<<<<<<< HEAD
import org.apache.catalina.startup.UserConfig;
=======
>>>>>>> refs/remotes/upstream/master
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sweeter.application.model.dto.Member;
import org.sweeter.application.model.service.MemberService;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/members")
@Controller
@Log4j2
public class MemberController {
	@Autowired
	MemberService memberService;

	
<<<<<<< HEAD
	@PostMapping("/login")
	public ModelAndView login(Member member,HttpSession session) {
=======
	@PostMapping("/signin")
	public ModelAndView login(Member member, HttpServletRequest req) {
>>>>>>> refs/remotes/upstream/master
		ModelAndView mav = new ModelAndView();
		//아이디와 암호를 통해 유저 정보를 가져옴
		Member loginMember = memberService.login(member);
		log.info(loginMember);
		
		//가져온 정보가 null일 경우 로그인 실패 - 로그인 페이지로 리다이렉트
		if(loginMember == null) {
			mav.setViewName("/members/login");
		}else {
<<<<<<< HEAD
			//세션 설정
			session.setAttribute("user", loginMember);
			mav.setViewName("/");
=======
			//세션 설정 후 메인 페이지로 이동
			HttpSession session = req.getSession();
			session.setAttribute("user", loginMember);
			mav.setViewName("index");
>>>>>>> refs/remotes/upstream/master
		}
<<<<<<< HEAD
		
=======
>>>>>>> refs/remotes/upstream/master

		return mav;
	}
	
	
	
	@PostMapping("/register")
	public ModelAndView register(Member member) {
		ModelAndView mav = new ModelAndView();
		//DB에 회훤가입한 유저 정보 저장 후 메인페이지로 이동
		log.info(member);
		memberService.register(member);
		mav.setViewName("index");
		
		return mav;
	}
	
	@RequestMapping("/register/check/{id}")
	@ResponseBody
	public HashMap<String, Boolean> registerCheck(@PathVariable String id) {
		HashMap<String, Boolean> existResult = new HashMap<String, Boolean>();
		boolean isExist = memberService.registerCheck(id);
		existResult.put("result", isExist);
		return existResult;
	}
	
	
	

	
<<<<<<< HEAD
}
=======
}
>>>>>>> refs/remotes/upstream/master
