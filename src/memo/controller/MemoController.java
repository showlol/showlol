package memo.controller;

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

import memo.model.MemoService;

@Controller
public class MemoController {
	
	@Autowired
	MemoService msvc;
	
	// 쪽지 보내기 view
	@RequestMapping("/memo/view/{to}") 
	public ModelAndView memo(@PathVariable String to){
		ModelAndView mav = new ModelAndView("memo/memo");
		mav.addObject("to", to);
		
		return mav;
	}
	// 쪽지 보내기
	@RequestMapping("/memo/write") 
	public ModelAndView writeMemo(String to, String title, String memo, HttpSession session){
		ModelAndView mav = new ModelAndView("memo/close");
		int res = msvc.writeMemo(to, (String)session.getAttribute("nick"), title, memo);
		if(res == 1)
			mav.addObject("res", "성공적으로 보냈습니다.");
		else
			mav.addObject("res", "문제 발생!!");
		
		return mav;
	}
	
	@RequestMapping("/memo/list")
	public ModelAndView list(HttpSession session, @RequestParam(defaultValue="1") int page, 
			@RequestParam(defaultValue="1") int mode){
		ModelAndView mav = new ModelAndView("memo/memoList");
		String nick = (String)session.getAttribute("nick");
		
		List fList = msvc.getMemoFrom(nick, page);
		int fMax = msvc.getMaxPage(msvc.getMemoFromAll(nick));
		List tList = msvc.getMemoTo(nick, page);
		int tMax = msvc.getMaxPage(msvc.getMemoToAll(nick));
		mav.addObject("fList", fList);
		mav.addObject("tList", tList);
		mav.addObject("fMax", fMax);
		mav.addObject("tMax", tMax);
		mav.addObject("mode", mode);
		
		return mav;
	}
	
	@RequestMapping("/memo/read")
	@ResponseBody
	public HashMap read(int idx) {
		return msvc.getMemo(idx);
	}
}
