package org.judy.notice.mapper;

import java.util.List;

import org.judy.notice.domain.Notice;

public interface NoticeMapper {
	
	List<Notice> getList();
	
	Notice getOne(Integer nno);
	
	void insert(Notice vo);

}
