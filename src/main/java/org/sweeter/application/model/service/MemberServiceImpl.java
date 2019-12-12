package org.sweeter.application.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sweeter.application.model.dto.Member;
import org.sweeter.application.model.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberMapper memberMapper;
	
	@Override
	public List<Member> getAll() {
		return memberMapper.getAllMembers();
	}

	@Override
	public Member login(Member member) {
		String id = member.getId();
		String pw = member.getPw();
		
		Member loggedInUser = memberMapper.getMemberByIdAndPw(id, pw);
		return loggedInUser;
	}

	@Override
	public void register(Member member) {
		memberMapper.insertMember(member);
	}
	
	@Override
	public boolean registerCheck(String id) {
		Member member = memberMapper.getMemberById(id);
		boolean result = true;
		
		if(member == null) {
			result = false;
		}
		
		return result;
	}
	
	@Override
	public void modify(Member member) {
		memberMapper.updateMember(member);
		
	}
	
	@Override
	public void delete(String id) {
		memberMapper.deleteMember(id);	
	}
}
