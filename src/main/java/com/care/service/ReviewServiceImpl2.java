package com.care.service;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

public class ReviewServiceImpl2 implements ReviewService {
	
	@Override
	public void pnReview(Model model) {
		
		List<String> keyWordList = new ArrayList<String>(); //키워드 리스트
		List<LinkedHashMap<String , Integer>> positive_word_count_List = new ArrayList<LinkedHashMap<String , Integer>>(); //긍정 단어와 개수 리스트
		List<LinkedHashMap<String , Integer>> negative_word_count_List = new ArrayList<LinkedHashMap<String , Integer>>(); //부정 단어와 개수 리스트
		List<LinkedHashMap<String, List<String>>> positive_word_review_List = new ArrayList <LinkedHashMap<String, List<String>>>(); //긍정 단어와 리뷰 리스트
		List<LinkedHashMap<String, List<String>>> negative_word_review_List = new ArrayList <LinkedHashMap<String, List<String>>>(); //부정 단어와 리뷰 리스트
				
		//[ 모델명 추출 ]
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String modelName = request.getParameter("modelName").split("\\s")[2];
		
		// [ 모델명에 해당하는 키워드 추출 ]
		File file = new File(getClass().getClassLoader().getResource("PNCount/"+modelName).getFile());
		File[] PNList = file.listFiles();		
		
		for(int i=0; i < PNList.length; i++){
			String keyWordPath = PNList[i].getPath();
			keyWordList.add(transKeyWord(keyWordPath.split(modelName+"\\\\")[1].split("\\.")[0]));
		}
		
		// [ 키워드를 가지고 긍부정 단어 리스트와 개수 추출 ]
		for(int i=0; i < PNList.length; i++){
			String keyWordPath = PNList[i].getPath();
			try {
				BufferedReader br = new BufferedReader(
						new InputStreamReader(new FileInputStream(keyWordPath),StandardCharsets.UTF_8)); // 파일경로에서 파일 가져오기
				while(br.readLine() !=null) {
					LinkedHashMap<String , Integer> positive_word_count = new LinkedHashMap<String, Integer>(); //긍부정 단어와 개수 
					LinkedHashMap<String , Integer> negative_word_count = new LinkedHashMap<String , Integer>(); //긍부정 단어와 개수 
					
					String[] array = br.readLine().split(",");
					
					if(br.readLine().contains("positive")) {
						positive_word_count.put(array[1], Integer.parseInt(array[2])); 
					} else if(br.readLine().contains("negative")) { 
						negative_word_count.put(array[1], Integer.parseInt(array[2])); 
					}
					positive_word_count_List.add(positive_word_count);
					negative_word_count_List.add(negative_word_count);
					br.close();
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		// [ 긍부정 단어를 가지고 리뷰 추출 ]
		File reviewFile = new File(getClass().getClassLoader().getResource("PNReview/"+modelName).getFile()); 
		File[] reviewFileList = reviewFile.listFiles();
		
		for(int i=0; i < reviewFileList.length; i++){
			LinkedHashMap<String, List<String>> positive_word_review = new LinkedHashMap<String, List<String>>(); //긍부정 단어와 리뷰
			LinkedHashMap<String, List<String>> negative_word_review = new LinkedHashMap<String, List<String>>(); //긍부정 단어와 리뷰
			
			try {
	    		BufferedReader br = new BufferedReader(
	    				new InputStreamReader(new FileInputStream(reviewFileList[i].getPath()),StandardCharsets.UTF_8));
	    		
	    		Set<String> positive_Set = positive_word_count_List.get(i).keySet();
	    		Set<String> negative_Set = negative_word_count_List.get(i).keySet();
  	    		
	            while(br.readLine() !=null) {

	            	String[] array = br.readLine().split("\t");
	            	
	            		if(positive_Set.contains(array[0])) {
	            			if(positive_word_review.keySet().contains(array[0])) {
	            				positive_word_review.get(array[0]).add(array[1]);
	            			}else {
	            				List<String> review = new ArrayList<String>(); //리뷰
	            				review.add(array[1]);
	            				positive_word_review.put(array[0], review);
	            			}
	            		}else if (negative_Set.contains(array[0])) {
		            		if(negative_Set.contains(array[0])) {
		            			if(negative_word_review.keySet().contains(array[0])) {
		            				negative_word_review.get(array[0]).add(array[1]);
		            			}else {
		            				List<String> review = new ArrayList<String>(); //리뷰
		            				review.add(array[1]);
		            				negative_word_review.put(array[0], review);
		            			}
		            		}	            
	            		}
	            	}
	            br.close();
	            }catch (Exception e) {
	            	e.printStackTrace();
	            }
				positive_word_review_List.add(positive_word_review);
				negative_word_review_List.add(negative_word_review);
			}
		
		for(int i = 0; i < keyWordList.size(); i++) {
			System.out.println("키워드 : " + keyWordList.get(i));
			System.out.println(positive_word_count_List.size());
			System.out.println(negative_word_count_List.size());
			System.out.println("+++++++긍정 키워드+++++++");
			for(String key : positive_word_count_List.get(i).keySet()) {
				System.out.println(key + " : " + positive_word_count_List.get(i).get(key) + "개");
				System.out.println("========리뷰========");
				for(String review : positive_word_review_List.get(i).get(key)) {
					System.out.println(review);
				}
			}
			System.out.println("+++++++부정 키워드+++++++");
			for(String key : negative_word_count_List.get(i).keySet()) {
				System.out.println(key + " : " + negative_word_count_List.get(i).get(key) + "개");
				System.out.println("========리뷰========");
				for(String review : negative_word_review_List.get(i).get(key)) {
					System.out.println(review);
				}
			}
		}
	}
	
	public String transKeyWord(String keyWord) {
		switch (keyWord) {
		case "shipping": return "배송";
		case "gift": return "사은품";
		case "price": return "가격";
		case "window": return "윈도우";
		case "cost": return "가성비";
		case "perform": return "성능";
		case "display": return "화면";
		case "weight": return "무게";
		case "speed": return "속도";
		default: return keyWord;
		}
	}
}