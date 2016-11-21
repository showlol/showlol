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
	
	public boolean upReply(HashMap map) {
		SqlSession sql = fac.openSession();
		boolean r = sql.update("tactics.upReply", map)==1? true : false;
		return r;
	}
}
