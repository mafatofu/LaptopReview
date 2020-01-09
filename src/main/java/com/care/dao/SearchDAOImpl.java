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
	public ReviewDTO searchSpec(String modelName) {
		System.out.println("DAO에서 : " + modelName);
		return sql.selectOne(NAMESPACE+".searchSpec", modelName);
	}
	
	@Override
	public List<ReviewDTO> searchList(String searchItem, String order, Boolean order_asc) {
		Map<String, Object> search = new HashMap<String, Object>();
		search.put("searchItem", searchItem);
		search.put("order", order);
		System.out.println(search.get("searchItem") + " : " + search.get("order"));
		List<ReviewDTO> list;
		if (order_asc) {
			list = sql.selectList(NAMESPACE+".searchASC", search);
		}else {
			list = sql.selectList(NAMESPACE+".searchDESC", search);
		}
		return list;
	}
}
