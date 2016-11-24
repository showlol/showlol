package gameImage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gameData.model.runeInfoService;
import gameData.model.pojo.ImprovedRuneData;
import gameImage.model.IconLoadService;

@Controller
@RequestMapping("/data")
public class DataController {
	@Autowired
	IconLoadService ils;
	@Autowired
	runeInfoService ris;
	
	@RequestMapping("/rune")
	@ResponseBody
	public List runeData(){
		System.out.println("룬데이터 읽기");
		return ils.runeList;
	}
	
	@RequestMapping("/champ")
	@ResponseBody
	public List champData(){
		return ils.champList;
	}
	@RequestMapping("/mastery")
	@ResponseBody
	public List masteryData(){
		return ils.masteryList;
	}
	@RequestMapping("/runeList")
	public String runeList(Map map){
		map.put("list", ils.runeListTier3);
		return "staticData/runeList";
	}
	
}
