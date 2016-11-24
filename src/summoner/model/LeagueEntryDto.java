package summoner.model;

public class LeagueEntryDto {
	String division;
	boolean freshBlood;
	boolean hotStreak; 
	boolean inactive;
	boolean veteran;
	int leaguePoints;
	int wins;
	int losses;
	String playerOrTeamId;
	String playerOrTeamName;
	String progress;
	
	public LeagueEntryDto() {
		super();
	}

	public String getDivision() {
		return division;
	}

	public void setDivision(String division) {
		this.division = division;
	}

	public boolean isFreshBlood() {
		return freshBlood;
	}

	public void setFreshBlood(boolean freshBlood) {
		this.freshBlood = freshBlood;
	}

	public boolean isHotStreak() {
		return hotStreak;
	}

	public void setHotStreak(boolean hotStreak) {
		this.hotStreak = hotStreak;
	}

	public boolean isInactive() {
		return inactive;
	}

	public void setInactive(boolean inactive) {
		this.inactive = inactive;
	}

	public boolean isVeteran() {
		return veteran;
	}

	public void setVeteran(boolean veteran) {
		this.veteran = veteran;
	}

	public int getLeaguePoints() {
		return leaguePoints;
	}

	public void setLeaguePoints(int leaguePoints) {
		this.leaguePoints = leaguePoints;
	}

	public int getWins() {
		return wins;
	}

	public void setWins(int wins) {
		this.wins = wins;
	}

	public int getLosses() {
		return losses;
	}

	public void setLosses(int losses) {
		this.losses = losses;
	}

	public String getPlayerOrTeamId() {
		return playerOrTeamId;
	}

	public void setPlayerOrTeamId(String playerOrTeamId) {
		this.playerOrTeamId = playerOrTeamId;
	}

	public String getPlayerOrTeamName() {
		return playerOrTeamName;
	}

	public void setPlayerOrTeamName(String playerOrTeamName) {
		this.playerOrTeamName = playerOrTeamName;
	}

	public String getProgress() {
		return progress;
	}

	public void setProgress(String progress) {
		this.progress = progress;
	}
	
}


