package tactics.controller.read;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tactics.model.ContentsManager;

@Controller
@RequestMapping("/tactics/read")
public class ContentReaderController {
	@Autowired
	ContentsManager cm;
	
	@RequestMapping("/item/{num}")
	@ResponseBody
	public Map item(@PathVariable int num, Map map){
		System.out.println("아이템리더: "+num);		
		return cm.readItem(num);
	}
}
