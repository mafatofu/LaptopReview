package com.care.controller;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.care.service.ReviewService;
import com.care.service.SearchService;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService service;
	
	@Autowired
	SearchService s_service;
	
	@RequestMapping("index")
	public String index() {
		return "index";
		//검색어를 받아와야 함
	}
	
	@RequestMapping("graph")
	public String graph(Model model) {
		service.pnCount(model);
		return "graph";
		//검색어를 받아와야 함
	}
		
	@RequestMapping("result")
	public String resultMap(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.pnCount(model);
		return "result";
	}
	
	@RequestMapping("search")
	public String search(@RequestParam(value="searchItem", required=false) String searchItem, Model model) {
		model.addAttribute("searchItem", searchItem);
		s_service.SearchModel(model);
		return "search";
	}
}
