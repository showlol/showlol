package championData.model;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class IndividualChampService {
	
	public Object individual(String name){
		RestTemplate rest = new RestTemplate();
		LinkedHashMap map = rest.getForObject(
			"http://ddragon.leagueoflegends.com/cdn/6.22.1/data/ko_KR/champion/"+name+".json",
			LinkedHashMap.class
		);		
		return ((Map)map.get("data")).get(name);
	}
}
