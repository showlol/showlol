package memo.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MemoService {
	
	@Autowired
	SqlSessionFactory fac;
	
	public int writeMemo(String to, String from, String title, String memo) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("writeTo", to);
		map.put("writeFrom", from);
		map.put("title", title);
		map.put("memo", memo);
		int res = sql.insert("memo.insert", map);
		sql.close();
		
		return res;
	}
	
	public List getMemoFrom(String nick, int startIdx) {
		int start = (startIdx - 1) * 5 + 1;
		int end = startIdx * 5;
		HashMap map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("nick", nick);
		
		SqlSession sql = fac.openSession();
		List list = sql.selectList("memo.selectByFrom", map);
		sql.close();
		
		return list;
	}
	
	public List getMemoFromAll(String nick) {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("memo.selectByFromAll", nick);
		sql.close();
		
		return list;
	}
	
	public List getMemoTo(String nick , int startIdx) {
		int start = (startIdx - 1) * 5 + 1;
		int end = startIdx * 5;
		HashMap map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		map.put("nick", nick);
		
		SqlSession sql = fac.openSession();
		List list = sql.selectList("memo.selectByTo", map);
		sql.close();
		
		return list;
	}
	
	public List getMemoToAll(String nick) {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("memo.selectByToAll", nick);
		sql.close();
		
		return list;
	}
	
	public int getMaxPage(List list) {
		if(list.size() % 5 == 0)
			return list.size() / 5;
		else
			return list.size() / 5 + 1;
	}
	
	public HashMap getMemo(int idx) {
		SqlSession sql = fac.openSession();
		HashMap map = sql.selectOne("memo.selectById", idx);
		sql.close();
		
		return map;
	}
}
