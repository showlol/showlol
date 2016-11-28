package common.model;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import summoner.model.LeagueEntryDto;

@Component
public class GateService {
	
	public List getChallenger(int idx) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = new LinkedHashMap<>();
		try {
			map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v2.5/league/challenger?type=RANKED_SOLO_5x5&api_key=RGAPI-b09efb45-0cc2-407b-83ef-7cf1e8287f43", LinkedHashMap.class);
		}catch(Exception e) {
			return null;
		}
		List entries =  (ArrayList)map.get("entries");
		
		List list = new ArrayList<>();
		for(int i=0; i<entries.size(); i++) {
			LinkedHashMap entry = (LinkedHashMap)entries.get(i);
			
			LeagueEntryDto led = new LeagueEntryDto();
			led.setPlayerOrTeamName((String)entry.get("playerOrTeamName"));
			led.setFreshBlood((boolean)entry.get("isFreshBlood"));
			led.setHotStreak((boolean)entry.get("isHotStreak"));
			led.setInactive((boolean)entry.get("isInactive"));
			led.setVeteran((boolean)entry.get("isVeteran"));
			led.setLeaguePoints((int)entry.get("leaguePoints"));
			led.setWins((int)entry.get("wins"));
			led.setLosses((int)entry.get("losses"));
			
			list.add(led);
		}
		
		Collections.sort(list, new Comparator<LeagueEntryDto>(){

			public int compare(LeagueEntryDto l1, LeagueEntryDto l2) {
				return (l1.getLeaguePoints() > l2.getLeaguePoints()) ? -1: (l1.getLeaguePoints() < l2.getLeaguePoints()) ? 1:0 ;
			}
		});
		
		list = list.subList(idx, idx+20);
		
		return list;
	} 
}
