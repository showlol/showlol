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
	
	//¥Ò±€ ºˆ¡§
	@RequestMapping("/upReply")
	@ResponseBody
	public boolean upReply(String content, String num) {
		HashMap<String, String> map = new HashMap<>();
		map.put("content", content);
		map.put("num", num);
		boolean ur = urs.upReply(map)==true? true : false;
		return ur;
	}
	//¥Ò±€ ªË¡¶
	@RequestMapping("/delReply")
	@ResponseBody
	public boolean delReply(int num) {
		boolean dr = urs.delReply(num)==true? true : false;
		return dr;
	}
	//¥Î¥Ò±€ ºˆ¡§
	@RequestMapping("/upReply2")
	@ResponseBody
	public boolean upReply2(String content, String num) {
		HashMap<String, String> map = new HashMap<>();
		map.put("content", content);
		map.put("num", num);
		boolean ur = urs.upReply2(map)==true? true : false;
		return ur;
	}
	//¥Î¥Ò±€ ªË¡¶
	//¥Ò±€ ªË¡¶
		@RequestMapping("/delReply2")
		@ResponseBody
		public boolean delReply2(int num) {
			boolean dr = urs.delReply2(num)==true? true : false;
			return dr;
		}
}
