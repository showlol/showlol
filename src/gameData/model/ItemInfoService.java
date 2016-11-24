package gameData.model;

import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import gameImage.model.IconLoadService;

@Component
public class ItemInfoService {
	@Autowired
	IconLoadService ils;	
	
	public List info(){
		return ils.itemList;
	}
	public Set tags(){
		RestTemplate rest = new RestTemplate();
		LinkedHashMap lhm = rest.getForObject(
			"http://ddragon.leagueoflegends.com/cdn/6.22.1/data/ko_KR/item.json",
			LinkedHashMap.class
		);
		HashSet<String> tagSet = new HashSet<>();
		Map data = (Map)lhm.get("data");
		Set<Integer> set = data.keySet();
		Collection<Map> col = data.values();
		for(Map map : col){
			List<String> list = (List)map.get("tags");
			for(String str : list)
				tagSet.add(str);
		}
		return tagSet;
	}
	public Map detailInfo(){
		RestTemplate rest = new RestTemplate();
		LinkedHashMap lhm = rest.getForObject(
			"http://ddragon.leagueoflegends.com/cdn/6.22.1/data/ko_KR/item.json",
			LinkedHashMap.class
		);
		return (Map)lhm.get("data");
	}
}
