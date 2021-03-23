package org.judy.notice.controller;

import java.util.List;

import org.judy.notice.dto.NoticeDTO;
import org.judy.notice.service.NoticeService;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeRestController {

	private final NoticeService service;
	
	@GetMapping(value = "/list", produces = {MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<List<NoticeDTO>> getList() {
		
		log.info("list controller..............");
		
		return new ResponseEntity<List<NoticeDTO>>(service.getList(), HttpStatus.OK);
	}
	
	@GetMapping("/read/{nno}")
	public void getOne(Model model,@PathVariable("nno") Integer nno) {
		
		log.info("read controller............");
		
		model.addAttribute("notice", service.getOne(nno));
	}
	
	@GetMapping("/register")
	public void getInsert() {
		
	}
	
	@PostMapping("/register")
	public void postInsert(@RequestBody NoticeDTO dto) {
		
		log.info("insert.................");
		
		service.insert(dto);
		
	}
	
}
