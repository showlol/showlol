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
public class MasteryDbService {
	
	@Autowired
	SqlSessionFactory fac;
	
	public int insert(MasteryData md) {
		SqlSession sql = fac.openSession();
		int res = sql.insert("staticData.insertMastery", md);
		sql.close();
		
		return res;
	}
	
	public List<MasteryData> showAll() {
		SqlSession sql = fac.openSession();
		List<MasteryData> list = sql.selectList("staticData.showMasteryAll");
		sql.close();
		
		if(list != null)
			return list;
		else 
			return null;
	}
	
	public MasteryData show(int id) {
		SqlSession sql = fac.openSession();
		MasteryData data = sql.selectOne("staticData.showMastery", id);
		sql.close();
		
		if(data != null)
			return data;
		else 
			return null;
	}
	
	public int deleteAll() {
		SqlSession sql = fac.openSession();
		int res = sql.delete("staticData.deleteMasteryAll");
		sql.close();
		
		return res;
	}
	
	public int delete(int id) {
		SqlSession sql = fac.openSession();
		int res = sql.delete("staticData.deleteMastery", id);
		sql.close();
		
		return res;
	}
	//==============================================================================
	public void putMasteryDB() {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://global.api.pvp.net/api/lol/static-data/kr/v1.2/mastery?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		
		deleteAll();
		LinkedHashMap data = (LinkedHashMap)map.get("data");
		for(Object s : data.keySet()) {
			LinkedHashMap info = (LinkedHashMap)data.get(s);
			int id = (int)info.get("id");
			String name = (String)info.get("name");
			List description = (ArrayList)info.get("description");
			
			MasteryData md = new MasteryData(id, name, description.toString());
			insert(md);
		}
	}
}
