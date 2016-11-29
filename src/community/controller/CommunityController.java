package community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@Controller
public class CommunityController {

	@Autowired
	CommunityService cs;
	@Autowired
	ReplyFollowService rfs;

		//커뮤니티게시판 글 읽기
		@RequestMapping("/community/review")
		public ModelAndView review(){
			List list = cs.readall();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("community/main");
			mav.addObject("list",list);
			return mav;
		}
		
		//페이지 관리
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

		// 커뮤니티 글읽기
		@RequestMapping("/community/read/{num}") 
		public ModelAndView cread(@PathVariable int num,HttpSession session){
			CommunityData cd = cs.read(num);
			List<HashMap> list = cs.readReply(num);		
			List followList = rfs.followList();
			List cli = cs.readclick(num);
			ModelAndView mav = new ModelAndView("cm:community/read");
			mav.addObject("cdata", cd);
			mav.addObject("readReply", list);
			mav.addObject("followList", followList);
			mav.addObject("click",cli);
			if(session.getAttribute("nick")!=null){
				if(session.getAttribute("nick").equals(cd.getWriter()) ){			
					session.setAttribute("wdata", cd);
				}		
			}
			return mav;
		}
		//댓글
		@RequestMapping("/community/reply")
		public String reply(String nick, String area, String parentNum) {
			HashMap<String, String> map = new HashMap<>();
			map.put("nick", nick);
			map.put("area", area);
			map.put("parentNum", parentNum);
			cs.reply(map);
			return "redirect:/community/read/"+parentNum;
		}
	
		//좋아요증가
		@RequestMapping("/community/reviewg")
		public ModelAndView reviewDelete(int num){
			ModelAndView mav = new ModelAndView();
			List list = cs.readgood(num); 
			mav.setViewName("community/read");
			mav.addObject("list",list);
			return mav;
		}
		//글쓰기
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
		
		//목록으로
		@RequestMapping("/community/return")
		public String retrun(){
			return "redirect:/community/review2?r=true";
		}
		
		// 글 수정 컨트롤러	
		@RequestMapping("/community/update/{num}")
		public String modifynum(@PathVariable int num, Map map){
			map.put("num", num);
			return "cm:community/updateWrite";
		}
		
		@RequestMapping("/community/writeUpdate2")	
		public String writeUpdate(CommunityData cd){		
			boolean r = cs.updateWrite(cd)? true: false;
			return "redirect:/community/read/"+cd.getNum();
		}
		
		//글삭제 
		@RequestMapping("/community/delete/{num}")
		@ResponseBody
		public boolean delete(@PathVariable int num){
			boolean r = cs.readdelete(num)? true: false;
			return r;
		}
		
		
		
}
