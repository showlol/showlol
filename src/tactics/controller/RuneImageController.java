package tactics.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RuneImageController {
	@Autowired
	SqlSessionFactory fac;
	
	@RequestMapping("/rune")
	public String rune(){
		SqlSession sql = fac.openSession();
		List<Integer> list = new ArrayList<>();
		list.add(5003);
		list.add(5007);
		list.add(5009);
		list.add(5011);
		list.add(5013);
		List<String> img = sql.selectList("rune.image", list);
		System.out.println(img.toString());
		return "tactics/rune";
	}
}
