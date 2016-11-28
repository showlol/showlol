package summoner.model;

import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class LeagueService {
	
	public LinkedHashMap getUserLeagueInfo(int id) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = new LinkedHashMap<>();
		try {
			map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v2.5/league/by-summoner/"+id+"/entry?api_key=RGAPI-bfc24a92-45bd-44ca-b5f1-dbd022e5e077", LinkedHashMap.class);
		}catch(Exception e) {
			return null;
		}
		
		List data = (ArrayList)map.get(id+"");
		
		return (LinkedHashMap)data.get(0);
	}
	
	public String getUserDivision(int id) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = new LinkedHashMap<>();
		try {
			map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v2.5/league/by-summoner/"+id+"/entry?api_key=RGAPI-bfc24a92-45bd-44ca-b5f1-dbd022e5e077", LinkedHashMap.class);
		}catch(Exception e) {
			return null;
		}
		List data = (ArrayList)map.get(id+"");
		LinkedHashMap map2 = (LinkedHashMap)data.get(0);
		ArrayList entries = (ArrayList)map2.get("entries");
		LinkedHashMap map3 = (LinkedHashMap)entries.get(0);
		
		return (String)map3.get("division");
	}
	public HashMap getLeague(int id, String division) {
		RestTemplate rt = new RestTemplate();	
		LinkedHashMap map = new LinkedHashMap<>();
		try {
			map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v2.5/league/by-summoner/"+id+"?api_key=RGAPI-bfc24a92-45bd-44ca-b5f1-dbd022e5e077", LinkedHashMap.class);
		}catch(Exception e) {
			return null;
		}
		List data = (ArrayList)map.get(id+"");
		LinkedHashMap map2 = (LinkedHashMap)data.get(0);
		List entries =  (ArrayList)map2.get("entries");
		
		List tList = new ArrayList<>();
		List rList = new ArrayList<>();
		HashMap res = new HashMap<>();
		for(int i=0; i<entries.size(); i++) {
			LinkedHashMap entry = (LinkedHashMap)entries.get(i);
			if(!entry.get("division").equals(division))
				continue;
			
			LeagueEntryDto led = new LeagueEntryDto();
			led.playerOrTeamName = (String)entry.get("playerOrTeamName");
			led.freshBlood = (boolean)entry.get("isFreshBlood");
			led.hotStreak = (boolean)entry.get("isHotStreak");
			led.inactive = (boolean)entry.get("isInactive");
			led.veteran = (boolean)entry.get("isVeteran");
			led.wins = (int)entry.get("wins");
			led.losses = (int)entry.get("losses");
			led.leaguePoints = (int)entry.get("leaguePoints");
			LinkedHashMap miniSeries = (LinkedHashMap)entry.get("miniSeries");
			if(miniSeries != null) {
				led.progress = (String)miniSeries.get("progress");
				tList.add(led);
				res.put("tList", tList);
			}else {
				rList.add(led);
				res.put("rList", rList);
			}
		}
		
		Collections.sort(rList, new Comparator<LeagueEntryDto>(){

			public int compare(LeagueEntryDto l1, LeagueEntryDto l2) {
				return (l1.getLeaguePoints() > l2.getLeaguePoints()) ? -1: (l1.getLeaguePoints() < l2.getLeaguePoints()) ? 1:0 ;
			}
		});
		
		return res;
	}
}
