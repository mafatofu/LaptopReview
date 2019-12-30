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
import java.util.NavigableMap;
import java.util.Set;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;

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

	@Override
	public void pnCount(Model model) {
		Map<String, Object> map = model.asMap();
		//리퀘스트에 사용자가 입력한 값이 정확한 모델명이라 가정
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		//최종적으로 모델에 넘어가는 맵. 키값으로 키워드를, 밸류값으로 긍/부정 단어 리스트(맵)를 가진다
		HashMap<String, LinkedHashMap> positive_House = new HashMap<String, LinkedHashMap>();
		HashMap<String, LinkedHashMap> negative_House = new HashMap<String, LinkedHashMap>();
		
		//키워드 리스트
		List<String> keyWordList = new ArrayList<String>();
		//모델명
		String modelNameCk[] = null;
		modelNameCk =  request.getParameter("modelName").split("\\s");
		String modelName = modelNameCk[3];
		
		//모델 path
		String modelPath = "LaptopReview/src/main/webapp/resources/PNCount/"+modelName;

		//키워드별 긍부정단어장(정렬 전)
		HashMap<String, Integer> positive = new HashMap<String, Integer>();
		HashMap<String, Integer> negative = new HashMap<String, Integer>();	

		//디렉터리의 파일 리스트를 가져옴
		File pnPath = new File(modelPath);
		File[] PNList = pnPath.listFiles();

		//키워드 추출
		String keyWordSplit[] = null;
		String keyWordName = ""; 
		String keyWordCk[]=null;
//		System.out.println("-------긍/부정 단어 리스트-------");
		if(PNList.length > 0){
			//키워드 갯수만큼 돌림
			for(int j=0; j < PNList.length; j++){
				keyWordName = PNList[j].getPath();
				//키워드리스트 추가
				//"_"으로 첫번째, "."으로 두번째 정제
				keyWordSplit = keyWordName.split("_");
				keyWordCk = keyWordSplit[2].split("\\.");
				keyWordList.add(keyWordCk[0]);
				/*System.out.println();
				System.out.println("키워드: "+keyWordList.get(j));*/
				try {
					BufferedReader br = new BufferedReader(
							new InputStreamReader(new FileInputStream(keyWordName),StandardCharsets.UTF_8));

					String line = "";
					String[] array;
					//단어장 비워두기
					positive.clear();
					negative.clear();
					//긍부정단어 가져오기
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
					/*System.out.println("-----정렬된 맵-----");
					System.out.println(Positive_sortedMap);*/
					
					
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
					
					/*System.out.println("-----정렬된 맵-----");
					System.out.println(negative_sortedMap);*/
					
					positive_House.put(keyWordList.get(j), Positive_sortedMap);
					negative_House.put(keyWordList.get(j), negative_sortedMap);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		/*System.out.println();
		System.out.println("키워드 리스트");
		for (String string : keyWordList) {
			System.out.println(string);
		}*/


		
		//모델에 전달
		//키워드리스트, 키워드리스트 and 긍부정단어리스트
		model.addAttribute("keyWord", keyWordList);
		model.addAttribute("positive_House", positive_House);
		model.addAttribute("negative_House", negative_House);
	}


	

}




