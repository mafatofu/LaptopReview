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
		String searchItem = (String)map.get("searchItem");
		String searchOption = (String)map.get("searchOption");
		model.addAttribute("searchList", dao.searchList(searchOption, searchItem));
	}

		
}
