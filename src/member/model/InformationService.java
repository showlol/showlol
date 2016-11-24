package member.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import member.model.pojo.MemberData;

@Component
public class InformationService {
	@Autowired
	SqlSessionFactory fac;
	
	public MemberData informationsv(String nick) {
		SqlSession session = fac.openSession();
		MemberData data = session.selectOne("member.info", nick);
		session.close();
		return data;
	}
	public boolean delMem(String email) {
		SqlSession sql = fac.openSession();
		boolean r = sql.delete("member.delMem", email)==1? true : false;
		return r;
	}
}
