package org.sweeter.application.model.dto;

import lombok.Data;

@Data
public class Member {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String tel;
}
