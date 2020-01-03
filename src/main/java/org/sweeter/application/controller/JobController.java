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
import org.sweeter.application.model.dto.Jobs;
import org.sweeter.application.model.service.JobService;

@Controller
public class JobController {
	@Autowired
	JobService jobService;


	@RequestMapping("/job/all")
	@ResponseBody
	public Map<String, List<Jobs>> JobList() {
		Map<String, List<Jobs>> map = new HashMap<String, List<Jobs>>();
		List<Jobs> ls = jobService.getAllJobs();
		map.put("data", ls);

		return map;
	}

	// Job List 보기
	@RequestMapping("/job/{page}/{count}")
	@ResponseBody
	public List<Jobs> JobList(@PathVariable int page, @PathVariable int count) {
		return jobService.getJobsList(page, count);
	}

	// Jobs 상세 보기
	@RequestMapping("/job/read/{id}")
	@ResponseBody
	public Jobs jobs(@PathVariable int id) {
		return jobService.getJobs(id);
	}

	// Jobs 작성
	@PostMapping("/job/write")
	public String write(Jobs jobs) {
		jobService.write(jobs);
		return "redirect:/jobs/1/5";
	}

	// Jobs 수정
	@PostMapping("/job/modify")
	public ModelAndView jobModify(Jobs jobs, HttpServletRequest req, HttpServletResponse res)
			throws IOException {
		HttpSession session = req.getSession();
		ModelAndView mav = new ModelAndView();

		if (jobs.getWriter().equals(session.getAttribute("userId"))) {
			mav.addObject("jobs", jobs);
			mav.setViewName("/jobs/modify");
			jobService.modify(jobs);
			return mav;

		} else {

			res.setContentType("text/html; charset=UTF-8");
			PrintWriter out = res.getWriter();
			out.println("<script>alert('글을 쓴 유저만 수정이 가능합니다.'); history.go(-1);</script>");
			out.flush();
			mav.setViewName("/jobs/" + jobs.getId());
			return mav;
		}
	}

	@PostMapping("/jobs/modify")
	public ModelAndView modify(Jobs jobs) {
		System.out.println(jobs.getId());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/jobs/" + jobs.getId());
		jobService.modify(jobs);

		return mav;
	}

	@GetMapping("/job/delete/{id}")
	public String delete(@PathVariable int id) {
		// DB에 게시물 정보 삭제
		jobService.delete(id);
		// 게시물 목록 이동
		return "redirect:/jobs/1/5";
	}

	@GetMapping("/job/{id}")
	public String read(@PathVariable int id) {
		return "jobs/read";
	}


}
