package staticJSON.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class RuneJSON {
	
	LinkedHashMap map;
	
	public RuneJSON(){
		RestTemplate rest = new RestTemplate();
		map = rest.getForObject(
			"http://ddragon.leagueoflegends.com/cdn/6.22.1/data/ko_KR/rune.json",
			LinkedHashMap.class
		);
	}
	public Map getData(){		
		
		Map data = (Map)map.get("data");
		List list = new ArrayList();
		Set keys =data.keySet();
		for(Object key : keys) {
		}
		return data;
	}
	public Map getKind(){
		Map stats =(Map)((Map)map.get("basic")).get("stats");
		System.out.println("룬종류:"+stats.toString());
		return stats;
	}
}
