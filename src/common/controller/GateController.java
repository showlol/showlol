package common.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import common.model.GateService;

@Controller
public class GateController {
	
	@Autowired
	GateService gsvc;
	
	@RequestMapping({"/","index"})
	public ModelAndView gate(@CookieValue(required=false) String hist, @RequestParam(defaultValue="0") int startIdx) {
		ModelAndView mav = new ModelAndView("frontgate");
		
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
}
