package org.sweeter.application.model.dto;

import lombok.Data;


@Data
public class Jobs {
	
	private int id;
	private String title;
	private String writer;
	private String writeDate;
	private String modifyDate;
	private String salary;
	private String career;
	private String content;
}
