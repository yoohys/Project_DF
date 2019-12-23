package org.sweeter.application.model.service;

import java.util.List;

import org.sweeter.application.model.dto.Member;

public interface MemberService {

	void register(Member member);

	boolean registerCheck(String id);

	void modify(Member member);

	void delete(String id);

	Member login(Member user);

	Member checkId(String id);

	List<Member> getAll();

}
