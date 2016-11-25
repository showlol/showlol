package common.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GateController {
	@RequestMapping({"/","index"})
	public ModelAndView gate(@CookieValue(required=false) String hist) {
		ModelAndView mav = new ModelAndView("frontgate");
		
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
