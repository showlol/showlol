package staticData.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class ChampDbService {
	
	@Autowired
	SqlSessionFactory fac;
	
	public int insert(ChampData cd) {
		SqlSession sql = fac.openSession();
		int res = sql.insert("staticData.insertChamp", cd);
		sql.close();
		
		return res;
	}
	
	public List<ChampData> showAll() {
		SqlSession sql = fac.openSession();
		List<ChampData> list = sql.selectList("staticData.showChampAll");
		sql.close();
		
		if(list != null)
			return list;
		else 
			return null;
	}
	
	public ChampData show(int id) {
		SqlSession sql = fac.openSession();
		ChampData data = sql.selectOne("staticData.showChamp", id);
		sql.close();
		
		if(data != null)
			return data;
		else 
			return null;
	}
	
	public ChampData showByName(String name) {
		SqlSession sql = fac.openSession();
		ChampData data = sql.selectOne("staticData.showChampByName", name);
		sql.close();
		
		if(data != null)
			return data;
		else 
			return null;
	}
	
	public int deleteAll() {
		SqlSession sql = fac.openSession();
		int res = sql.delete("staticData.deleteChampAll");
		sql.close();
		
		return res;
	}
	
	public int delete(int id) {
		SqlSession sql = fac.openSession();
		int res = sql.delete("staticData.deleteChamp", id);
		sql.close();
		
		return res;
	}
	//==============================================================================
	public void putChampDB() {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://global.api.pvp.net/api/lol/static-data/kr/v1.2/champion?champData=image&api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		
		deleteAll();
		LinkedHashMap data = (LinkedHashMap)map.get("data");
		for(Object s : data.keySet()) {
			LinkedHashMap info = (LinkedHashMap)data.get(s);
			int id = (int)info.get("id");
			String key = (String)info.get("key");
			String name = (String)info.get("name");
			String title = (String)info.get("title");
			LinkedHashMap img = (LinkedHashMap)info.get("image");
			String image1 = (String)img.get("full");
			String image2 = (String)img.get("sprite");
			
			ChampData cd = new ChampData(id, key, name, title, image1, image2);
			insert(cd);
		}
	}
}
