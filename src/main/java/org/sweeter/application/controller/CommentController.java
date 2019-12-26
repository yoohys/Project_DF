package org.sweeter.application.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import org.sweeter.application.model.dto.Comment;
import org.sweeter.application.model.dto.Post;
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
	public void write(Comment comment,HttpServletRequest req,HttpServletResponse res) throws IOException {
		commentService.write(comment);
		HttpSession session = req.getSession();
		PrintWriter out = res.getWriter();
		res.setContentType("text/html; charset=utf-8");
		out.println("<script>");
		out.println("history.go(-1);");
		out.println("</script>");
		out.flush();


	}

	// 게시물 수정
	@PostMapping("/comment/modify")
	public String modify(Comment comment) {
		commentService.modify(comment);

		return "/comment/list";
	}

	// 게시물 삭제
	@GetMapping("/comment/delete/{id}")
	public ModelAndView cmdelete(@PathVariable int id, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// DB에 게시물 정보 삭제
		
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		PrintWriter out = response.getWriter();
		response.setContentType("text/html; charset=utf-8");

		if (commentService.getComment(id).getWriter().equals(session.getAttribute("userId"))) {
			commentService.delete(id);
			out.println("<script>");
			out.println("alert('comment deleted!')");
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
			mav.setViewName("/post/" + comment(id).getPost());
			return mav;
		}

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
