package org.sweeter.application.model.service;

import java.util.List;

import org.sweeter.application.model.dto.Member;

public interface MemberService {
	List<Member> getAll();
	Member login(Member user);
	void register(Member member);
	boolean registerCheck(String id);
	void modify(Member member);
	void delete(String id);
}
