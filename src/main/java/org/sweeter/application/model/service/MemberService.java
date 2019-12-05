package org.sweeter.application.model.service;

import java.util.List;

import org.sweeter.application.model.dto.Member;

public interface MemberService {
	List<Member> getAll();
	Member login(Member user);
	void register(Member member);
}
