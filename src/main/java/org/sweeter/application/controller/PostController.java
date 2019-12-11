package org.sweeter.application.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostController {
	@RequestMapping("/posts/{category}/{page}/{count}")
	public void post(){
		
	}
}
