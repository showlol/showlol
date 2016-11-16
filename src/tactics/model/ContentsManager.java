package tactics.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import tactics.model.pojo.Tactics;

@Component
public class ContentsManager {
	@Autowired
	SqlSessionFactory fac;
	
	public boolean write(Tactics tac) {
		SqlSession sql = fac.openSession();
		boolean r = sql.insert("tactics.write", tac)==1?true:false;
		sql.close();
		return r;
	}

	public List listPage(int page, int length) {
		Integer[] i = {page, length};
		SqlSession sql = fac.openSession();
		List list = sql.selectList("tactics.page");
		return list;
	}

	public Tactics read(int num) {
		SqlSession sql = fac.openSession();
		Tactics tac = sql.selectOne("tactics.read", num);
		return tac;
	}
	public boolean reply(HashMap map) {
		SqlSession sql = fac.openSession();
		boolean r = sql.insert("tactics.reply", map)==1? true : false;
		return r;
	}
	public List readReply(int parentNum) {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("tactics.readReply", parentNum);
		sql.close();
		return list;
	}
}
