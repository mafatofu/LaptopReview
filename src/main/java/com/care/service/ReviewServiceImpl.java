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

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;


@Service
public class ReviewServiceImpl implements ReviewService{
	
	//긍부정단어 이중리스트
	List<List> positive_WordHouse = new ArrayList<List>();
	List<List> negative_WordHouse = new ArrayList<List>();
	
	@Override
	public void pnReview(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		//모델명 가져오기
		String modelNameCk[] = null;
		modelNameCk = request.getParameter("modelName").split("\\s");
		String modelName = modelNameCk[2];
		
		//모델명을 통해 resources 안 리뷰 파일의 절대 경로 가져오기
		//모델 폴더 경로 
		File file = new File(getClass().getClassLoader().getResource("PNReview/"+modelName).getFile());
		//리뷰 파일 경로의 리스트 
		File[] PNList = file.listFiles();
		
		//리뷰 파일들
		//긍부정단어 리뷰 리스트의 List 작성
		//각 리스트는 n번째 단어에 대한 리뷰들의 모임으로 구성된다. ex) pReviewHouse1에는, 각 키워드에 해당하는 파일의 첫번째 긍정단어들이 모여있다.

		
		//모델로 넘길 변수
		List<List<List<String>>> pWareHouse = new ArrayList<List<List<String>>>();
		List<List<List<String>>> nWareHouse = new ArrayList<List<List<String>>>();
		
		//절대경로를 바탕으로 하여 실제 파일 안의 리뷰들을  긍부정단어 Map에 저장
		String reviewPath = "";
	      if(PNList.length > 0){
	          for (int i = 0; i < PNList.length; i++) {
	             reviewPath = PNList[i].getPath();
	             try {
	                BufferedReader br = new BufferedReader(
	                      new InputStreamReader(new FileInputStream(reviewPath),StandardCharsets.UTF_8));

	                String line = "";
	                String[] array;
	               
	               //긍부정단어 리뷰 리스트. 각 단어들에 대한 리뷰가 들어간다. ex) 좋에 대한 리뷰: .....
	               List<String> pReview1 = new ArrayList<String>();
	               List<String> pReview2 = new ArrayList<String>();
	               List<String> pReview3 = new ArrayList<String>();
	               List<String> pReview4 = new ArrayList<String>();
	               List<String> pReview5 = new ArrayList<String>();
	               
	               List<String> nReview1 = new ArrayList<String>();
	               List<String> nReview2 = new ArrayList<String>();
	               List<String> nReview3 = new ArrayList<String>();
	               List<String> nReview4 = new ArrayList<String>();
	               List<String> nReview5 = new ArrayList<String>();
	               
	       		   List<List<String>> pReviewHouse = new ArrayList<List<String>>();
	       		   List<List<String>> nReviewHouse = new ArrayList<List<String>>();
	               
	               //긍부정단어 리스트 하나씩 가져오기
	               List<String> pl = positive_WordHouse.get(i);//[ , , , , ]의 형태
	               List<String> nl = negative_WordHouse.get(i);
	               

	               //상위 5개 단어에 대한 실제 리뷰를 넣자
	               //List<String>에, 각 단어에 대한 실제 리뷰 넣기
	               
	               
	               while((line = br.readLine())!=null) {
	            	     array = line.split("\t");
	            	     	//긍부정단어의 1~5번째 단어와 \t로 잘라낸 문자열이 같다면, 5개의 리스트 중 한 곳으로 들어가라
	            	     	//5개의 리스트는 긍부정단어 리스트의 단어 순서와 연동된다. ex) 좋: 1번 리스트, 최고, 2번 리스트....
	            	    	 
	            	         //긍정단어 리뷰
	            	     	 if(pl.get(0).equals(array[0])) {  
	    	       		         pReview1.add(array[1]); 		   
	            	    	 } else if(pl.get(1).equals(array[0])) {
	            	    		 pReview2.add(array[1]); 
	            	    	 } else if(pl.get(2).equals(array[0])) {
	            	    		 pReview3.add(array[1]); 
	            	    	 } else if(pl.get(3).equals(array[0])) {
	            	    		 pReview4.add(array[1]); 
	            	    	 } else if(pl.get(4).equals(array[0])) {
	            	    		 pReview5.add(array[1]); 
	            	    	 }
	            	     	 
	            	     	 //부정단어 리뷰
	            	     	 if(nl.get(0).equals(array[0])) {  
	    	       		         nReview1.add(array[1]); 		   
	            	    	 } else if(nl.get(1).equals(array[0])) {
	            	    		 nReview2.add(array[1]); 
	            	    	 } else if(nl.get(2).equals(array[0])) {
	            	    		 nReview3.add(array[1]); 
	            	    	 } else if(nl.get(3).equals(array[0])) {
	            	    		 nReview4.add(array[1]); 
	            	    	 } else if(nl.get(4).equals(array[0])) {
	            	    		 nReview5.add(array[1]); 
	            	    	 }
				  }
	                
	               //각 리뷰들 담기
	               pReviewHouse.add(pReview1); 	
	               pReviewHouse.add(pReview2); 
	               pReviewHouse.add(pReview3); 
	               pReviewHouse.add(pReview4); 
	               pReviewHouse.add(pReview5); 
	               
	               nReviewHouse.add(nReview1);
	               nReviewHouse.add(nReview2);
	               nReviewHouse.add(nReview3);
	               nReviewHouse.add(nReview4);
	               nReviewHouse.add(nReview5);
	               
	               pWareHouse.add(pReviewHouse);
	               nWareHouse.add(nReviewHouse);
	             } catch (Exception e) {
	                e.printStackTrace();
	             }
	             
	          }
	          
	       }
	      
	      
		/*
		 * int cc = 1; for (List<List<String>> list : pWareHouse) {
		 * System.out.println(cc++); System.out.println("----------다음 키워드----------");
		 * for (List<String> l : list) {
		 * System.out.println("----------다음 긍부정단어----------"); for (String s : l) {
		 * System.out.println(s); } } }
		 */
	      

	      model.addAttribute("pWareHouse", pWareHouse);
	      model.addAttribute("nWareHouse", nWareHouse);
	      
	      model.addAttribute("positive_WordHouse", positive_WordHouse);
	      model.addAttribute("negative_WordHouse", negative_WordHouse);
	}
	
