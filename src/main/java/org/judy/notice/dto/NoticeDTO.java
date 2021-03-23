package org.judy.notice.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NoticeDTO {
	
	private Integer nno;
	private String title;
	private String context;
	private String writer;
	private String img;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date regdate, updatedate;
	private Boolean show;

}
