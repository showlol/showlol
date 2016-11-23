package gameData.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gameData.model.ItemInfoService;

@Controller
@RequestMapping("/gameData")
public class ItemInfoController {
	@Autowired
	ItemInfoService iis;
	
	@RequestMapping("/item")
	@ResponseBody
	public List item(){
		return iis.info();
	}
	@RequestMapping("/item2")
	public String item(Map map){
		map.put("list", iis.info());
		return "tactics/item";
	}
}
