package gameData.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gameData.model.runeInfoService;
import gameData.model.pojo.ImprovedRuneData;
import staticData.model.RuneData;

@Controller
@RequestMapping("/gameData")
public class RuneInfoController {
	@Autowired
	runeInfoService ris;
	
	@RequestMapping("/rune2")	
	public String runeInfo(Map map){
	
		List<ImprovedRuneData> list = ris.runeTier3();
		Map<String, Float> abilMap = new HashMap<>();
		List<Map> abilList = new ArrayList<>();
		for(ImprovedRuneData temp: list){
			String[] ar = temp.getDescription().split("/");
			String name="";
			float num=0;
			if(ar.length==2){
				String[] ar2 = ar[1].split("[%()\\+\\-]+");
				name = ar2[0].trim();
				num = Float.parseFloat(ar2[1]);
				abilMap.put(name, num);
			}
			System.out.println(ar[0]);
			if(ar[0].contains("골드")){
				if(temp.getType().equals("black")){
					name="10초당 골드";
					num = 1;
				}else{
					name="10초당 골드";
					num = (float)0.25;
				}				
			}else{
				String[] ar2 = ar[0].split("[%()\\+\\-]+");
				name = ar2[0].trim();
				num = Float.parseFloat(ar2[1]);
				System.out.println(num);
			}			
			Map am = new HashMap();
			am.put(name, num);
			abilList.add(am);
		}		
			
		map.put("list", abilList);
		return "tactics/runeData";
	}	
	
	@RequestMapping("/runeTier3")
	@ResponseBody
	public List runeDataTier3(){
		System.out.println("룬데이터 읽기");
		return ris.runeTier3();		 
	}
	@RequestMapping("/runeKind")
	@ResponseBody
	public Map runeKind(){
		Map<String, Float> kindMap = new HashMap<>();
		for(ImprovedRuneData ird : ris.runeTier3()){
			List[] listAr = ird.getAbilist();
			if(listAr[1]!=null){
				System.out.println("널첵"+listAr[1].toString());
				kindMap.put((String)listAr[1].get(0), (float)0);
			}
			kindMap.put((String)listAr[0].get(0), (float)0);			
		}
		return kindMap;
	}
	@RequestMapping("/runeAbil")
	@ResponseBody
	public Map runeAbil(){
		Map<Integer, List[]> abilMap = new HashMap<>();
		for(ImprovedRuneData ird : ris.runeTier3()){
			abilMap.put(ird.getId(), ird.getAbilist());			
		}
		return abilMap;
	}
}
