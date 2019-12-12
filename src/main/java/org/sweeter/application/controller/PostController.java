package org.sweeter.application.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.sweeter.application.model.dto.Post;

@Controller
public class PostController {
	@RequestMapping("/posts/{category}/{page}/{count}")
	@ResponseBody
	public List<Post> post(){
		
		
		return null;
	}
}
