package member.model;

import java.util.HashMap;
import java.util.List;
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
		session.close();		
		return r;
	}
	public String sendEmail(String email) {
		SqlSession session = fac.openSession();
		String uuid = UUID.randomUUID().toString();
		HashMap<String, String> map = new HashMap<>();
		map.put("email", email);
		map.put("uuid", uuid);
		boolean r = session.insert("member.sendEmail", map)==1? true : false;
		session.close();
		return uuid;
	}
	public List authMail(String email) {
		SqlSession session = fac.openSession();
		List list = session.selectList("member.uuidData");
		session.close();
		return list;
	}
}
