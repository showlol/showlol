package gameImage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gameImage.model.IconLoadService;

@Controller
public class DataController {
	@Autowired
	IconLoadService ils;
	
	@RequestMapping("/data/rune")
	@ResponseBody
	public List runeData(){
		System.out.println("룬데이터 읽기");
		return ils.runeList;
	}
	@RequestMapping("/data/champ")
	@ResponseBody
	public List champData(){
		return ils.champList;
	}
	@RequestMapping("/data/mastery")
	@ResponseBody
	public List masteryData(){
		return ils.masteryList;
	}
	
}
