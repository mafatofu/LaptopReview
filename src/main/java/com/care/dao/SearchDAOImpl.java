package com.care.dao;

import java.util.List;

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
	public List<ReviewDTO> searchList(String searchItem) {		
		List<ReviewDTO> list = sql.selectList(NAMESPACE+".search", searchItem);
		System.out.println("리스트 검사");
		for (ReviewDTO reviewDTO : list) {
			System.out.println(reviewDTO);
		}
		return list;
	}
}
