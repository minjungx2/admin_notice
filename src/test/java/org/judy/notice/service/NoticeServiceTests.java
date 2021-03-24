package org.judy.notice.service;

import org.judy.common.config.CommonConfig;
import org.judy.notice.config.NoticeConfig;
import org.judy.notice.dto.NoticeDTO;
import org.judy.notice.service.NoticeService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, NoticeConfig.class})
@Log4j
public class NoticeServiceTests {

	@Autowired
	NoticeService service;
	
	@Test
	public void testList() {
		
		log.info(service.getList());
		
	}
	
	@Test
	public void testOne() {
		
		log.info(service.getOne(20));
	}
	
	@Test
	public void testInsert() {
		
		NoticeDTO dto = new NoticeDTO();
		
		dto.setTitle("test");
		dto.setContent("test content");
		dto.setWriter("user00");
		
		service.insert(dto);
		
	}
	
}
