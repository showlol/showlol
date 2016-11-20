package tactics.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ReplyFollowService {
	@Autowired
	SqlSessionFactory fac;
	
	public boolean refollow(HashMap map) {
		SqlSession sql = fac.openSession();
		boolean r = sql.insert("tactics.refollow", map)==1? true : false;
		return r;
	}
	public List followList() {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("tactics.replyfollow");
		sql.close();
		return list;
	}
}
