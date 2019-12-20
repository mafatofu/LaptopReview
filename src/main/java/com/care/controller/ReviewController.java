package com.care.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService service;
	
	@RequestMapping("index")
	public String index() {
		return "index";
		//검색어를 받아와야 함
	}
	
	@RequestMapping("graph")
	public String graph() {
		return "graph";
		//검색어를 받아와야 함
	}
	
	
	@RequestMapping("result")
	public String resultMap(Model model) {
		//service.modelList(model);
		
		return "result";
	}
}
