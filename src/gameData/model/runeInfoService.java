package gameData.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import gameData.model.pojo.ImprovedRuneData;

@Component
public class runeInfoService {
	@Autowired
	SqlSessionFactory fac;
	
	public List runeTier3(){
		SqlSession sql = fac.openSession();
		List<ImprovedRuneData> list = sql.selectList("gameData.runeTier3");
		sql.close();
		return list;
	}
}