	@Override
	public void pnCount(Model model) {
		//키워드 리스트
		List<String> keyWordList = new ArrayList<String>();
		//긍부정 단어 리스트

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		//최종적으로 모델에 넘어가는 맵. 키값으로 키워드를, 밸류값으로 긍/부정 단어 리스트(맵)를 가진다
		HashMap<String, LinkedHashMap> positive_House = new HashMap<String, LinkedHashMap>();
		HashMap<String, LinkedHashMap> negative_House = new HashMap<String, LinkedHashMap>();
		
		//키워드별 긍부정단어장(정렬 전)
		HashMap<String, Integer> positive = new HashMap<String, Integer>();
		HashMap<String, Integer> negative = new HashMap<String, Integer>();	
		
		//모델명
		String modelNameCk[] = null;
		modelNameCk = request.getParameter("modelName").split("\\s");
		String modelName = modelNameCk[2];
		//System.out.println("모델명: "+modelName);
		//모델 path

		//resources 안의 파일 경로 가져오기
		File file = new File(getClass().getClassLoader().getResource("PNCount/"+modelName).getFile());
		//디렉터리의 파일 리스트를 가져옴
		File[] PNList = file.listFiles();
		//키워드 추출
		String keyWordName = ""; // ~PNCount/모델명/cost.csv 파일의 경로 

		if(PNList.length > 0){	//키워드 갯수만큼 돌림
			for(int j=0; j < PNList.length; j++){
				//키워드리스트 추가
				//"_"으로 첫번째, "."으로 두번째 정제
				keyWordName = PNList[j].getPath();
				keyWordList.add(transKeyWord(keyWordName.split(modelName+"\\\\")[1].split("\\.")[0]));
				//모델 경로에서 키워드리스트 추출 
				
				try {
					BufferedReader br = new BufferedReader(
							new InputStreamReader(new FileInputStream(keyWordName),StandardCharsets.UTF_8)); // 파일경로에서 파일 가져오기
					List<String> positive_WordList = new ArrayList<String>(); //긍정 단어 리스트
					List<String> negative_WordList = new ArrayList<String>(); //부정 단어 리스트 
					String line = "";
					String[] array;
					//단어장 비워두기
					positive.clear(); //긍부정 단어 넣기 / 정렬을 위해. 
					negative.clear();
					
					//긍부정단어와 개수 넣기.
					while((line = br.readLine())!=null) {
						array = line.split(",");
						if(line.contains("positive")) {
							positive.put(array[1], Integer.parseInt(array[2])); 
						} else if(line.contains("negative")) {
							negative.put(array[1], Integer.parseInt(array[2]));	
						}
					}
					
					// value 내림차순으로 정렬하고, value가 같으면 key 오름차순으로 정렬
					List<Map.Entry<String, Integer>> positive_List = new LinkedList<>(positive.entrySet());
					List<Map.Entry<String, Integer>> negative_List = new LinkedList<>(negative.entrySet());

					Collections.sort(positive_List, new Comparator<Map.Entry<String, Integer>>() {
						@Override
						public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
							int comparision = (o1.getValue() - o2.getValue()) * -1;
							return comparision == 0 ? o1.getKey().compareTo(o2.getKey()) : comparision;
						}
					});

					// 순서유지를 위해 LinkedHashMap을 사용
					LinkedHashMap<String, Integer> Positive_sortedMap = new LinkedHashMap<String, Integer>(); 
					LinkedHashMap<String, Integer> negative_sortedMap = new LinkedHashMap<String, Integer>();

					for(Iterator<Map.Entry<String, Integer>> iter = positive_List.iterator(); iter.hasNext();){
						Map.Entry<String, Integer> entry = iter.next();
						Positive_sortedMap.put(entry.getKey(), entry.getValue());		
					}

					Collections.sort(negative_List, new Comparator<Map.Entry<String, Integer>>() {
						@Override
						public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
							int comparision = (o1.getValue() - o2.getValue()) * -1;
							return comparision == 0 ? o1.getKey().compareTo(o2.getKey()) : comparision;
						}
					});

					// 순서유지를 위해 LinkedHashMap을 사용

					for(Iterator<Map.Entry<String, Integer>> iter = negative_List.iterator(); iter.hasNext();){
						Map.Entry<String, Integer> entry = iter.next();
						negative_sortedMap.put(entry.getKey(), entry.getValue());		
					}

					positive_House.put(keyWordList.get(j), Positive_sortedMap);
					negative_House.put(keyWordList.get(j), negative_sortedMap);
					

					int listCk=0;
					int ck=0;
					for (String key : Positive_sortedMap.keySet()) {
						if(listCk>=5) break;
						positive_WordList.add(key);
						listCk++;
					}
					
					for (String key : negative_sortedMap.keySet()) {
						if(ck>=5) break;
						negative_WordList.add(key);
						ck++;
					}
					
					while(positive_WordList.size()<5) {
						positive_WordList.add("없음");
					}
					while(negative_WordList.size()<5) {
						negative_WordList.add("없음");
					}
					positive_WordHouse.add(positive_WordList);
					negative_WordHouse.add(negative_WordList);
					
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
			
		}

		
        //모델에 전달
      	//키워드리스트, 키워드리스트 and 긍부정단어리스트
		System.out.println(keyWordList);
		model.addAttribute("keyWord", keyWordList);
		model.addAttribute("positive_House", positive_House);
		model.addAttribute("negative_House", negative_House);
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




