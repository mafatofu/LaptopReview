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
	//키워드 리스트
	List<String> keyWordList = new ArrayList<String>();
	
	//긍부정 단어 리스트
	List<String> positive_WordList = new ArrayList<String>();
	List<String> negative_WordList = new ArrayList<String>();
	
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
		//리뷰 파일 경로
		File[] PNList = file.listFiles();
		//리뷰 파일들
		//긍부정단어 리뷰 해쉬맵의 List 작성
		List<HashMap<String, String>> pReviewHouse = new ArrayList<HashMap<String, String>>();
		List<HashMap<String, String>> nReviewHouse = new ArrayList<HashMap<String, String>>();
		
		//긍부정단어 리뷰 해쉬맵
		HashMap<String, String> positive = new HashMap<String, String>();
		HashMap<String, String> negative = new HashMap<String, String>();	
		
		//상위 5개의 긍부정 단어
		
		//
		//절대경로를 바탕으로 하여 실제 파일 안의 리뷰들을  긍부정단어 Map에 저장
		String reviewPath = "";
		/*if(PNList.length > 0){
			for (int i = 0; i < PNList.length; i++) {
				reviewPath = PNList[i].getPath();
				try {
					BufferedReader br = new BufferedReader(
							new InputStreamReader(new FileInputStream(reviewPath),StandardCharsets.UTF_8));
					
					
					String line = "";
					String[] array;
					
					
					//
					//긍부정리뷰 가져오기
					//리뷰에는 positive negative 단어가 안쓰여져있다?!
					//긍부정 단어의 리스트에 있는 단어들로 split 하여 실제 리뷰를 해당 Map에 넣자
					

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		}*/
		//pnCount의 
		
	}
	
	@Override
	public void pnCount(Model model) {
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
		String keyWordSplit[] = null;
		String keyWordName = ""; 
		String keyWordCk[]=null;

		if(PNList.length > 0){
			//키워드 갯수만큼 돌림
			for(int j=0; j < PNList.length; j++){
				//키워드리스트 추가
				//"_"으로 첫번째, "."으로 두번째 정제
				keyWordName = PNList[j].getPath();
				keyWordSplit = keyWordName.split(modelName+"\\\\");
				keyWordCk = keyWordSplit[1].split("\\.");
				keyWordList.add(transKeyWord(keyWordCk[0]));
				
				
				try {
					BufferedReader br = new BufferedReader(
							new InputStreamReader(new FileInputStream(keyWordName),StandardCharsets.UTF_8));

					String line = "";
					String[] array;
					//단어장 비워두기
					positive.clear();
					negative.clear();
					
					//긍부정단어장 비워두기
					positive_WordList.clear();
					negative_WordList.clear();
					
					//긍부정단어 가져오기
					//긍부정단어리스트에 추가?
					while((line = br.readLine())!=null) {
						array = line.split(",");
						if(line.contains("positive")) {
							positive.put(array[1], Integer.parseInt(array[2]));
							//리스트의 형태가 아니라 해시맵의 형태로 하여 키로는 긍부정단어, 값으로는 리뷰?
							positive_WordList.add(array[1]);
						} else if(line.contains("negative")) {
							negative.put(array[1], Integer.parseInt(array[2]));
							negative_WordList.add(array[1]);
						}
					}
					positive_WordHouse.add(positive_WordList);
					negative_WordHouse.add(negative_WordList);
					
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
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		
		System.out.println(positive_WordHouse);
		System.out.println(negative_WordHouse);

		//모델에 전달
		//키워드리스트, 키워드리스트 and 긍부정단어리스트
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




