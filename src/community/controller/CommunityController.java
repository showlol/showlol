package community.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import community.model.CommunityData;
import community.model.CommunityService;
import tactics.model.ReplyFollowService;
import tactics.model.pojo.Tactics;

@Controller
public class CommunityController {

	@Autowired
	CommunityService cs;
	@Autowired
	ReplyFollowService rfs;

		//而ㅻ�ㅻ땲�떚寃뚯떆�뙋 湲� �씫湲�
		@RequestMapping("/community/review")
		public ModelAndView review(){
			List list = cs.readall();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("community/main");
			mav.addObject("list",list);
			return mav;
		}
		
		//而ㅻ�ㅻ땲�떚寃뚯떆�뙋 �씫�뼱�삤湲�
		@RequestMapping("/community/review2")
		public ModelAndView review2(@RequestParam(defaultValue="1") int p){
			ModelAndView mav = new ModelAndView();
			int total = cs.readtotal();
			List size = cs.readRange(p,total);
			mav.setViewName("community/main");
			mav.addObject("size",size);
			mav.addObject("total",total);
			mav.addObject("current", p );
			return mav;
		}

		// 而ㅻ�ㅻ땲�떚 湲��씫湲�
		@RequestMapping("/community/read/{num}") 
		public ModelAndView cread(@PathVariable int num){
			CommunityData cd = cs.read(num);
			List<HashMap> list = cs.readReply(num);		
			List followList = rfs.followList();
			List cli = cs.readclick(num);
			ModelAndView mav = new ModelAndView("cm:community/read");
			mav.addObject("cdata", cd);
			mav.addObject("readReply", list);
			mav.addObject("followList", followList);
			mav.addObject("click",cli);
			return mav;
		}
		//�뙎湲�
		@RequestMapping("/community/reply")
		public String reply(String nick, String area, String parentNum) {
			HashMap<String, String> map = new HashMap<>();
			map.put("nick", nick);
			map.put("area", area);
			map.put("parentNum", parentNum);
			cs.reply(map);
			return "redirect:/community/read/"+parentNum;
		}
			
		// 湲��궘�젣
		@RequestMapping("/community/reviewd")
		public ModelAndView reviewlikein(int num){
			ModelAndView mav = new ModelAndView();
			List list = cs.readdelete(num); 
			mav.setViewName("community/read");
			mav.addObject("list",list);
			return mav;
		}
		
		//醫뗭븘�슂利앷�
		@RequestMapping("/community/reviewg")
		public ModelAndView reviewDelete(int num){
			ModelAndView mav = new ModelAndView();
			List list = cs.readgood(num); 
			mav.setViewName("community/read");
			mav.addObject("list",list);
			return mav;
		}
		//湲��벐湲�
		@RequestMapping("/community/writepage")
		public ModelAndView community(){
				ModelAndView mav = new ModelAndView();
				mav.setViewName("community/board");
				return mav;
		}
		
		@RequestMapping("/community/write")
		public String write(CommunityData cd){
			cs.write(cd);
			return "redirect:/community/review2?r=true";
		}
		
		//紐⑸줉�쑝濡�
		@RequestMapping("/community/return")
		public String retrun(){
			return "redirect:/community/review2?r=true";
		}
}
