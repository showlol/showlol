package summoner.model;

import java.util.HashMap;
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
	
	public LinkedHashMap sinfo;
	
	// �̸��� �̿��Ͽ� ���̵� ��������
	public int getSummonerId(String name) {
		RestTemplate rt = new RestTemplate();	
		String url = "https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/by-name/"+name+"?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09";
		LinkedHashMap map = rt.getForObject(url, LinkedHashMap.class);
		String name1 = name.replaceAll(" ", "");
		String name2 = name1.toLowerCase();
		LinkedHashMap data = (LinkedHashMap)map.get(name2);
		int id = (int)data.get("id");
		
		return id;
	}
	
	// �̸��� �̿��Ͽ� ��ȯ�� ���� ��������
	public LinkedHashMap getSummonerInfo(String name) {
		RestTemplate rt = new RestTemplate();	
		String url = "https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/by-name/"+name+"?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09";
		LinkedHashMap map = rt.getForObject(url, LinkedHashMap.class);
		String name1 = name.replaceAll(" ", "");
		String name2 = name1.toLowerCase();		
		LinkedHashMap data = (LinkedHashMap)map.get(name2);	
		sinfo = data;
		return data;
	}
	
	// ID�� �̿��Ͽ� �̸� ��������
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
	
	// ChampId�� �̿��Ͽ� ChampName ��������
	public String getChampName(int cid) {
		SqlSession sql = fac.openSession();
		ChampData cd = sql.selectOne("staticData.showChamp", cid);
		sql.close();
		
		if(cd != null)
			return cd.getKey();
		else
			return null;
	}
	
	public String getChampNameKR(int cid) {
		SqlSession sql = fac.openSession();
		ChampData cd = sql.selectOne("staticData.showChamp", cid);
		sql.close();
		
		if(cd != null)
			return cd.getName();
		else
			return null;
	}
	/*
	public String getChampName(int cid) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://global.api.pvp.net/api/lol/static-data/kr/v1.2/champion/"+cid+"?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		String cname = (String)map.get("name");
		
		return cname;
	}
	*/
	// SpellId�� �̿��Ͽ� SpellKey ��������
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
	public boolean isCookie(String hist, String c) {
		String[] arr = hist.split(",");
		for(int i=0; i<arr.length; i++) {
			if(arr[i].equals(c)) {
				return true;
			}
		}
		
		return false;
	}
}
