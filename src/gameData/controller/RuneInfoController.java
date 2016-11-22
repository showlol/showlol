package gameData.controller;

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
	
	@RequestMapping("/rune")	
	public String runeInfo(Map map){
		ImprovedRuneData im;
		RuneData rd;
		List<ImprovedRuneData> list = ris.runeTier3();
		Map abilMap;
		for(ImprovedRuneData temp: list){
			String[] ar = temp.getDescription().split("/");			
			if(ar.length==2){
				System.out.print("2개짜리:");
				System.out.println(ar[0].indexOf("+")+"/"+ar[1].indexOf("+"));
			}else{
				String[] ar2 = ar[0].split("\\+", 2);
				for(String str : ar2){
					System.out.print(str+"/");
				}
				System.out.println();
			}
		}
			
		map.put("list", list);
		return "tactics/runeData";
	}
}
