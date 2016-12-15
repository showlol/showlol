package common.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import common.model.EtcService;
import common.model.GateService;

@Controller
public class GateController {
	
	@Autowired
	GateService gsvc;
	@Autowired
	EtcService es;
	
	@RequestMapping({"/","index"})
	public ModelAndView gate(@CookieValue(required=false) String hist, @RequestParam(defaultValue="0") int startIdx) {
		ModelAndView mav = new ModelAndView("frontgateMain");
		
		List list = gsvc.getChallenger(startIdx);
		mav.addObject("list", list);
		mav.addObject("startIdx", startIdx);
		
		if(hist != null) {
			try {
				mav.addObject("hist", URLDecoder.decode(hist, "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		
		return mav;
	}
	@RequestMapping("/index/challenger")
	public ModelAndView challenger(int startIdx) {
		ModelAndView mav = new ModelAndView("/summoner/challenger");
		
		List list = gsvc.getChallenger(startIdx);
		mav.addObject("list", list);
		mav.addObject("startIdx", startIdx);
		
		return mav;
	}
	@RequestMapping("/etc")
	@ResponseBody
	public String etc(HttpServletRequest req,  String text1, String text2){
		System.out.println(text1+"/"+text2);
		System.out.println(req.getMethod());
		return "ok";
	}

}
