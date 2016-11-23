package staticJSON.model;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class LanguageService {
	
	public Map data(){
		RestTemplate rest = new RestTemplate();
		LinkedHashMap lhm = rest.getForObject(
			"https://global.api.pvp.net/api/lol/static-data/kr/v1.2/language-strings?locale=ko_KR&version=6.22.1&api_key=RGAPI-b7af9c66-d7eb-4555-9571-f6394919399c",
			LinkedHashMap.class
		);
		return (Map)lhm.get("data");
	}
}
