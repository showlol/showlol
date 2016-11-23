package staticJSON.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import staticJSON.model.LanguageService;

@Controller
public class LanguageStringController {
	@Autowired
	LanguageService ls;

	@RequestMapping("/language-string")
	@ResponseBody
	public Map language(){
		return ls.data();
	}
}
