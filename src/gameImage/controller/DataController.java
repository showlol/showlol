package gameImage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gameImage.model.IconLoadService;

@Controller
@RequestMapping("/data")
public class DataController {
	@Autowired
	IconLoadService ils;
	
	@RequestMapping("/rune")
	@ResponseBody
	public List runeData(){
		System.out.println("룬데이터 읽기");
		return ils.runeList;
	}
	@RequestMapping("/runeTier3")
	@ResponseBody
	public List runeDataTier3(){
		System.out.println("룬데이터 읽기");
		return ils.runeListTier3;
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
	
}
