package community.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tactics.model.ReplyFollowService;

@Controller
@RequestMapping("/community")
public class ReplyFollowController2 {
	@Autowired
	ReplyFollowService rfs;
	
	@RequestMapping("/follow")
	@ResponseBody
	public boolean reFollow(String writer, String follow, String parentNum) {
		HashMap<String, String> map = new HashMap<>();
		map.put("writer", writer);
		map.put("follow", follow);
		map.put("parentNum", parentNum);
		System.out.println(parentNum);
		boolean rf = rfs.refollow(map)==true? true : false;
		return rf;
	}
}
