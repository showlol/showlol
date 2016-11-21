package community.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import tactics.model.pojo.Tactics;

@Component
public class CommunityService {
	@Autowired
	SqlSessionFactory fac;
	
	
	
	//글쓰기
	public boolean write(CommunityData cd){
		SqlSession sql = fac.openSession();
		int i = sql.insert("community.write", cd);
		boolean rst = false;
		if(i == 1)
			rst = true;
		sql.close();
		return rst;
	}
	
	//글리스트 읽어오기
	public List readall(){
		SqlSession sql = fac.openSession();
		List list =  sql.selectList("community.readAll");
		sql.close();
		return list;
	}
	
	
	//글삭제
	public List readdelete(int num){
		SqlSession sql = fac.openSession();
		List list =  sql.selectList("community.delete",num);
		sql.close();
		return list;
	}

	//좋아요증가
	public List readgood(int num){
		SqlSession sql = fac.openSession();
		List list =  sql.selectList("community.upGood", num);
		sql.close();
		return list;
	}
	
	
	//페이지..
	public List readRange(int p, int total) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
			map.put("start", total-(p-1)*5   );
			map.put("end", total-p*5);
		System.out.println(map.toString());
		List m = sql.selectList("community.readRange", map);
		sql.close();
		System.out.println(m.toString());
		return m;
	}
	
	public int readtotal(){
		SqlSession sql = fac.openSession();
		int total = sql.selectOne("community.total");
		sql.close();
		return total;
	}
	
	//글읽기
	public CommunityData read(int num) {
		SqlSession sql = fac.openSession();
		CommunityData cd = sql.selectOne("community.read", num);
		sql.close();
		return cd;
	}
	
	public boolean reply(HashMap map) {
		SqlSession sql = fac.openSession();
		boolean r = sql.insert("community.reply", map)==1? true : false;
		sql.close();
		return r;
	}
	public List readReply(int parentNum) {
		SqlSession sql = fac.openSession();
		List list = sql.selectList("community.readReply", parentNum);
		sql.close();
		return list;
	}

}






















