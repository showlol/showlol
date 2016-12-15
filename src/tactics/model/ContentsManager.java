package tactics.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import tactics.model.pojo.ImprovedTactics;
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
	public int write(ImprovedTactics tac) {
		System.out.println("입력 챔피언 정보");
		System.out.println(tac.toString());
		SqlSession sql = fac.openSession();
		boolean r = sql.insert("tactics.write2", tac)==1?true:false;
		int num=0;
		if(r==true)
			num = sql.selectOne("tactics.currentWrite");
		sql.close();
		System.out.println("지금 글:"+num);
		return num;
	}

	public List listPage(int page, int length) {
		Integer[] i = {page, length};
		SqlSession sql = fac.openSession();
		List list = sql.selectList("tactics.page");
		sql.close();
		return list;
	}

	public ImprovedTactics read(int num) {
		SqlSession sql = fac.openSession();
		ImprovedTactics tac = sql.selectOne("tactics.read", num);		
		sql.close();
		return tac;
	}
	public Map readItem(int num){
		SqlSession sql = fac.openSession();
		Map map  = sql.selectOne("tactics.itemContents", num);		
		sql.close();
		return map;
	}
	
	public boolean reply(HashMap map) {
		SqlSession sql = fac.openSession();
		boolean r = sql.insert("tactics.reply", map)==1? true : false;
		sql.close();
		return r;
	}
	public List readReply(int parentNum) {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("tactics.readReply", parentNum);
		sql.close();
		return list;
	}

	public List champTactics(String name) {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("tactics.champTactics", name);
		System.out.println(list.toString());
		sql.close();
		return list;
	}

	public List bestList() {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("tactics.bestList");
		sql.close();
		return list;
	}
	public boolean modify(ImprovedTactics tac) {
		System.out.println(tac.toString());
		SqlSession sql = fac.openSession();
		boolean r = sql.update("tactics.tacticsModify", tac)==1?true:false;
		sql.close();
		return r;
	}
	public boolean tacticsDel(int num) {
		SqlSession sql = fac.openSession();
		boolean r = sql.delete("tactics.tacticsDel", num)==1?true:false;
		sql.close();
		return r;
	}
	public int recommend(int writeNum, String rec) {
		SqlSession sql = fac.openSession();		
		int num = sql.update("tactics.recommend-"+rec, writeNum);
		System.out.println("추천:"+num);
		sql.close();
		return num;
	}
}
