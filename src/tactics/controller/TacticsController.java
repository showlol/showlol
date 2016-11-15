package tactics.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tactics.model.ContentsManager;
import tactics.model.pojo.Tactics;

@Controller
@RequestMapping("/tactics")
public class TacticsController {
	@Autowired
	ContentsManager cm;	
	
	@RequestMapping("/")
	public String writePage(){
		return "tactics/";
	}
	@RequestMapping("/write")
	@ResponseBody
	public boolean write(Tactics tac){		
		boolean r = cm.write(tac)? true: false;		
		return r;		
	}
	@RequestMapping("/{page}/{length}")
	public ModelAndView index(@PathVariable int page, @PathVariable int length){
		List list = cm.listPage(page, length);
		ModelAndView mav = new ModelAndView("cm:tactics/index");
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("/read/{num}")
	public ModelAndView read(@PathVariable int num){
		Tactics tac = cm.read(num);
		ModelAndView mav = new ModelAndView("cm:tactics/read");
		mav.addObject("tactics", tac);
		return mav;
	}
	@RequestMapping("/mastery")
	public String mastery(){
		return "tactics/mastery";
	}
}
