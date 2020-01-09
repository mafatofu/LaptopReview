//package com.care.service;
//
//import java.io.BufferedReader;
//import java.io.File;
//import java.io.FileInputStream;
//import java.io.IOException;
//import java.io.InputStreamReader;
//import java.nio.charset.StandardCharsets;
//import java.util.ArrayList;
//import java.util.LinkedHashMap;
//import java.util.List;
//import java.util.Map;
//import java.util.Set;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.springframework.stereotype.Service;
//import org.springframework.ui.Model;
//
//@Service
//public class ReviewServiceImpl3 implements ReviewService {
//
//	@Override
//	public void pnReview(Model model) {
//		
//		List<String> keyWordList = new ArrayList<String>(); //키워드 리스트
//		List<LinkedHashMap<String , Integer>> positive_word_count_List = new ArrayList<LinkedHashMap<String , Integer>>(); //긍정 단어와 개수 리스트
//		List<LinkedHashMap<String , Integer>> negative_word_count_List = new ArrayList<LinkedHashMap<String , Integer>>(); //부정 단어와 개수 리스트
//		List<LinkedHashMap<String, List<String>>> positive_word_review_List = new ArrayList <LinkedHashMap<String, List<String>>>(); //긍정 단어와 리뷰 리스트
//		List<LinkedHashMap<String, List<String>>> negative_word_review_List = new ArrayList <LinkedHashMap<String, List<String>>>(); //부정 단어와 리뷰 리스트
//				
//		//[ 모델명 추출 ]
//		Map<String, Object> map = model.asMap();
//		HttpServletRequest request = (HttpServletRequest)map.get("request");
//		String modelName = request.getParameter("modelName").split("\\s")[2];
//		
//		// [ 모델명에 해당하는 키워드 추출 ]
//		File file = new File(getClass().getClassLoader().getResource("PNCount/"+modelName).getFile());
//		File[] PNList = file.listFiles();	
//		
//		LinkedHashMap<String , Integer> positive_word_count; //긍부정 단어와 개수  / 키워드별로 1개씩 만들어야 함
//		LinkedHashMap<String , Integer> negative_word_count; //긍부정 단어와 개수 
//		
//		// [ 키워드를 가지고 긍부정 단어 리스트와 개수 추출 ]
//		for(int i=0; i < PNList.length; i++){
//			String keyWordPath = PNList[i].getPath();
//			keyWordList.add(transKeyWord(keyWordPath.split(modelName+"\\\\")[1].split("\\.")[0]));
//			
//			positive_word_count = new LinkedHashMap<String, Integer>();
//			negative_word_count = new LinkedHashMap<String , Integer>();
//			BufferedReader br = null;
//			try {
//				 br = new BufferedReader(
//						new InputStreamReader(new FileInputStream(keyWordPath),StandardCharsets.UTF_8)); // 파일경로에서 파일 가져오기
//				String line = "";
//				while((line = br.readLine()) !=null) {					
//					String[] array = line.split(",");
//					if(line.contains("positive") && positive_word_count.size() < 5) {
//						positive_word_count.put(array[1], Integer.parseInt(array[2])); 
//					} else if(line.contains("negative") && negative_word_count.size() < 5 && Integer.parseInt(array[2]) != 0) { 
//						negative_word_count.put(array[1], Integer.parseInt(array[2])); 
//					}				
//				}
//			}catch (Exception e) {
//				e.printStackTrace();
//			}finally {
//				try {
//					if(br != null) {
//						br.close();
//					}
//				}catch (IOException e) {
//						e.printStackTrace();
//					}
//				}
//				positive_word_count_List.add(positive_word_count);
//				negative_word_count_List.add(negative_word_count);	
//			}
//
//		
//		// [ 긍부정 단어를 가지고 리뷰 추출 ]
//		File reviewFile = new File(getClass().getClassLoader().getResource("PNReview/"+modelName).getFile()); 
//		File[] reviewFileList = reviewFile.listFiles();
//		
//		for(int i=0; i < reviewFileList.length; i++){
//			LinkedHashMap<String, List<String>> positive_word_review = new LinkedHashMap<String, List<String>>(); //긍부정 단어와 리뷰
//			LinkedHashMap<String, List<String>> negative_word_review = new LinkedHashMap<String, List<String>>(); //긍부정 단어와 리뷰
//			BufferedReader br = null;
//			
//			try {
//	    		br = new BufferedReader(
//	    				new InputStreamReader(new FileInputStream(reviewFileList[i].getPath()),StandardCharsets.UTF_8));
//	    		String line = "";
//	    		Set<String> positive_Set = positive_word_count_List.get(i).keySet();
//	    		Set<String> negative_Set = negative_word_count_List.get(i).keySet();
//	    		
//	    		for (String s : positive_Set) {
//	    			System.out.println("긍정 set : " + s);
//	    		}
//  	    		
//	            while((line = br.readLine()) !=null) {
//
//	            	String[] array = line.split("\t");
//	            	System.out.println(array[0] + " : " + array[1]);
//	            	
//	            		if(positive_Set.contains(array[0])) {
//	            			if(positive_word_review.keySet().contains(array[0])) {
//	            				List<String> reviewList = positive_word_review.get(array[0]);
//	            				if(! (reviewList.contains(array[1]))) {
//	            					reviewList.add(array[1]);
//	            					}
//	            			}else {
//	            				List<String> review = new ArrayList<String>(); //리뷰
//	            				review.add(array[1]);
//	            				positive_word_review.put(array[0], review);
//	            			}
//	            		}else if (negative_Set.contains(array[0])) {
//		            		if(negative_Set.contains(array[0])) {
//		            			if(negative_word_review.keySet().contains(array[0])) {
//		            				List<String> reviewList = negative_word_review.get(array[0]);
//		            				if(! (reviewList.contains(array[1]))) {
//		            					reviewList.add(array[1]);
//		            					}
//		            			}else {
//		            				List<String> review = new ArrayList<String>(); //리뷰
//		            				review.add(array[1]);
//		            				negative_word_review.put(array[0], review);
//		            			}
//		            		}	            
//	            		}
//	            	}
//	            }catch (Exception e) {
//					e.printStackTrace();
//				}finally {
//					try {
//						if(br != null) {
//							br.close();
//						}
//					}catch (IOException e) {
//							e.printStackTrace();
//						}
//					}
//				positive_word_review_List.add(positive_word_review);
//				negative_word_review_List.add(negative_word_review);
//			}
//		model.addAttribute("keyWordList", keyWordList);
//		model.addAttribute("positive_word_count_List", positive_word_count_List);
//		model.addAttribute("negative_word_count_List", negative_word_count_List);
//		model.addAttribute("positive_word_review_List", positive_word_review_List);
//		model.addAttribute("negative_word_review_List", negative_word_review_List);
//		
//		}
//	
//	public String transKeyWord(String keyWord) {
//		switch (keyWord) {
//		case "shipping": return "배송";
//		case "gift": return "사은품";
//		case "price": return "가격";
//		case "window": return "윈도우";
//		case "cost": return "가성비";
//		case "perform": return "성능";
//		case "display": return "화면";
//		case "weight": return "무게";
//		case "speed": return "속도";
//		default: return keyWord;
//		}
//	}
//}
//
//
///* 화면 출력용 페이지.
// * for(int i = 0; i < keyWordList.size(); i++) { System.out.println("키워드 : " +
// * keyWordList.get(i)); System.out.println(positive_word_count_List.size());
// * System.out.println(negative_word_count_List.size());
// * System.out.println(positive_word_count_List.get(i).size());
// * System.out.println(negative_word_count_List.get(i).size());
// * System.out.println(positive_word_review_List.size());
// * System.out.println(negative_word_review_List.size());
// * System.out.println(positive_word_review_List.get(i).size());
// * System.out.println(negative_word_review_List.get(i).size());
// * System.out.println("+++++++긍정 키워드+++++++"); for(String key :
// * positive_word_count_List.get(i).keySet()) { System.out.println(key + " : " +
// * positive_word_count_List.get(i).get(key) + "개");
// * System.out.println("========리뷰========"); for(String review :
// * positive_word_review_List.get(i).get(key)) { System.out.println(review); } }
// * System.out.println("+++++++부정 키워드+++++++"); for(String key :
// * negative_word_count_List.get(i).keySet()) { System.out.println(key + " : " +
// * negative_word_count_List.get(i).get(key) + "개");
// * System.out.println("========리뷰========"); for(String review :
// * negative_word_review_List.get(i).get(key)) { System.out.println(review); } }
// * System.out.println("---------------구분선--------------"); }
