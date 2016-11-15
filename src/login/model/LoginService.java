package login.model;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.pojo.MemberData;

@Component
public class LoginService {
	@Autowired
	SqlSessionFactory fac;
	
	public MemberData loginservice(MemberData data) {
		SqlSession session = fac.openSession();
		data = session.selectOne("member.data", data);
		session.close();
		return data;
	}
}
