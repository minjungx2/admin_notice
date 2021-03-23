package org.judy.notice.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatTypes;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	private Integer nno;
	private String title;
	private String context;
	private String writer;
	private String img;
	private Date regdate, updatedate;
	private Boolean show;

}
