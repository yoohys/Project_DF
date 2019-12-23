package org.sweeter.application.model.dto;

import lombok.Data;

@Data
public class Answer {
	private int id;
	private String writer;
	private String writeDate;
	private String modifyDate;
	private String content;
	private int questionId;

}
