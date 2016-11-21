package staticJSON.model;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class RuneJSON {
	public Map getData(){
		RestTemplate rest = new RestTemplate();
		LinkedHashMap map = rest.getForObject(
				"http://ddragon.leagueoflegends.com/cdn/6.22.1/data/ko_KR/rune.json",
				LinkedHashMap.class
		);
		Map data = (Map)map.get("data");
		return data;
	}
}
