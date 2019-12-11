package org.sweeter.application.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Answer {
	private int id;
	private Member writer;
	private Date writeDate;
	private Date modifyDate;
	private String content;
	private Question questionId;
	
}
