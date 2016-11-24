package tactics.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import gameImage.model.IconLoadService;
import staticData.model.ChampDbService;
import tactics.model.ChampionService;
import tactics.model.ContentsManager;
import tactics.model.ReplyFollowService;
import tactics.model.pojo.ImprovedTactics;
import tactics.model.pojo.Tactics;

@Controller
@RequestMapping("/tactics")
public class TacticsController {
	@Autowired
	ContentsManager cm;	
	@Autowired
	ChampionService cs;
	@Autowired
	ReplyFollowService rfs;
	@Autowired
	ChampDbService champDbService;
	
	@RequestMapping("/regArticle/{name}/{key}")
	public String writePage(@PathVariable String name, @PathVariable String key){
		return "tactics/champ/write.jsp?champ="+name+"&key="+key;
	}
	@RequestMapping("/write")
	@ResponseBody
	public boolean write(Tactics tac){		
		boolean r = cm.write(tac)? true: false;		
		return r;		
	}
	@RequestMapping("/write2")
	@ResponseBody
	public boolean write(ImprovedTactics tac){		
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
	@RequestMapping("/")
	public ModelAndView bestList(){		 		
		ModelAndView mav = new ModelAndView("tactics/index");
		mav.addObject("champList", cs.championList());
		mav.addObject("list", cm.bestList());
		return mav;
	}
	@RequestMapping("/{name}") // 챔프별 공략
	@ResponseBody
	public List champTactics(@PathVariable String name){
		System.out.println(cm.champTactics(name).toString());
		return cm.champTactics(name);		
	}
	
	@RequestMapping("/read/{num}") // 공략 글 읽기
	public ModelAndView read(@PathVariable int num){
		ImprovedTactics tac = cm.read(num);		
		List<HashMap> list = cm.readReply(num);		
		List followList = rfs.followList();
		System.out.println("tacName:"+tac.getChamp());
		System.out.println(champDbService.showByName(tac.getChamp()).getImage1());
		ModelAndView mav = new ModelAndView("cm:tactics/read");
		mav.addObject("champData", champDbService.showByName(tac.getChamp()) );
		mav.addObject("tactics", tac);
		mav.addObject("readReply", list);
		mav.addObject("followList", followList);
		return mav;
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
		return "redirect:/tactics/read/"+parentNum;
	}
}
