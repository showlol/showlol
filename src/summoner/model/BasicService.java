package summoner.model;

import java.util.LinkedHashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import staticData.model.ChampData;
import staticData.model.SpellData;

@Component
public class BasicService {
	
	@Autowired
	SqlSessionFactory fac;
	
	// 이름을 이용하여 아이디 가져오기
	public int getSummonerId(String name) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/by-name/"+name+"?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		LinkedHashMap data = (LinkedHashMap)map.get(name);
		int id = (int)data.get("id");
		
		return id;
	}
	
	// ID를 이용하여 이름 가져오기
	public String getSummonerName(int id) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/"+id+"?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		LinkedHashMap data = (LinkedHashMap)map.get(id+"");
		String name = (String)data.get("name");
		
		return name;
	}
	
	public LinkedHashMap getSummonerNames(String ids) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/"+ids+"/name?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		
		return map;
	}
	
	// ChampId를 이용하여 ChampName 가져오기
	public String getChampName(int cid) {
		SqlSession sql = fac.openSession();
		ChampData cd = sql.selectOne("staticData.showChamp", cid);
		sql.close();
		
		return cd.getKey();
	}
	/*
	public String getChampName(int cid) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://global.api.pvp.net/api/lol/static-data/kr/v1.2/champion/"+cid+"?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		String cname = (String)map.get("name");
		
		return cname;
	}
	*/
	// SpellId를 이용하여 SpellKey 가져오기
	public String getSpellName(int sid) {
		SqlSession sql = fac.openSession();
		SpellData sd = sql.selectOne("staticData.showSpell", sid);
		sql.close();
		
		return sd.getKey();
	}
	/*
	public String getSpellName(int sid) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://global.api.pvp.net/api/lol/static-data/kr/v1.2/summoner-spell/"+sid+"?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		String skey = (String)map.get("key");
		
		return skey;
	}
	*/
}
