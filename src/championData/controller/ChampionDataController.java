package championData.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import championData.model.IndividualChampService;

@Controller
public class ChampionDataController {
	@Autowired
	IndividualChampService ics;
	
	@RequestMapping("/champData")
	public String champData(Map map){
		map.put("data", ics.individual());
		return "champData";
	}
	
	
}
