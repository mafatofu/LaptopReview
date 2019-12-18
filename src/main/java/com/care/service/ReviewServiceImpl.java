package com.care.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.dao.ReviewDAO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	ReviewDAO dao;
	
	@Override
	public void modelList(Model model) {
		model.addAttribute("modelList", dao.modelList());
	}

}
