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
public class RuneDbService {
	
	@Autowired
	SqlSessionFactory fac;
	
	public int insert(RuneData rd) {
		SqlSession sql = fac.openSession();
		int res = sql.insert("staticData.insertRune", rd);
		sql.close();
		
		return res;
	}
	
	public List<RuneData> showAll() {
		SqlSession sql = fac.openSession();
		List<RuneData> list = sql.selectList("staticData.showRuneAll");
		sql.close();
		
		if(list != null)
			return list;
		else 
			return null;
	}
	
	public RuneData show(int id) {
		SqlSession sql = fac.openSession();
		RuneData data = sql.selectOne("staticData.showRune", id);
		sql.close();
		
		if(data != null)
			return data;
		else 
			return null;
	}
	
	public int deleteAll() {
		SqlSession sql = fac.openSession();
		int res = sql.delete("staticData.deleteRuneAll");
		sql.close();
		
		return res;
	}
	
	public int delete(int id) {
		SqlSession sql = fac.openSession();
		int res = sql.delete("staticData.deleteRune", id);
		sql.close();
		
		return res;
	}
	//==============================================================================
	public void putRuneDB() {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://global.api.pvp.net/api/lol/static-data/kr/v1.2/rune?runeListData=image&api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		
		deleteAll();
		LinkedHashMap data = (LinkedHashMap)map.get("data");
		for(Object s : data.keySet()) {
			LinkedHashMap info = (LinkedHashMap)data.get(s);
			int id = (int)info.get("id");
			String name = (String)info.get("name");
			String description = (String)info.get("description");
			LinkedHashMap rune = (LinkedHashMap)info.get("rune");
			String tier = (String)rune.get("tier");
			String type = (String)rune.get("type");
			LinkedHashMap image = (LinkedHashMap)info.get("image");
			String img = (String)image.get("full");
			
			RuneData md = new RuneData(id, name, description, tier, type, img);
			insert(md);
		}
	}
}
