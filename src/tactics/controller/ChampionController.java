package tactics.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import tactics.model.ChampionService;

@Controller
public class ChampionController {
	@Autowired
	ChampionService cs;
	
	@RequestMapping("/champion/list")
	public String championList(Map map){
		map.put("champList", cs.championList());
		return "cm:tactics/read";
	}
}
