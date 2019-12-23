package org.sweeter.application.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.sweeter.application.model.dto.Comment;
import org.sweeter.application.model.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	CommentService commentService;

	@RequestMapping("/comment/{post}")
	@ResponseBody
	public List<Comment> commentList(@PathVariable int post) {
		return commentService.getCommentList(post);	
	}

	@RequestMapping("/comment/id/{id}")
	@ResponseBody
	public Comment comment(@PathVariable int id) {
		return commentService.getComment(id);

	}

	// 게시물 작성
	@PostMapping("/comment/write")
	public String write(Comment comment, HttpServletRequest req) {
		commentService.write(comment);
		return "redirect:/comment/list";

	}

	// 게시물 수정
	@PostMapping("/comment/modify")
	public String modify(Comment comment) {
		commentService.modify(comment);

		return "/comment/list";
	}

	// 게시물 삭제
	@PostMapping("/comment/delete/{id}")
	public String delete(@PathVariable String id) {
		// DB에 게시물 정보 삭제
		commentService.delete(id);
		// 게시물목록 이동
		return "/comment/list";

	}

	// 게시글 내용 조회
	@GetMapping("/comment/getComment")
	public ModelAndView read(int id) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/comment/read");
		mav.addObject("id", id);
		commentService.getComment(id);
		return mav;

	}

}
