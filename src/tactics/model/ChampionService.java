package tactics.model;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class ChampionService {
	@Autowired
	SqlSessionFactory fac;
	
	public List championList() {
		SqlSession sql = fac.openSession();
		List<HashMap> list = sql.selectList("championData.imageList");
		sql.close();
		System.out.println(list.toString());
		return list;
	}
}
