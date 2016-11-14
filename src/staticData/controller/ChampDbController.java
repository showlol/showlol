package staticData.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/db")
public class ChampDbController {
	
	@RequestMapping("/showChampDB")
	public String showChampDB() {
		return null;
	}
}
