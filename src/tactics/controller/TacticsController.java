package tactics.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import tactics.model.ChampionService;
import tactics.model.ContentsManager;
import tactics.model.pojo.Tactics;

@Controller
@RequestMapping("/tactics")
public class TacticsController {
	@Autowired
	ContentsManager cm;	
	@Autowired
	ChampionService cs;
	
	@RequestMapping("/")
	public String writePage(){
		return "tactics/write";
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
		ModelAndView mav = new ModelAndView("tactics/index");
		mav.addObject("champList", cs.championList());
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("/{name}")
	@ResponseBody
	public List champTactics(@PathVariable String name){
		System.out.println(name+": 寃��깋以�...");
		System.out.println(cm.champTactics(name).toString());
		return cm.champTactics(name);		
	}
	
	@RequestMapping("/read/{num}")
	public ModelAndView read(@PathVariable int num){
		Tactics tac = cm.read(num);
		List list = cm.readReply(num);
		List replyFollow = cm.replyFollow(num);
		ModelAndView mav = new ModelAndView("cm:tactics/read");
		mav.addObject("tactics", tac);
		mav.addObject("readReply", list);
		mav.addObject("replyFollow", replyFollow);
		return mav;
	}
	@RequestMapping("/follow")
	@ResponseBody
	public String reFollow() {
		return null;
	}
	
	@RequestMapping("/mastery")
	public String mastery(){
		return "tactics/mastery";
	}
	@RequestMapping("/reply")
	public String reply(String nick, String area, String parentNum) {
		HashMap<String, String> map = new HashMap<>();
		map.put("nick", nick);
		map.put("area", area);
		map.put("parentNum", parentNum);
		cm.reply(map);
		return null;
	}
}
