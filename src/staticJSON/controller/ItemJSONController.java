package staticJSON.controller;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/JSON")
public class ItemJSONController {
	@RequestMapping("/item")
	@ResponseBody
	public Map item(){
		RestTemplate rest = new RestTemplate();
		LinkedHashMap lhm = rest.getForObject(
			"http://ddragon.leagueoflegends.com/cdn/6.22.1/data/ko_KR/item.json",
			LinkedHashMap.class
		);
//		System.out.println( ((Map)lhm.get("basic")).get("stats").toString() );
		return (Map)lhm;
	}
}
