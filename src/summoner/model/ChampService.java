package summoner.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class ChampService {
	
	@Autowired
	BasicService bsvc;
	
	public ArrayList getChampData(long id) {
		RestTemplate rt = new RestTemplate();
		//String url = "https://kr.api.pvp.net/api/lol/kr/v1.3/stats/by-summoner/"+id+"/ranked?season=SEASON2016&api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09";
		String url = "https://kr.api.pvp.net/api/lol/kr/v1.3/stats/by-summoner/"+bsvc.sinfo.get("id")+"/ranked?season=SEASON2016&api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09";
		LinkedHashMap map = new LinkedHashMap<>();
		try {
			map = rt.getForObject(url, LinkedHashMap.class);
		}catch (Exception e) {
			return null;
		}
		
		ArrayList champs = (ArrayList)map.get("champions");
		ArrayList res = new ArrayList<>();
		for(int i=0; i<champs.size(); i++) {
			LinkedHashMap data = (LinkedHashMap)champs.get(i);
			int cid = (int)data.get("id");
			String cname = bsvc.getChampNameKR(cid);
			String iname = bsvc.getChampName(cid);
			if(cname != null && iname != null) {
				data.put("cname", cname);
				data.put("iname", iname);
				res.add(data);
			}
		}
		
		return res;
	}
}
