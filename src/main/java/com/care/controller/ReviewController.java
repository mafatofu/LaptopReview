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
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("index")
	public String index() {
		return "index";
	}
	
	@RequestMapping("result")
	public String resultMap(Model model, @RequestParam(value="modelName", required=false, defaultValue = "item") String modelName) {
		model.addAttribute("modelName", modelName);
		System.out.println("컨트롤러 : " + modelName);
		service.pnCount(model);
		service.pnReview(model);		
		s_service.SearchSpec(model);
		return "result";
	}
	

	@RequestMapping("search")
	public String search(@RequestParam(value="searchItem", required=false, defaultValue = "item") String searchItem, 
			@RequestParam(value="order", required=false, defaultValue = "modelName") String order,
			@RequestParam(value="order_asc", required=false, defaultValue = "true") Boolean order_asc,Model model) {
		String search = searchItem;
		model.addAttribute("searchItem", searchItem);
		model.addAttribute("order", order);
		model.addAttribute("order_asc", order_asc);
		System.out.println(order_asc);
		s_service.SearchModel(model);
		model.addAttribute("search", search);
		return "search";
	}
	
	@RequestMapping("test")
	public String test(@RequestParam(value="modelName", required = false) String modelName, Model model) {
		model.addAttribute("model", modelName);
		return "wordcloud";
	}

}
