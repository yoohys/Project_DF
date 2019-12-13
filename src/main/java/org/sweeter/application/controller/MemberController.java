package org.sweeter.application.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
	//로그인 로직 - 아이디 및 비밀번호 검증
	@GetMapping("/signin/{id}/{pw}")
	@ResponseBody
	public Member checkUserInfo(@PathVariable String id, @PathVariable String pw) {
		Member member = new Member();
		member.setId(id);
		member.setPw(pw);
		
		Member loginInfo = memberService.login(member);
		if(loginInfo == null) {
			Member failMember = new Member();
			failMember.setId("");
			failMember.setPw("");
			return failMember;
		}
		return loginInfo;
	}
	
	//로그인 로직 - 세션에 유저 정보 저장
	@PostMapping("/signin")
	public ModelAndView login(Member member, HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		//아이디와 암호를 통해 유저 정보를 가져옴
		Member loginMember = memberService.login(member);
		log.info(loginMember);
		
		//가져온 정보가 null일 경우 로그인 실패 - 로그인 페이지로 리다이렉트
		if(loginMember == null) {
			mav.setViewName("/members/login");
		}else {
			//세션 설정 후 메인 페이지로 이동
			HttpSession session = req.getSession();
			session.setAttribute("user", loginMember);
			mav.setViewName("index");
		}

		return mav;
	}
	
	//로그아웃 로직
	@RequestMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
    }



	
	//회원가입 로직 - DB에 유저 정보 저장
	@PostMapping("/register")
	public ModelAndView register(Member member) {
		ModelAndView mav = new ModelAndView();
		//DB에 회훤가입한 유저 정보 저장 후 메인페이지로 이동
		log.info(member);
		memberService.register(member);
		mav.setViewName("index");
		
		return mav;
	}
	
	//회원가입 로직 - 아이디 중복 체크
	@RequestMapping("/register/check/{id}")
	@ResponseBody
	public HashMap<String, Boolean> registerCheck(@PathVariable String id) {
		HashMap<String, Boolean> existResult = new HashMap<String, Boolean>();
		boolean isExist = memberService.registerCheck(id);
		existResult.put("result", isExist);
		return existResult;
	}
	
	//유저 정보관리 로직 - 회원 정보 수정
	@PostMapping("/modify")
	public String modify(Member member) {
		memberService.modify(member);
		
		return "members/modify";
	}
	
	//유저 정보관리 로직 - 탈퇴
	@PostMapping("/secession")
	public String secession(String id, HttpServletRequest req) {
		//로그아웃 수행(세션 해제)
		HttpSession session = req.getSession();
		session.removeAttribute("user");
		
		//DB에 유저 정보 삭제
		memberService.delete(id);
		
		//메인페이지 이동
		return "/index";
	}
	
}