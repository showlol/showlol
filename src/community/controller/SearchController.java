package community.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import community.model.SearchSevice;

@Controller
public class SearchController {
	
	@Autowired
	SearchSevice ss;
	
	/*
	@RequestMapping()
	@ResponseBody
	public List searchResolve(String q) {
		List li = ss.findStartWith(q);
		// ResopnseBody 객체를 전송을 시킬수가 있다.
		// 단, 라이브러리가 필요. jackson bind
		return li;
	}
	
	@RequestMapping("/file/searchXML.do")
	public ModelAndView searchResolveType2(String q) {
		List li = ss.findStartWith(q);
		// ResopnseBody 객체를 전송을 시킬수가 있다.
		// 단, 라이브러리가 필요. jackson bind
		ModelAndView mav = new ModelAndView();
			mav.addObject("li", li);
			mav.setViewName("community/searchResult");
		return mav;
	}
	*/
	
	@RequestMapping("/community/search")
	public ModelAndView searchwriten(String title){
		ModelAndView mav = new ModelAndView();
		List list = ss.findwrite(title); 
		mav.setViewName("community/main");
		mav.addObject("list",list);
		return mav;
	}

}
