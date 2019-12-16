package org.sweeter.application.model.dto;

import java.sql.Timestamp;
import java.util.Date;

import lombok.Data;

@Data
public class Answer {
	private int id;
	private String writer;
	private Timestamp writeDate;
	private Timestamp modifyDate;
	private String content;
	private int questionId;
}
