package com.care.dao;

import java.util.List;

import com.care.dto.ReviewDTO;

public interface SearchDAO {
	public List<ReviewDTO> searchList(String searchItem); 
}
