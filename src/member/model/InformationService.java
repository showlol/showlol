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
		boolean r = sql.delete("member.delMember", email)==1? true : false;
		return r;
	}
	public boolean delMemCon(String nick) {
		SqlSession sql = fac.openSession();
		boolean r = sql.update("member.delList", nick)==1? true : false;
		return r;
	}
	public boolean delMemRe1(String nick) {
		SqlSession sql = fac.openSession();
		boolean r = sql.update("member.delReMem", nick)==1? true : false;
		return r;
	}
	public boolean delMemRe2(String nick) {
		SqlSession sql = fac.openSession();
		boolean r = sql.update("member.delReMem2", nick)==1? true : false;
		return r;
	}
	public boolean delComu(String nick) {
		SqlSession sql = fac.openSession();
		boolean r = sql.update("member.delComu", nick)==1? true : false;
		return r;
	}
	public boolean delComuRe1(String nick) {
		SqlSession sql = fac.openSession();
		boolean r = sql.update("member.delComuRe1", nick)==1? true : false;
		return r;
	}
	public boolean delComuRe2(String nick) {
		SqlSession sql = fac.openSession();
		boolean r = sql.update("member.delComuRe2", nick)==1? true : false;
		return r;
	}
}
