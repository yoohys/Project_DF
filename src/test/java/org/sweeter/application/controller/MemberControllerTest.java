package org.sweeter.application.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;

import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mybatis.spring.boot.test.autoconfigure.AutoConfigureMybatis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.sweeter.application.model.service.MemberService;

@RunWith(SpringRunner.class)
@WebMvcTest(MemberController.class)
@AutoConfigureMybatis
public class MemberControllerTest {
	@Mock
	MemberService memberService;
	
	@Autowired
	MockMvc mvc;
	@Test
	void loginTest() throws Exception {
		mvc.perform(post("/members/login"));
	}
}
