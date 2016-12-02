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
		String email = session.selectOne("member.emailCheck", data.getEmail());
		System.out.println("register:"+email);
		if(email!=null){
			return false;
		}
		boolean r = session.insert("member.regist", data)==1? true : false;
		System.out.println("regi:"+r);
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
		System.out.println("UUID생성:"+uuid);
		System.out.println("sendEmail:"+r);
		session.close();
		return uuid;
	}
	public boolean authMail(String email, String uuid) {
		SqlSession session = fac.openSession();
		boolean r=false;
		if(uuid.equals(session.selectOne("member.uuidData", email)) )
			r = true;
		System.out.println("authMail:"+email);
		System.out.println("authMail:"+r);
		session.close();
		return r;
	}
}
