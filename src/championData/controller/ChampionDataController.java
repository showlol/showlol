package championData.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import championData.model.IndividualChampService;

@Controller
public class ChampionDataController {
	@Autowired
	IndividualChampService ics;
	
	@RequestMapping("/champData/{name}")
	@ResponseBody
	public Object champDataJSON(@PathVariable String name ,Map map){
		System.out.println("champData:"+name);
		return ics.individual(name);
	}
	@RequestMapping("/champDataPage/{name}")
	public String champData(@PathVariable String name ,Map map){
		System.out.println(name);
		map.put("data", ics.individual(name));
		return "champData";
	}
	
	
}
