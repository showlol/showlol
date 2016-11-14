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
public class ItemDbService {
	
	@Autowired
	SqlSessionFactory fac;
	
	public int insert(ItemData id) {
		SqlSession sql = fac.openSession();
		int res = sql.insert("staticData.insertItem", id);
		sql.close();
		
		return res;
	}
	
	public List<ItemData> showAll() {
		SqlSession sql = fac.openSession();
		List<ItemData> list = sql.selectList("staticData.showItemAll");
		sql.close();
		
		if(list != null)
			return list;
		else 
			return null;
	}
	
	public ItemData show(int id) {
		SqlSession sql = fac.openSession();
		ItemData data = sql.selectOne("staticData.showItem", id);
		sql.close();
		
		if(data != null)
			return data;
		else 
			return null;
	}
	
	public int deleteAll() {
		SqlSession sql = fac.openSession();
		int res = sql.delete("staticData.deleteItemAll");
		sql.close();
		
		return res;
	}
	
	public int delete(int id) {
		SqlSession sql = fac.openSession();
		int res = sql.delete("staticData.deleteItem", id);
		sql.close();
		
		return res;
	}
	//==============================================================================
	public void putItemDB() {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://global.api.pvp.net/api/lol/static-data/kr/v1.2/item?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		
		deleteAll();
		LinkedHashMap data = (LinkedHashMap)map.get("data");
		for(Object s : data.keySet()) {
			LinkedHashMap info = (LinkedHashMap)data.get(s);
			int id = (int)info.get("id");
			String name = (String)info.get("name");
			String description = (String)info.get("description");
			
			if(name != null && description != null) {
				ItemData md = new ItemData(id, name, description);
				insert(md);
			}
		}
	}
}
