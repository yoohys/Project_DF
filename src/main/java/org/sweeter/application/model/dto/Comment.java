package org.sweeter.application.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Comment {
	
	private int id;
	private Member writer;
	private Date writeDate;
	private Date modifyDate;
	private String content;
	private Post post;
}
