package summoner.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.SystemPropertyUtils;
import org.springframework.web.client.RestTemplate;

@Component
public class MatchesService {
	
	@Autowired
	BasicService bsvc;
	
	// SummonerName을 이용하여 게임정보 가져오기
	public List<RecentGamesDto> getGameInfo(String type, String sname) {
		int summonerId = bsvc.getSummonerId(sname);
		RestTemplate rt = new RestTemplate();
		LinkedHashMap map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v1.3/game/by-summoner/"+summonerId+"/recent?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
		ArrayList games = (ArrayList)map.get("games");
		
		List<RecentGamesDto> list = new ArrayList<>();
		int cnt = 0;
		for(int i=0; i<games.size(); i++) {
			LinkedHashMap data = (LinkedHashMap)games.get(i);
			
			String gameMode = (String)data.get("gameMode");
			String gameType = (String)data.get("gameType");
			String subType = (String)data.get("subType");
			long createDate = (long)data.get("createDate");
			int teamId = (int)data.get("teamId");
			LinkedHashMap stats = (LinkedHashMap)data.get("stats");
			boolean win = (boolean)stats.get("win");
			int largestMultiKill = (int)stats.get("largestMultiKill");
			int kill, death, assist;
			try { 
				kill = (int)stats.get("championsKilled");
			}catch (Exception e) {
				kill = 0;
			}
			try { 
				death = (int)stats.get("numDeaths");
			}catch (Exception e) {
				death = 0;
			}
			try { 
				assist = (int)stats.get("assists");
			}catch (Exception e) {
				assist = 0;
			}
			float kda = -1;
			if(death != 0)
				kda = (kill + assist) / death;
			
			int gamelv = (int)stats.get("level");
			int cs1, cs2;
			try { 
				cs1 = (int)stats.get("minionsKilled");
			}catch (Exception e) {
				cs1 = 0;
			}
			try { 
				cs2 = (int)stats.get("neutralMinionsKilled");
			}catch (Exception e) {
				cs2 = 0;
			}
			int cs = cs1 + cs2;
			String champName = bsvc.getChampName((int)data.get("championId"));
			String spell1 = bsvc.getSpellName((int)data.get("spell1"));
			String spell2 = bsvc.getSpellName((int)data.get("spell2"));
			PlayerDto[] players = new PlayerDto[]{};
			ArrayList fellowPlayers = (ArrayList)data.get("fellowPlayers");
			String playerIds = "";
			List<HashMap> ally = new ArrayList<>();
			List<HashMap> enemy = new ArrayList<>();
			LinkedHashMap users = new LinkedHashMap<>();
			if(fellowPlayers != null) {
				for(int j=0; j<fellowPlayers.size(); j++) {
					LinkedHashMap player = (LinkedHashMap)fellowPlayers.get(j);
					int tId = (int)player.get("teamId");
					int cid = (int)player.get("championId");
					int sid = (int)player.get("summonerId");
					String cName = bsvc.getChampName(cid);
					HashMap p = new HashMap<>();
					p.put(sid+"", cName);
					if(teamId == tId)
						ally.add(p);
					else
						enemy.add(p);
					
					playerIds += sid + ",";
				}
				users = bsvc.getSummonerNames(playerIds);
			}
			int item0, item1, item2, item3, item4, item5, item6; 
			try {
				item0 = (int)stats.get("item0");
			}catch(Exception e) {
				item0 = 0;
			}
			try {
				item1 = (int)stats.get("item1");
			}catch(Exception e) {
				item1 = 0;
			}
			try {
				item2 = (int)stats.get("item2");
			}catch(Exception e) {
				item2 = 0;
			}
			try {
				item3 = (int)stats.get("item3");
			}catch(Exception e) {
				item3 = 0;
			}
			try {
				item4 = (int)stats.get("item4");
			}catch(Exception e) {
				item4 = 0;
			}
			try {
				item5 = (int)stats.get("item5");
			}catch(Exception e) {
				item5 = 0;
			}
			try {
				item6 = (int)stats.get("item6");
			}catch(Exception e) {
				item6 = 0;
			}
			int[] items = new int[]{item0, item1, item2, item3, item4, item5, item6};
			
			RecentGamesDto rgd = new RecentGamesDto(gameMode, gameType, subType, createDate, kill, death, assist, 
					gamelv, cs, champName, items, ally, enemy, users, spell1, spell2, teamId, win, kda, largestMultiKill);
			
			list.add(rgd);
			
			if(cnt == 5)
				break;
			cnt++;
		}
		
		
		
		return list;
	}
}
