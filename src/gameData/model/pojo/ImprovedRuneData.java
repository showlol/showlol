package gameData.model.pojo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import staticData.model.RuneData;

public class ImprovedRuneData extends RuneData{	
	
	String description;
	String[] ability;
	
	List[] abilist = new List[2];	
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	
		String[] ar = getDescription().split("/");
		String name="";
		float num=0;
		if(ar.length==2){
			String[] ar2 = ar[1].split("[%()\\+\\-]+");
			name = ar2[0].trim();
			num = Float.parseFloat(ar2[1]);
			abilist[1] = new ArrayList();
			abilist[1].add(name);
			abilist[1].add(num);
		}
		System.out.println(ar[0]+"/"+ar[0].equals("10초당 골드 +1"));
		if(ar[0].equals("10초당 골드 +1")){
			System.out.println("골드검색");
			name="10초당 골드";
			num = (float)1;
		}else if(ar[0].equals("10초당 +0.25 골드")){
			System.out.println("골드 획득 인장 ");
			name="10초당 골드";
			num = (float)0.25;
		}else{
			String[] ar2 = ar[0].split("[%()\\+\\-]+");
			name = ar2[0].trim();
			num = Float.parseFloat(ar2[1]);
		}
		abilist[0] = new ArrayList();
		abilist[0].add(name);
		abilist[0].add(num);
			
	}
	public String[] getAbility() {
		return ability;
	}
	
	public List[] getAbilist() {
		return abilist;
	}
	public void setAbilist(List[] list ) {
		this.abilist = list;
	}
	
}
