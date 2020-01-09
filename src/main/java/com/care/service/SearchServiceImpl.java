package com.care.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.care.dao.SearchDAO;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	SearchDAO dao;
	
	@Override
	public void SearchSpec(Model model) {
		Map<String, Object> map =  model.asMap();
		String modelName = (String)map.get("modelName");
		model.addAttribute("spec", dao.searchSpec(modelName));
	}
	
	

	@Override
	public void SearchModel(Model model) {
		Map<String, Object> map =  model.asMap();
		String searchItem = (String)map.get("searchItem");
		String order = (String)map.get("order");
		Boolean order_asc = (Boolean)map.get("order_asc");
		searchItem = searchItem.toUpperCase().replace(" ", "");
		String[] lg = {"LG", "엘지"}; String[] lg_s = {"그램", "울트라", "울트라PC", "울트라기어", "2IN1", "GRAM"};
		String[] apple = {"APPLE", "애플"}; String[] apple_s = {"맥북프로", "맥북", "에어"};
		String[] samsung = {"SAMSUNG", "삼성"}; String[] samsung_s = {"노트북9", "노트북7", "노트북5", "노트북3", "갤럭시북", "갤럭시북S",  "노트북", "플렉스", "이온", "ODYSSEY", "PEN", "S"};
		String[] hp = {"HP"}; String[] hp_s = {"파빌리온", "프로북", "엔비", "게이밍", "오멘", "스펙터"};
		String[] lenovo = {"LENOVO", "레노버"};  String[] lenovo_s = {"LEGION", "아이디어패드", "요가"};
		String[] msi = {"MSI"}; String[] msi_s = {"프레스티지", "모던", "크리에이터","GF75","THIN","GP75","GL65","GF63","파워팩", "프로", "WIN10", "17M", "14", "화이트", "에디션","GL63", "TITAN", "DT", "P76","15", "GS65", "LEOPARD", "PS63"};
		String[] acer = {"ACER", "에이서"}; String[] acer_s = {"SWIFT", "3", "5", "7", "SMART","SOLID2","METAL2", "아스파이어", "NITRO", "5", "144", "MAX", "MX", "프레데터", "HELIOS", "300", "500", "700", "트리톤", "체인져", "트래블메이트", "IPS", "I"	};
		String[] asus = {"ASUS", "아수스"}; String[] asus_s = {"젠북", "17", "15", "14", "ROG", "STRIX", "G", "비보북", "EXPERTBOOK", "TUF", "S15", "S13", "LAPTOP" };
		String[] razer = {"RAZER", "레이저"}; String[] razer_s = {"BLADE", "PRO", "17", "15", "13", "STEALTH", "ADVANCED", "9GEN", "10GEN", "BASE", "MERCURY", "OPTOKB", "240"};
		String[] dell = {"DELL", "델"}; String[] dell_s = {"래티튜드", "인스피론", "XPS", "17", "15", "13", "G5", "G3", "에일리언웨어", "AREA", "2IN1", "SE", "51M"};
		String[] hansung= {"한성"}; String[] hansung_s = {"아방가르드", "올데이롱", "언더케이지", "BOSSMONSTER"};
		String[] jooyun = {"주연", "주연테크"}; String[] jooyun_s = {"캐리북", "T", "리오나인" };
		String[] search_input = {"GRAM", "MACBOOKPRO", "MACBOOK", "AIR", "FLEX", "ION", "오디세이", "IDEAPAD", "YOGA", "스위프트", "ASPIRE", "니트로", "ZENBOOK", "VIVOBOOK", "블레이드", "프로", "스텔스", "보스몬스터"};
		String[] search_output = {"그램", "맥북프로", "맥북", "에어", "플렉스", "이온", "ODYSSEY", "아이디어패드", "요가", "SWIFT", "아스파이어", "NITRO", "젠북", "비보북", "BLADE", "PRO", "STEALTH", "BOSSMONSTER"};
		
		//한영 변환
		for(int i = 0; i < search_input.length;i++) {
			if(searchItem.contains(search_input[i])) {
				searchItem = searchItem.replace(search_input[i], search_output[i]);
			}
		}
		
		//한글, 영어 변경 부분. array 따로 만들어서 변경.
		//LG노트북 검색어 설정
		for(String i : lg) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%LG%");
				for(String s : lg_s) {
					if(searchItem.contains(s)) {
							searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		
		for(String i : apple) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%APPLE%");
				for(String s : apple_s) {
					if(searchItem.contains(s)) {
						searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		for(String i : samsung) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%SAMSUNG%");
				for(String s : samsung_s) {
					if(searchItem.contains(s)) {
						searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		
		for(String i : hp) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%HP%");
				for(String s : hp_s) {
					if(searchItem.contains(s)) {
						searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		
		for(String i : lenovo) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%LENOVO%");
				for(String s : lenovo_s) {
					if(searchItem.contains(s)) {
						searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		
		for(String i : msi) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%MSI%");
				for(String s : msi_s) {
					if(searchItem.contains(s)) {
						searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		
		for(String i : acer) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%ACER%");
				for(String s : acer_s) {
					if(searchItem.contains(s)) {
						searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		
		for(String i : asus) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%ASUS%");
				for(String s : asus_s) {
					if(searchItem.contains(s)) {
						searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		
		for(String i : razer) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%RAZER%");
				for(String s : razer_s) {
					if(searchItem.contains(s)) {
						searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		
		for(String i : dell) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%DELL%");
				for(String s : dell_s) {
					if(searchItem.contains(s)) {
						searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		
		for(String i : hansung) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%HANSUNG%");
				for(String s : hansung_s) {
					if(searchItem.contains(s)) {
							searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		
		for(String i : jooyun) {
			if(searchItem.contains(i)) {
				searchItem = searchItem.replace(i, "%JOOYUN%");
				for(String s : jooyun_s) {
					if(searchItem.contains(s)) {
						searchItem = searchItem.replace(s, "%"+s+"%");
					}
				}
			}
		}
		
		System.out.println(searchItem);
		model.addAttribute("searchList", dao.searchList(searchItem, order, order_asc));
	}

		
}
