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
import java.util.List;
import java.util.Map;

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
		
		//키워드 리스트
		List<String> keyWordList = new ArrayList<String>();
		//모델명
		String modelName = "1.LG전자 울트라PC 15U590-GA56K";
		//모델 path
		String modelPath = "D:/190715_leeyeongkyu/TeamProject01/resources/output/2.PNCount/"+modelName;
		//키워드별 긍부정단어장
		HashMap<String, String> positive = new HashMap<String, String>();
		HashMap<String, String> negative = new HashMap<String, String>();
		//긍부정단어장 리스트
		List<HashMap<String, String>> positive_package = new ArrayList<HashMap<String, String>>();
		List<HashMap<String, String>> negative_package = new ArrayList<HashMap<String, String>>();
		//디렉터리의 파일 리스트를 가져옴
		File pnPath = new File(modelPath);
		File[] PNList = pnPath.listFiles();

		//키워드 추출
		String keyWordSplit[] = null;
		String keyWordName = ""; 
		String keyWordCk[]=null;
		System.out.println("-------긍/부정 단어 리스트-------");
		if(PNList.length > 0){
			//키워드 갯수만큼 돌림
			for(int j=0; j < PNList.length; j++){
				keyWordName = PNList[j].getPath();
				//키워드리스트 추가
				//"_"으로 첫번째, "."으로 두번째 정제
				keyWordSplit = keyWordName.split("_");
				keyWordCk = keyWordSplit[2].split("\\.");
				keyWordList.add(keyWordCk[0]);
				System.out.println();
				System.out.println("키워드: "+keyWordList.get(j));
				try {
					BufferedReader br = new BufferedReader(
							new InputStreamReader(new FileInputStream(keyWordName),StandardCharsets.UTF_8));

					String line = "";
					String[] array;
					//단어장 비워두기
					positive.clear();
					negative.clear();
					while((line = br.readLine())!=null) {
						array = line.split(",");
						if(line.contains("positive")) {
							positive.put(array[1], array[2]);
						} else if(line.contains("negative")) {
							negative.put(array[1], array[2]);
						}
					}
					//리스트에 단어장 추가
					
					positive_package.add(positive);
					negative_package.add(negative);
					
					System.out.println("------긍정단어--------");

					for (String key : positive.keySet()) {
						String value = positive.get(key);
						System.out.println(key+" : "+value);
					}
					System.out.println("------부정단어--------");
					for (String key : negative.keySet()) {
						String value = negative.get(key);
						System.out.println(key+" : "+value);
					}

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		System.out.println();
		System.out.println("키워드 리스트");
		for (String string : keyWordList) {
			System.out.println(string);
		}
		
		//긍부정단어 정렬
		/*Iterator it = sortByValue(positive).iterator();
		
			
		while(it.hasNext()) {
			String temp = (String) it.next();
			System.out.println(temp + " = " + positive.get(temp));
		}*/
		
		
		//모델에 전달
		model.addAttribute("positive", positive);
		model.addAttribute("negative", negative);
		model.addAttribute("keyWord", keyWordList);
	}
	
	
	/*public static List sortByValue(final Map<String,String> map) {
			List<String> list = new ArrayList();
			list.addAll(map.keySet());
			Collections.sort(list,new Comparator() {
			public int compare(Object o1,Object o2) {
			Object v1 = map.get(o1);
			Object v2 = map.get(o2);
			return ((Comparable) v2).compareTo(v1);
			}
		});
			Collections.reverse(list); // 주석시 오름차순
			return list;
		}*/

}




