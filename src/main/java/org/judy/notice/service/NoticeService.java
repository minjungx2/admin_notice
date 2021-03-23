package org.judy.notice.service;

import java.util.List;

import org.judy.notice.domain.Notice;
import org.judy.notice.dto.NoticeDTO;

public interface NoticeService {

	List<NoticeDTO> getList();
	
	NoticeDTO getOne(Integer nno);
	
	void insert(NoticeDTO dto);
	
	default NoticeDTO toDTO(Notice vo) {
		
		NoticeDTO dto = new NoticeDTO();
		
		dto.setNno(vo.getNno());
		dto.setTitle(vo.getTitle());
		dto.setContext(vo.getContext());
		dto.setWriter(vo.getWriter());
		dto.setImg(vo.getImg());
		dto.setRegdate(vo.getRegdate());
		dto.setUpdatedate(vo.getUpdatedate());
		dto.setShow(vo.getShow());
		
		return dto;
	}
	
	
	default Notice toDomain(NoticeDTO dto) {
		
		Notice vo = Notice.builder()
				.nno(dto.getNno())
				.title(dto.getTitle())
				.context(dto.getContext())
				.writer(dto.getWriter())
				.img(dto.getImg())
				.regdate(dto.getRegdate())
				.updatedate(dto.getUpdatedate())
				.show(dto.getShow())
				.build();
		
		return vo;
		
		
	}
	
}
