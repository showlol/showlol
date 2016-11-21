package championData.model;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class IndividualChampService {
	
	public Map individual(){
		RestTemplate rest = new RestTemplate();
		LinkedHashMap map = rest.getForObject(
			"http://ddragon.leagueoflegends.com/cdn/6.22.1/data/en_US/champion/Aatrox.json",
			LinkedHashMap.class
		);
		Map data = (Map)map.get("data");
		
		return data;
	}
}
