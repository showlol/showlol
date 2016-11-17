package community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import community.model.CommunityData;
import community.model.CommunityService;
import tactics.model.pojo.Tactics;

@Controller
public class CommunityController {

	@Autowired
	CommunityService cs;

	//메인, 글목록리스트
		@RequestMapping("/community/review")
		public ModelAndView review(){
			ModelAndView mav = new ModelAndView();
			List list = cs.readall(); 
			mav.setViewName("community/main");
			mav.addObject("list",list);
			return mav;
		}
		
	// 글삭제
		@RequestMapping("/community/reviewd")
		public ModelAndView reviewlikein(int num){
			ModelAndView mav = new ModelAndView();
			List list = cs.readdelete(num); 
			mav.setViewName("community/main");
			mav.addObject("list",list);
			return mav;
		}
		
	//좋아요 
		@RequestMapping("/community/reviewg")
		public ModelAndView reviewDelete(int num){
			ModelAndView mav = new ModelAndView();
			List list = cs.readgood(num); 
			mav.setViewName("community/main");
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
			return "redirect:/community/review?r=true";
		}
		
		
		
}
