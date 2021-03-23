package org.judy.notice.mapper;

import org.judy.common.config.CommonConfig;
import org.judy.notice.config.NoticeConfig;
import org.judy.notice.domain.Notice;
import org.judy.notice.mapper.NoticeMapper;
import org.judy.time.config.TimeConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, NoticeConfig.class})
@Log4j
public class NoticeMapperTests {
	
	@Autowired
	NoticeMapper mapper;
	
	@Test
	public void getListTest() {
		log.info(mapper.getList());
	}
	
	@Test
	public void getOneTest() {
		log.info(mapper.getOne(20));	
	}
	
	@Test
	public void insertTest() {
		
		Notice vo = Notice.builder()
				.title("테스트제목")
				.context("테스트 내용")
				.writer("user00")
				.build();
				
		
		mapper.insert(vo);
		
	}

}
