package tactics.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import staticData.model.ChampData;
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
	public ModelAndView writePage(@PathVariable String name, @PathVariable String key, HttpSession session){
		if(session.getAttribute("tactics")!=null)
			session.removeAttribute("tactics");
		ModelAndView mav = new ModelAndView("tactics/champ/write.jsp");
		mav.addObject("champData", champDbService.showByName(name));
		return mav;
	}

	
	@RequestMapping("/write")
	@ResponseBody
	public boolean write(Tactics tac){		
		boolean r = cm.write(tac)? true: false;		
		return r;		
	}
	@RequestMapping("/write2")	
	public String write(ImprovedTactics tac){				
		return "redirect:/tactics/read/"+cm.write(tac);		
	}
// 글 수정 컨트롤러	
	@RequestMapping("/modify")
	public String modify(){
		return "t:tactics/modify/";
	}
	
	@RequestMapping("/writeUpdate2")	
	public String writeUpdate(ImprovedTactics tac){		
		System.out.println("공략 수정:");
		boolean r = cm.modify(tac)? true: false;
		return "redirect:read/"+tac.getNum();
	}
	@RequestMapping("/tacticsDel/{num}")
	@ResponseBody
	public boolean tacticsDel(@PathVariable int num){
		boolean r = cm.tacticsDel(num)? true: false;
		return r;
	}
	@RequestMapping("/recommend/{rec}")
	@ResponseBody
	public int recommned(@PathVariable String rec){
		return cm.recommend(rec);
	}
	@RequestMapping("/modMastery")
	public String modMastery(){
		return "tactics/modify/modiMastery";
	}
	
	@RequestMapping("/rune")
	public String modRune(){
		return "tactics/rune";
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
		return cm.champTactics(name);		
	}
	
	@RequestMapping("/read/{num}") // 공략 글 읽기
	public ModelAndView read(@PathVariable int num, HttpSession session){
		ImprovedTactics tac = cm.read(num);
		ChampData champData = champDbService.showByName(tac.getChamp());
		if(session.getAttribute("nick")!=null){
			if(session.getAttribute("nick").equals(tac.getWriter()) ){			
				session.setAttribute("tactics", tac);
				session.setAttribute("champData", champData);
			}		
		}
				
		List<HashMap> list = cm.readReply(num);		
		List followList = rfs.followList();
		ModelAndView mav = new ModelAndView("cm:tactics/read");
		mav.addObject("champData", champData );
		mav.addObject("tactics", tac);
		mav.addObject("readReply", list);
		mav.addObject("followList", followList);
		return mav;
	}
	@RequestMapping("/content/{num}") // 공략 글 읽기
	public ModelAndView content(@PathVariable int num, HttpSession session){
		ImprovedTactics tac = cm.read(num);		
		List<HashMap> list = cm.readReply(num);		
		List followList = rfs.followList();
		ModelAndView mav = new ModelAndView("content");	
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
