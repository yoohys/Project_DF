package org.sweeter.application.model.mapper;

import java.util.List;

import org.sweeter.application.model.dto.Member;

public interface MemberMapper {
	
	public void insertMember(Member member);
	public void updateMember(Member member);
	public void deleteMember(String id);
	
	public List<Member> getAllMembers();
	public Member getMemberById(String id);
	public Member getMemberByIdAndPw(String id, String pw);
	

	
}
