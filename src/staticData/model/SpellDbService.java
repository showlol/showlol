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
public class SpellDbService {
	
	@Autowired
	SqlSessionFactory fac;
	
	public int insert(SpellData sd) {
		SqlSession sql = fac.openSession();
		int res = sql.insert("staticData.insertSpell", sd);
		sql.close();
		
		return res;
	}
	
	public List<SpellData> showAll() {
		SqlSession sql = fac.openSession();
		List<SpellData> list = sql.selectList("staticData.showSpellAll");
		sql.close();
		
		if(list != null)
			return list;
		else 
			return null;
	}
	
	public SpellData show(int id) {
		SqlSession sql = fac.openSession();
		SpellData data = sql.selectOne("staticData.showSpell", id);
		sql.close();
		
		if(data != null)
			return data;
		else 
			return null;
	}
	
	public int deleteAll() {
		SqlSession sql = fac.openSession();
		int res = sql.delete("staticData.deleteSpellAll");
		sql.close();
		
		return res;
	}
	
	public int delete(int id) {
		SqlSession sql = fac.openSession();
		int res = sql.delete("staticData.deleteSpell", id);
		sql.close();
		
		return res;
	}
	//==============================================================================
	public void putSpellDB() {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://global.api.pvp.net/api/lol/static-data/kr/v1.2/summoner-spell?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		
		deleteAll();
		LinkedHashMap data = (LinkedHashMap)map.get("data");
		for(Object s : data.keySet()) {
			LinkedHashMap info = (LinkedHashMap)data.get(s);
			int id = (int)info.get("id");
			String name = (String)info.get("name");
			String description = (String)info.get("description");
			String key = (String)info.get("key");
			
			SpellData sd = new SpellData(id, name, description, key);
			insert(sd);
		}
	}
}
