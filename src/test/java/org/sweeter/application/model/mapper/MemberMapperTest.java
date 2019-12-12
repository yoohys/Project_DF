package org.sweeter.application.model.mapper;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.sweeter.application.model.dto.Member;

import lombok.extern.log4j.Log4j2;

@SpringBootTest
@Log4j2
public class MemberMapperTest {
	@Autowired
	MemberMapper mapper;
	
//	@Test
//	void testGetAllUsers(){
//		List<Member> ls = mapper.getAllMembers();
//		ls.forEach(user -> log.info(user));
//		assertNotNull(ls);
//	}
//	
//	@Test
//	void testGetUserById() {
//		Member user = mapper.getMemberById("user1");
//		log.info(user);
//		assertNotNull(user);
//	}
//	
//	@Test
//	void testGetUserByIdAndPw() {
//		Member user = mapper.getMemberByIdAndPw("user2", "pw");
//		int[] arr = {};
//		log.info(user);
//		assertNotNull(user);
//	}
//	
//	@Test
//	void insertMemberTest() {
//		Member member = new Member();
//		member.setId("test");
//		member.setPw("test");
//		member.setName("test");
//		member.setEmail("test");
//		
//		mapper.insertMember(member);
//		List<Member> ls = mapper.getAllMembers();
//		ls.forEach(mem -> log.info(mem));
//	}
	
	@Test
	void updateMemberTest() {
		Member member = mapper.getMemberById("user1");
		member.setName("HelloWorld");
		
		mapper.updateMember(member);
		member = mapper.getMemberById("user1");
		log.info(member);
	}
	
	@Test
	void deleteMemberTest() {
		String id= "user1";
		mapper.deleteMember(id);
		
		log.info(mapper.getAllMembers());
	}
}
