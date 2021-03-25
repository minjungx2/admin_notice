package org.judy.notice.controller;

import org.judy.common.util.PageDTO;
import org.judy.common.util.PageMaker;
import org.judy.notice.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/notice")
@Log4j
@RequiredArgsConstructor
public class NoticeController {

	private final NoticeService service;

	@GetMapping("/list")
	public void getList(PageDTO pageDTO, Model model) {
		
		PageMaker pageMaker = new PageMaker(pageDTO, service.getTotal());
		
		model.addAttribute("pageMaker", pageMaker);
		
	}

	@GetMapping("/read/{nno}")
	public String getOne(@PathVariable("nno") Integer nno) {

		return "/notice/read";			
	}

}
