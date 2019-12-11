package org.sweeter.application.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Post {
	private Member id;
	private String title;
	private Member writer;
	private Date writeDate;
	private Date modifyDate;
	private String content;
	private int category;
}
