package gameData.model.pojo;

import java.util.HashMap;

import staticData.model.RuneData;

public class ImprovedRuneData extends RuneData{	
	
	String description;
	String[] ability;
	HashMap map;
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
		ability = description.split(" ");
	}
	public String[] getAbility() {
		return ability;
	}
	
	public HashMap getMap() {
		return map;
	}
	public void setMap(HashMap map) {
		this.map = map;
	}
	
	
}
