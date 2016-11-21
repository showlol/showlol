package member.model;

import java.util.HashMap;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import member.model.pojo.MemberData;

@Component
public class MemberService {
	@Autowired
	SqlSessionFactory fac;
	
	public boolean register(MemberData data) {
		SqlSession session = fac.openSession();
		boolean r = session.insert("member.regist", data)==1? true : false;
		String uuid = UUID.randomUUID().toString();
		session.close();		
		return r;
	}
}
