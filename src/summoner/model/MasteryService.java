package summoner.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class MasteryService {
	
	// ���̵� �̿��Ͽ� Ư������ ��������
	public List getSummonerMastery(String id) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v1.4/summoner/"+id+"/masteries?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		LinkedHashMap data = (LinkedHashMap)map.get(id);
		List pages = (ArrayList)data.get("pages");
		
		return pages;
	}
}
