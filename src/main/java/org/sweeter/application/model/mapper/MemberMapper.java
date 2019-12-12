package org.sweeter.application.model.mapper;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.sweeter.application.model.dto.Member;

public interface MemberMapper {
	public void insertMember(Member member);
	
	public List<Member> getAllMembers();
	public Member getMemberById(String id);
	public Member getMemberByIdAndPw(String id, String pw);
	
	public void updateMember(Member member);
	public void deleteMember(String id);
	
}
