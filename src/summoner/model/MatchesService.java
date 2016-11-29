package summoner.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class MatchesService {
	
	@Autowired
	BasicService bsvc;
	
	// SummonerName�� �̿��Ͽ� �������� ��������
	public List<RecentGamesDto> getGameInfo(LinkedHashMap sinfo) {
		//LinkedHashMap sinfo = bsvc.getSummonerInfo(sname);
		int summonerId = (int)sinfo.get("id");
		String summonerName = (String)sinfo.get("name");
		RestTemplate rt = new RestTemplate();
		
		LinkedHashMap map = new LinkedHashMap<>();
		try{
			map = rt.getForObject("https://kr.api.pvp.net/api/lol/kr/v1.3/game/by-summoner/"+summonerId+"/recent?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09", LinkedHashMap.class);
			
		}catch(Exception e) {
			return null;
		}
		
		ArrayList games = (ArrayList)map.get("games");
		List<RecentGamesDto> list = new ArrayList<>();
		int cnt = 0;
		for(int i=0; i<games.size(); i++) {
			LinkedHashMap data = (LinkedHashMap)games.get(i);
			
			long gameId = (long)data.get("gameId");
			String gameMode = (String)data.get("gameMode");
			String gameType = (String)data.get("gameType");
			String subType = (String)data.get("subType");
			long createDate = (long)data.get("createDate");
			Date cdate = new Date(createDate);
			long curdate = System.currentTimeMillis();
			long dTime = (curdate - createDate) / (1000*60*60);
			int teamId = (int)data.get("teamId");
			LinkedHashMap stats = (LinkedHashMap)data.get("stats");
			boolean win = (boolean)stats.get("win");
			int largestMultiKill;
			try{
				largestMultiKill = (int)stats.get("largestMultiKill");
			}catch(Exception e) {
				largestMultiKill = 0;
			}
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
				kda = (kill + assist) / (float)death;
			
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
			
			ArrayList fellowPlayers = (ArrayList)data.get("fellowPlayers");
			String playerIds = "";
			List<HashMap> players = new ArrayList<>();
			if(fellowPlayers != null) {
				for(int j=0; j<fellowPlayers.size(); j++) {
					LinkedHashMap player = (LinkedHashMap)fellowPlayers.get(j);
					if(j == fellowPlayers.size() - 1)
						playerIds += (int)player.get("summonerId");
					else
						playerIds += (int)player.get("summonerId") + ",";
				}
				LinkedHashMap users = bsvc.getSummonerNames(playerIds); 
				for(int j=0; j<fellowPlayers.size(); j++) {
					LinkedHashMap player = (LinkedHashMap)fellowPlayers.get(j);
					int tId = (int)player.get("teamId");
					int cid = (int)player.get("championId");
					int sid = (int)player.get("summonerId");
					String cName = bsvc.getChampName(cid);
					HashMap p = new HashMap<>();
					p.put("teamId", tId);
					p.put("cName", cName);
					p.put("sid", sid);
					p.put("sName",  users.get(sid+""));
					players.add(p);
				}
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
			
			RecentGamesDto rgd = new RecentGamesDto(gameId, summonerName, gameMode, gameType, subType, dTime, cdate, kill, death, assist, 
					gamelv, cs, champName, items, players, spell1, spell2, teamId, win, kda, largestMultiKill);
			
			list.add(rgd);
			
			if(cnt == 5)
				break;
			cnt++;
		}		
		
		return list;
	}
	
	// ���ӻ����� ��������
	public HashMap getGameDetailInfo(long gid) {
		HashMap resMap = new HashMap<>();
		RestTemplate rt = new RestTemplate();
		String url = "https://kr.api.pvp.net/api/lol/kr/v2.2/match/"+gid+"?api_key=RGAPI-bfc24a92-45bd-44ca-b5f1-dbd022e5e077";
		LinkedHashMap map = new LinkedHashMap<>();
		try {
			map = rt.getForObject(url, LinkedHashMap.class);
		}catch(Exception e) {
			return null;
		}
		
		ArrayList participantIdentities = (ArrayList)map.get("participantIdentities");
		int matchDuration = (int)map.get("matchDuration");
		resMap.put("matchDuration", new Date(matchDuration));
		
		HashMap sNameMap = new HashMap<>();
		for(int i=0; i<participantIdentities.size(); i++) {
			LinkedHashMap data = (LinkedHashMap)participantIdentities.get(i);
			int participantId = (int)data.get("participantId");
			LinkedHashMap player = (LinkedHashMap)data.get("player");
			String summonerName = (String)player.get("summonerName");
			
			sNameMap.put(participantId, summonerName);
		}
		
		List<HashMap> plist = new ArrayList<>();
		ArrayList participants = (ArrayList)map.get("participants");
		for(int i=0; i<participants.size(); i++) {
			LinkedHashMap data = (LinkedHashMap)participants.get(i);
			LinkedHashMap stats = (LinkedHashMap)data.get("stats");
			HashMap participant = new HashMap<>();
			String champid = bsvc.getChampName((int)data.get("championId"));
			participant.put("champName", champid);
			String spell1 = bsvc.getSpellName((int)data.get("spell1Id"));
			String spell2 = bsvc.getSpellName((int)data.get("spell2Id"));
			participant.put("spell1", spell1);
			participant.put("spell2", spell2);
			participant.put("teamId", data.get("teamId"));
			for(int j=0;j<7;j++) {
				try{
					participant.put("item"+j, (int)stats.get("item"+j));
				}catch(Exception e) {
					participant.put("item"+j, 0);
				}
			}
			long kills, deaths, assists;
			try { 
				kills = (int)stats.get("kills");
			}catch (Exception e) {
				kills = 0;
			}
			try { 
				deaths = (int)stats.get("deaths");
			}catch (Exception e) {
				deaths = 0;
			}
			try { 
				assists = (int)stats.get("assists");
			}catch (Exception e) {
				assists = 0;
			}
			float kda = -1;
			if(deaths != 0)
				kda = (kills + assists) / (float)deaths;
			participant.put("kills", kills);
			participant.put("deaths", deaths);
			participant.put("assists", assists);
			participant.put("kda", kda);
			int totalDamageDealtToChampions = (int)stats.get("totalDamageDealtToChampions");
			participant.put("totalDamageDealtToChampions", totalDamageDealtToChampions);
			int wardsPlaced = (int)stats.get("wardsPlaced");
			int wardsKilled = (int)stats.get("wardsKilled");
			participant.put("wardsPlaced", wardsPlaced);
			participant.put("wardsKilled", wardsKilled);
			int minionsKilled = (int)stats.get("minionsKilled");
			int neutralMinionsKilled = (int)stats.get("neutralMinionsKilled");
			int cs = minionsKilled + neutralMinionsKilled;
			participant.put("cs", cs);
			int goldEarned = (int)stats.get("goldEarned");
			participant.put("goldEarned", goldEarned);
			int participantId = (int)data.get("participantId");
			String summonerName = (String)sNameMap.get(participantId);
			participant.put("summonerName", summonerName);
			
			plist.add(participant);
		}
		resMap.put("plist", plist);
		
		return resMap;
	}
	
	public LinkedHashMap getGameDetailInfo2(long gid) {
		RestTemplate rt = new RestTemplate();
		String url = "https://kr.api.pvp.net/api/lol/kr/v2.2/match/"+gid+"?api_key=RGAPI-23040d79-d49d-4850-a32e-a238bbe04e09";
		LinkedHashMap map = rt.getForObject(url, LinkedHashMap.class);
		System.out.println(map);
		return map;
	}
}
