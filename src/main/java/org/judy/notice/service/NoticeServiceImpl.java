package org.judy.notice.service;

import java.util.List;
import java.util.stream.Collectors;

import org.judy.notice.dto.NoticeDTO;
import org.judy.notice.mapper.NoticeMapper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private final NoticeMapper mapper;
	
	@Override
	public List<NoticeDTO> getList() {

		log.info("getlist...............");
		
		return mapper.getList().stream().map(notice -> toDTO(notice)).collect(Collectors.toList());
	}

	@Override
	public NoticeDTO getOne(Integer nno) {
	
		return toDTO(mapper.getOne(nno));
	}

	@Override
	public void insert(NoticeDTO dto) {

		log.info("insert...............");
		
		mapper.insert(toDomain(dto));
	}

}
