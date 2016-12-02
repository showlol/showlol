package ChampInfo.model;

import java.util.ArrayList;
import java.util.LinkedHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class ChampInfoService {
	public LinkedHashMap getChampInfo(int id) {
		RestTemplate rt = new RestTemplate();	
		String url = "https://global.api.pvp.net/api/lol/static-data/kr/v1.2/champion/"+id+"?champData=all&api_key=RGAPI-b09efb45-0cc2-407b-83ef-7cf1e8287f43";
		LinkedHashMap map = rt.getForObject(url, LinkedHashMap.class);
		
		return map;
	}
	
	public ArrayList getChampSkin(int id) {
		RestTemplate rt = new RestTemplate();	
		String url = "https://global.api.pvp.net/api/lol/static-data/kr/v1.2/champion/"+id+"?champData=all&api_key=RGAPI-b09efb45-0cc2-407b-83ef-7cf1e8287f43";
		LinkedHashMap map = rt.getForObject(url, LinkedHashMap.class);
		ArrayList skins = (ArrayList)map.get("skins");
		return skins;
	}
}
