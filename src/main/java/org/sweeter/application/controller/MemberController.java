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

	/**
	 * checkUserInfo(String id, String pw) <br>
	 * 인수로 받은 아이디와 비밀번호를 가지고 있는 유저가 있는지 검색합니다.
	 * 
	 * @param id : 유저 아이디
	 * @param pw : 유저 비밀번호
	 * 
	 * @return 조건에 맞는 유저가 있다면 해당 유저의 정보가 담긴 Member 객체를 리턴 <br>
	 * 없다면 이름과 비밀번호가 빈 문자열인 Member 객체를 리턴
	 */
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
	
	/**
	 * login(Member member, HttpServletRequest req) <br>
	 * 입력받은 아이디와 비밀번호를 통해 로그인을 수행합니다.
	 * 
	 * @param member : 입력받은 아이디와 비밀번호가 담겨있는 Member 객체
	 * @param req : 로그인 요청시 자동으로 인수로 넘어가는 request 객체
	 * 
	 * @return 로그인 성공 시 세션에 유저 정보를 담은 후 메인 페이지로 리다이렉트 하는 ModelAndView 객체 <br>
	 * 로그인 실패 시 로그인 페이지를 유지하는 ModelAndView 객체
	 */
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
			mav.setViewName("redirect:/");
		}

		return mav;
	}
	
	/**
	 * logout(HttpSession session)<br>
	 * 세션을 해제해 로그아웃합니다.
	 * 
	 * @param session : 로그아웃 요청 시 자동으로 인수로 넘겨지는 세션
	 * 
	 * @return 메인페이지로 리다이렉트 하는 ModelAndView 객체
	 */
	@RequestMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        ModelAndView mv = new ModelAndView("redirect:/");
        return mv;
    }



	
	/**
	 * register(Member member)<br>
	 * 회원가입할 유저의 정보를 입력받아 DB에 저장합니다.
	 * 
	 * @param member : 회원가입할 유저의 정보가 담긴 Member 객체
	 * 
	 * @return 메인 페이지로 이동하는 ModelAndView 객체
	 */
	@PostMapping("/register")
	public ModelAndView register(Member member) {
		ModelAndView mav = new ModelAndView();
		//DB에 회훤가입한 유저 정보 저장 후 메인페이지로 이동
		log.info(member);
		memberService.register(member);
		mav.setViewName("redirect:/");
		
		return mav;
	}
	
	/**
	 * register(String id)<br>
	 * 입력받은 아이디가 DB에 존재하는지 확인합니다.
	 * 
	 * @param id : 존재하는지 확인할 아이디값
	 * @return 아이디 존재 여부를 HashMap 형식으로 리턴<br>
	 * 웹브라우저상에서는 json 형식으로 보여지며 형식은 다음과 같습니다.<br>
	 * { <br>
	 * result : true 또는 false <br>
	 * }
	 */
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
	public String modify(Member member, HttpServletRequest req) {
		memberService.modify(member);
		//세션 갱신
		Member updatedMember = memberService.checkId(member.getId());
		HttpSession session = req.getSession();
		session.setAttribute("user", updatedMember);
		
		return "members/modify";
	}
	
	//유저 정보관리 로직 - 탈퇴
	@GetMapping("/secession")
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