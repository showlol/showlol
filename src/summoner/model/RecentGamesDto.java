package summoner.model;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

public class RecentGamesDto {
	String summonerName;
	String gameMode;
	String gameType;
	String subType;
	long createDate;
	int kill;
	int death;
	int assist;
	int gamelv;
	int cs;
	String champName;
	int[] items;
	List<HashMap> players;
	String spell1;
	String spell2;
	int teamId;
	boolean win;
	float kda;
	int largestMultiKill;
	
	public RecentGamesDto() {
		super();
	}

	public RecentGamesDto(String summonerName, String gameMode, String gameType, String subType, long createDate, int kill, int death, int assist, int gamelv,
			int cs, String champName, int[] items, List<HashMap> players, String spell1, String spell2, 
			int teamId, boolean win, float kda, int largestMultiKill) {
		super();
		this.summonerName = summonerName;
		this.gameMode = gameMode;
		this.gameType = gameType;
		this.subType = subType;
		this.createDate = createDate;
		this.kill = kill;
		this.death = death;
		this.assist = assist;
		this.gamelv = gamelv;
		this.cs = cs;
		this.champName = champName;
		this.items = items;
		this.players = players;
		this.spell1 = spell1;
		this.spell2 = spell2;
		this.teamId = teamId;
		this.win = win;
		this.kda = kda;
		this.largestMultiKill = largestMultiKill;
	}
	
	public String getSummonerName() {
		return summonerName;
	}

	public void setSummonerName(String summonerName) {
		this.summonerName = summonerName;
	}

	public String getGameMode() {
		return gameMode;
	}
	
	public void setGameMode(String gameMode) {
		this.gameMode = gameMode;
	}
	
	public String getGameType() {
		return gameType;
	}

	public void setGameType(String gameType) {
		this.gameType = gameType;
	}
	
	public String getSubType() {
		return subType;
	}
	
	public void setSubType(String subType) {
		this.gameMode = subType;
	}

	public long getCreateDate() {
		return createDate;
	}

	public void setCreateDate(long createDate) {
		this.createDate = createDate;
	}

	public int getKill() {
		return kill;
	}

	public void setKill(int kill) {
		this.kill = kill;
	}

	public int getDeath() {
		return death;
	}

	public void setDeath(int death) {
		this.death = death;
	}

	public int getAssist() {
		return assist;
	}

	public void setAssist(int assist) {
		this.assist = assist;
	}

	public int getGamelv() {
		return gamelv;
	}

	public void setGamelv(int gamelv) {
		this.gamelv = gamelv;
	}

	public int getCs() {
		return cs;
	}

	public void setCs(int cs) {
		this.cs = cs;
	}

	public String getChampName() {
		return champName;
	}

	public void setChampName(String champName) {
		this.champName = champName;
	}

	public int[] getItems() {
		return items;
	}

	public void setItems(int[] items) {
		this.items = items;
	}

	public List<HashMap> getPlayers() {
		return players;
	}

	public void setPlayers(List<HashMap> players) {
		this.players = players;
	}
	
	public String getSpell1() {
		return spell1;
	}

	public void setSpell1(String spell1) {
		this.spell1 = spell1;
	}
	
	public String getSpell2() {
		return spell2;
	}

	public void setSpell2(String spell2) {
		this.spell2 = spell2;
	}
	
	public int getTeamId() {
		return teamId;
	}
	
	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}

	public boolean getWin() {
		return win;
	}

	public void setWin(boolean win) {
		this.win = win;
	}

	public float getKda() {
		return kda;
	}

	public void setKda(float kda) {
		this.kda = kda;
	}

	public int getLargestMultiKill() {
		return largestMultiKill;
	}

	public void setLargestMultiKill(int largestMultiKill) {
		this.largestMultiKill = largestMultiKill;
	}
	
}
