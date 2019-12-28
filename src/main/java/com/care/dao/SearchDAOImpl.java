package com.care.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.care.dto.ReviewDTO;

@Repository
public class SearchDAOImpl implements SearchDAO{
	
	@Autowired
	SqlSession sql;
	
	public static final String NAMESPACE = "search";
	
	@Override
	public List<ReviewDTO> searchList(String searchOption, String searchItem) {		
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(searchOption + "===" + searchItem);
		map.put("searchOption", searchOption);
		map.put("searchItem", searchItem.toUpperCase());
		List<ReviewDTO> list = sql.selectList(NAMESPACE+".search", map);
		System.out.println(list.size());
		return list;
	}
}
