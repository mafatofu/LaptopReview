package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.care.dao.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchDAO dao;

	@Override
	public void SearchModel(Model model) {
		Map<String, Object> map =  model.asMap();
		String searchOption = (String)map.get("searchOption");
		String searchItem = (String)map.get("searchItem");
		if(searchItem.equals("엘지")) searchItem = "LG";
		if(searchItem.equals("삼성")) searchItem = "SAMSUNG";
		if(searchItem.equals("애플")) searchItem = "APPLE";
		if(searchItem.equals("레노버")) searchItem = "LENOVO";
		if(searchItem.equals("gram")) searchItem = "그램";
		
		model.addAttribute("searchList", dao.searchList(searchOption, searchItem));
	}

		
}
