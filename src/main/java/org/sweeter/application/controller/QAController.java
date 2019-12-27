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
import org.sweeter.application.model.dto.Answer;
import org.sweeter.application.model.dto.Question;
import org.sweeter.application.model.service.QAService;

@Controller
public class QAController {
	@Autowired
	QAService qaService;

	// Question 부분

	@RequestMapping("/question/all")
	@ResponseBody
	public Map<String, List<Question>> QuestionList() {
		Map<String, List<Question>> map = new HashMap<String, List<Question>>();
		List<Question> ls = qaService.getAllQuestions();
		map.put("data", ls);

		return map;
	}

	// Question List 보기
	@RequestMapping("/question/{page}/{count}")
	@ResponseBody
	public List<Question> QuestionList(@PathVariable int page, @PathVariable int count) {
		return qaService.getQuestionList(page, count);
	}

	// Question 상세 보기
	@RequestMapping("/question/read/{id}")
	@ResponseBody
	public Question question(@PathVariable int id) {
		return qaService.getQuestion(id);
	}

	// Question 작성
	@PostMapping("/question/write")
	public String write(Question question) {
		qaService.write(question);
		return "redirect:/questions/1/5";
	}

	// Question 수정
	@PostMapping("/question/modify")
	public ModelAndView questionModify(Question question, HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		HttpSession session = req.getSession();
		ModelAndView mav = new ModelAndView();

		if (question.getWriter().equals(session.getAttribute("userId"))) {
			mav.addObject("question", question);
			mav.setViewName("/questions/modify");
			qaService.modify(question);
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
		mav.setViewName("redirect:/questions/" + question.getId());
		qaService.modify(question);

		return mav;
	}

	@GetMapping("/question/delete/{id}")
	public String delete(@PathVariable int id) {
		// DB에 게시물 정보 삭제
		qaService.deleteQ(id);
		// 게시물 목록 이동
		return "redirect:/questions/1/5";
	}

	@GetMapping("/question/{id}")
	public String read(@PathVariable int id) {
		return "questions/read";
	}

	// Answer 부분

	@RequestMapping("/answer/{question}")
	@ResponseBody
	public List<Answer> answerList(@PathVariable int question) {
		return qaService.getAnswerList(question);
	}

	// Answer id 별로 보기

	@RequestMapping("/answer/id/{id}")
	@ResponseBody
	public Answer answer(@PathVariable int id) {
		return qaService.getAnswer(id);

	}

	// Answer 작성
	@PostMapping("/answer/write")
	public void write(Answer answer, HttpServletResponse res) throws IOException {
		qaService.write(answer);
		PrintWriter out = res.getWriter();
		res.setContentType("text/html; charset=utf-8");
		out.println("<script>");
		out.println("history.go(-1);");
		out.println("</script>");
		out.flush();

	}

	// Answer 수정
	@PostMapping("/answer/modify")
	public String modify(Answer answer) {
		qaService.modify(answer);

		return "/question/list";
	}

	// Answer 삭제
	@GetMapping("/answer/delete/{id}")
	public ModelAndView andelete(@PathVariable int id, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// DB에 게시물 정보 삭제
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");

		if (qaService.getAnswer(id).getWriter().equals(session.getAttribute("userId"))) {
			qaService.deleteA(id);
			out.println("<script>");
			out.println("alert('Answer deleted!')");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();
			mav.setViewName("/post/read");
			return mav;
		}

		else {
			out.println("<script>");
			out.println("alert('you are not writer')");
			out.println("history.go(-1);");
			out.println("</script>");
			out.flush();
			mav.setViewName("/post/" + answer(id).getQuestion());
			return mav;
		}

	}

	// Answer 조회
	@GetMapping("/answer/getAnswer")
	public ModelAndView readA(int id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/answer/read");
		mav.addObject("id", id);
		qaService.getAnswer(id);
		return mav;

	}

}
