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
import org.sweeter.application.model.dto.Question;
import org.sweeter.application.model.service.QAService;

@Controller
public class QuestionController {
	@Autowired
	QAService qaservice;

	@RequestMapping("/question/all")
	@ResponseBody
	public Map<String, List<Question>> QuestionList() {
		Map<String, List<Question>> map = new HashMap<String, List<Question>>();
		List<Question> ls = qaservice.getAllQuestions();
		map.put("data", ls);

		return map;
	}

	@RequestMapping("/question/{page}/{count}")
	@ResponseBody
	public List<Question> QuestionList(@PathVariable int page, @PathVariable int count) {
		return qaservice.getQuestionList(page, count);
	}

	// 게시물 상세 보기
	@RequestMapping("/question/read/{id}")
	@ResponseBody
	public Question question(@PathVariable int id) {
		return qaservice.getQuestion(id);
	}

	// 게시물 작성
	@PostMapping("/question/write")
	public String write(Question question) {
		qaservice.write(question);
		return "redirect:/questions/list/1/10";
	}

	// 게시물 수정
	@PostMapping("/question/modify")
	public ModelAndView questionModify(Question question, HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		HttpSession session = req.getSession();
		ModelAndView mav = new ModelAndView();

		if (question.getWriter().equals(session.getAttribute("userId"))) {
			mav.addObject("question", question);
			mav.setViewName("/questions/modify");
			return mav;

		} else {

			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('글을 쓴 유저만 수정이 가능합니다.'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("/questions/" + question.getId());
			return mav;
		}
	}

	@PostMapping("/questions/modify")
	public ModelAndView modify(Question question) {
		System.out.println(question.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/question/" + question.getId());
		qaservice.modify(question);

		return mav;
	}

	@GetMapping("/question/delete/{id}")
	public String delete(@PathVariable int id) {
		// DB에 게시물 정보 삭제
		qaservice.delete(id);
		// 게시물 목록 이동
		return "redirect:/questions/list/1/10";
	}

	@GetMapping("/question/{id}")
	public String read(@PathVariable int id) {
		return "questions/read";
	}

}
