package summoner.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.TreeMap;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class LeagueService {
	
	public List getLeague(int id) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v2.5/league/by-summoner/"+id+"?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		List data = (ArrayList)map.get(id+"");
		LinkedHashMap map2 = (LinkedHashMap)data.get(0);
		List entries =  (ArrayList)map2.get("entries");
		String division = "";
		TreeMap tm = new TreeMap<>();
		for(int i=0; i<entries.size(); i++) {
			LinkedHashMap entrie = (LinkedHashMap)entries.get(i);
			if(entrie.get("playerOrTeamId").equals(id+""))
				division = (String)entrie.get("division");
		}
		for(int i=0; i<entries.size(); i++) {
			LinkedHashMap entrie = (LinkedHashMap)entries.get(i);
			if(!division.equals(entrie.get("division")))
				continue;
			
			tm.put((int)entrie.get("leaguePoints"), entrie);
		}
		
		for(Object o : tm.keySet()) {
			LinkedHashMap lhm = (LinkedHashMap)tm.get(o);
			System.out.println(lhm.get("leaguePoints"));
		}
		return data;
	}
}
