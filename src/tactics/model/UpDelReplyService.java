package tactics.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UpDelReplyService {
	@Autowired
	SqlSessionFactory fac;
	
	//´ñ±Û ¼öÁ¤
	public boolean upReply(HashMap map) {
		SqlSession sql = fac.openSession();
		boolean r = sql.update("tactics.upReply", map)==1? true : false;
		return r;
	}
	//´ñ±Û »èÁ¦
	public boolean delReply(int num) {
		SqlSession sql = fac.openSession();
		boolean r = sql.delete("tactics.delReply", num)==1? true : false;
		return r;
	}
	//´ë´ñ±Û ¼öÁ¤
	public boolean upReply2(HashMap map) {
		SqlSession sql = fac.openSession();
		boolean r = sql.update("tactics.upReply2", map)==1? true : false;
		return r;
	}
	//´ë´ñ±Û »èÁ¦
	public boolean delReply2(int num) {
		SqlSession sql = fac.openSession();
		boolean r = sql.delete("tactics.delReply2", num)==1? true : false;
		return r;
	}
}
