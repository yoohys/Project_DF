package org.sweeter.application.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Answer {
	private int id;
	private String writer;
	private Date writeDate;
	private Date modifyDate;
	private String content;
	private int questionId;
	
}
