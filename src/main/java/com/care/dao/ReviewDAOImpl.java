package com.care.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.care.dto.ReviewDTO;
import org.apache.ibatis.session.SqlSession;

@Repository
public class ReviewDAOImpl implements ReviewDAO{
	
	@Autowired
	SqlSession sql;
	
	public static final String NAMESPACE = "review";
	
	@Override
	public List<ReviewDTO> modelList() {
//		List<ReviewDTO> list = sql.selectList(NAMESPACE+".listAll");
//		System.out.println("리스트 검사");
//		for (ReviewDTO reviewDTO : list) {
//			System.out.println(reviewDTO);
//		}
//		return null;
		return sql.selectList(NAMESPACE+".listAll");
	}
}
