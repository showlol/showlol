package summoner.model;

public class PlayerDto {
	String champName;
	String summonerName;
	int teamId;
	
	public PlayerDto(String champName, String summonerName, int teamId) {
		super();
		this.champName = champName;
		this.summonerName = summonerName;
		this.teamId = teamId;
	}

	public String getChampName() {
		return champName;
	}

	public void setChampName(String champName) {
		this.champName = champName;
	}

	public String getSummonerName() {
		return summonerName;
	}

	public void setSummonerName(String summonerName) {
		this.summonerName = summonerName;
	}

	public int getTeamId() {
		return teamId;
	}

	public void setTeamId(int teamId) {
		this.teamId = teamId;
	}
	
}
