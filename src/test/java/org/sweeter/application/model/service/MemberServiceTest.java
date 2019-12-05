package org.sweeter.application.model.service;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.sweeter.application.model.dto.Member;

import lombok.extern.log4j.Log4j2;

@SpringBootTest
@Log4j2
public class MemberServiceTest {
	@Autowired
	MemberService userService;
	
	@Test
	void getAllTest() {
		List<Member> ls = userService.getAll();
		ls.forEach(user -> log.info(user));
		
		assertNotNull(ls);
	}
	
	@Test
	void loginTest(){
		Member user = new Member();
		user.setId("user1");
		user.setPw("pw");
		Member loggedInUser = userService.login(user);
		log.info(loggedInUser);
		assertNotNull(loggedInUser);
	}
}
