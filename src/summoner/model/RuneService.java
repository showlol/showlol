package summoner.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import staticData.model.RuneData;

@Component
public class RuneService {

	@Autowired
	SqlSessionFactory fac;
	
	// 이름을이용한 아이디가져오기
		public int getSummonerId(String name) {
			RestTemplate rt = new RestTemplate();	
			LinkedHashMap map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/by-name/"+name+"?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
			LinkedHashMap data = (LinkedHashMap)map.get(name);
			int id = (int)data.get("id");
			
			return id;
		}
	
	
	// 아이디를이용한 내룬정보가져오기
	public List getSummonerRune(String id){
		RestTemplate rt = new RestTemplate();
		LinkedHashMap map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/"+id+
				"/runes?api_key=RGAPI-06864093-378a-40c8-a28f-4d2c38158835",LinkedHashMap.class);
		LinkedHashMap data = (LinkedHashMap)map.get(id);
		List pages = (ArrayList)data.get("pages");
		
		return pages;
	}
	
	public List getRuneInfo(List pages) {
		SqlSession sql = fac.openSession();
		for(int i=0; i<pages.size(); i++) {
			LinkedHashMap page = (LinkedHashMap)pages.get(i);
			
			List slots = (List)page.get("slots");
			for(int j=0; j<slots.size(); j++) {
				LinkedHashMap slot = (LinkedHashMap)slots.get(j);
				int runeId = (int)slot.get("runeId");
				RuneData rd = sql.selectOne("staticData.showRune", runeId);
				String img = rd.getImage();
				String des = rd.getDescription();
				String name = rd.getName();
				slot.put("img", img);
				slot.put("des", des);
				slot.put("name", name);
			}
		}
		sql.close();
		return pages;
	}
	
	public List runeImage(List<Map> pages){
		TreeSet<Integer> set = new TreeSet<>();
		for(Map temp : pages){
			List<Map> list = (List)temp.get("slots");
			for(Map temp2 : list){
				set.add((Integer)temp2.get("runeId"));
			}
		}
		List<Integer> runeId = new ArrayList(set);
		SqlSession sql = fac.openSession();
		List<Map> runeList = sql.selectList("rune.image", runeId);
		Map<String, String> runeMap = new HashMap<>();
		for(Map map : runeList){
			runeMap.put(map.get("ID").toString(), (String)map.get("IMAGE"));
		}
		System.out.println(runeMap.size());
		List<List> runePageImg = new ArrayList<>();
		List<String> imgList = new ArrayList<>();
		int cnt=0;
		for(Map temp : pages){
			List<Map> list = (List)temp.get("slots");
			
			for(Map<Integer, String> temp2 : list){				
				cnt++;				
				if(cnt%30==1){
					imgList = new ArrayList<>();
				}									
				String str = runeMap.get(String.valueOf(temp2.get("runeId")) );
				imgList.add(str);				
			}
			runePageImg.add(imgList);
		}
		System.out.println(runePageImg.size());
		sql.close();		
		return runePageImg;
	}
	public List runeImage2(List<Map> pages){
		List<Integer> ar = new ArrayList<>();
		for(Map temp : pages){
			List<Map> list = (List)temp.get("slots");
			for(Map temp2 : list){
				ar.add((Integer)temp2.get("runeId"));
			}
		}
		System.out.println(ar.size());
		SqlSession sql = fac.openSession();
		List<Map> img = sql.selectList("rune.image", ar);		
		System.out.println(img.toString());
		sql.close();
		
		return img;
	}
	
	public String getRuneImg(String img){
		SqlSession sql = fac.openSession();
		List<HashMap> list = sql.selectList("showRuneImg", img);
		HashMap map = new HashMap();
		for(HashMap temp : list){
			map.putAll(temp);
			
		}
		sql.close();
		
		return null;
	}	
}
