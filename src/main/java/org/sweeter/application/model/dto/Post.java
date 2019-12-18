package org.sweeter.application.model.dto;

import java.sql.Timestamp;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
public class Post {
	private int id;
	private String title;
	private String writer;
	private String writeDate;
	private String modifyDate;
	private String content;
	private int category;
	
}
