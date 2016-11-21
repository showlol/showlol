package tactics.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tactics.model.UpDelReplyService;

@Controller
@RequestMapping("/tactics")
public class UpDelReplyController {
	@Autowired
	UpDelReplyService urs;
	
	@RequestMapping("/upReply")
	@ResponseBody
	public boolean upReply(String content, String num) {
		HashMap<String, String> map = new HashMap<>();
		map.put("content", content);
		map.put("num", num);
		boolean ur = urs.upReply(map)==true? true : false;
		return ur;
	}
	@RequestMapping("/delReply")
	@ResponseBody
	public boolean delReply(int num) {
		boolean dr = urs.delReply(num)==true? true : false;
		return dr;
	}
}
