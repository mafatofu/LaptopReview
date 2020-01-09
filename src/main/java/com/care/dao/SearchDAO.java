package com.care.dao;

import java.util.List;

import com.care.dto.ReviewDTO;

public interface SearchDAO {
	public List<ReviewDTO> searchList(String searchItem, String order, Boolean order_asc);
	public ReviewDTO searchSpec(String modelName);
}
