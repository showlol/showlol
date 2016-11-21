package staticJSON.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import staticJSON.model.RuneJSON;

@Controller
@RequestMapping("/JSON")
public class RuneJSONController {
	@Autowired
	RuneJSON rj;
	@RequestMapping("/runePage")	
	public String runeJSONPage(Map map){
		map.put("data", rj.getData());
		return "/JSON/runeJSON";
	}
	@RequestMapping("/rune")
	@ResponseBody
	public Map runeJSON(){		
		return rj.getData();
	}
}
