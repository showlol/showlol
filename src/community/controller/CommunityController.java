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

		//메인, 글목록리스트
		@RequestMapping("/community/review")
		public ModelAndView review(){
			List list = cs.readall();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("community/main");
			mav.addObject("list",list);
			return mav;
		}
		
		//페이지
		@RequestMapping("/community/review2")
		public ModelAndView review2(@RequestParam(defaultValue="1") int p){
			ModelAndView mav = new ModelAndView();
			int total = cs.readtotal();
			List size = cs.readRange(p,total);
			mav.setViewName("community/main");
			mav.addObject("size",size);
			System.out.println(size.size());
			mav.addObject("total",total);
			mav.addObject("current", p );
			return mav;
		}

		// 커뮤니티글 읽기
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
		//커뮤니티글 댓글달기
		@RequestMapping("/community/reply")
		public String reply(String nick, String area, String parentNum) {
			HashMap<String, String> map = new HashMap<>();
			map.put("nick", nick);
			map.put("area", area);
			map.put("parentNum", parentNum);
			cs.reply(map);
			return "redirect:/community/read/{num}";
		}
			
		// 글삭제
		@RequestMapping("/community/reviewd")
		public ModelAndView reviewlikein(int num){
			ModelAndView mav = new ModelAndView();
			List list = cs.readdelete(num); 
			mav.setViewName("community/read");
			mav.addObject("list",list);
			return mav;
		}
		
		//좋아요 
		@RequestMapping("/community/reviewg")
		public ModelAndView reviewDelete(int num){
			ModelAndView mav = new ModelAndView();
			List list = cs.readgood(num); 
			mav.setViewName("community/read");
			mav.addObject("list",list);
			return mav;
		}
		
		//글쓰기 페이지
		@RequestMapping("/community/writepage")
		public ModelAndView community(){
				ModelAndView mav = new ModelAndView();
				mav.setViewName("community/board");
				return mav;
		}
		
		@RequestMapping("/community/write")
		public String write(CommunityData cd){
			System.out.println(cd);
			cs.write(cd);
			System.out.println(cd.toString());
			return "redirect:/community/review2?r=true";
		}
		
		//글읽기페이지에서 커뮤니티 메인으로
		@RequestMapping("/community/return")
		public String retrun(){
			return "redirect:/community/review2?r=true";
		}
		
		// 쪽지 보내기 view
		@RequestMapping("/community/memo/{to}") 
		public ModelAndView memo(@PathVariable String to){
			ModelAndView mav = new ModelAndView("community/memo");
			mav.addObject("to", to);
			
			return mav;
		}
		// 쪽지 보내기
		@RequestMapping("/community/writeMemo") 
		public String writeMemo(String to, String title, String memo, HttpSession session){
			ModelAndView mav = new ModelAndView("community/memo");
			int res = cs.writeMemo(to, (String)session.getAttribute("nick"), title, memo);
			if(res == 1)
				return "redirect:/community/review2";
			else
				return "community/memo";
		}
		
		@RequestMapping("/community/showMemo")
		public ModelAndView showMemo(String nick) {
			ModelAndView mav = new ModelAndView("community/memoList");
			List list = cs.showMemo(nick);
			mav.addObject("list", list);
			return mav;
		}
}
