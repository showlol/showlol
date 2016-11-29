package community.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import tactics.model.pojo.ImprovedTactics;
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
	//글읽기
	public CommunityData read(int num) {
		SqlSession sql = fac.openSession();
		CommunityData cd = sql.selectOne("community.read", num);
		sql.close();
		return cd;
	}
	
	//커뮤니티게시판 글일기
	public List readall(){
		SqlSession sql = fac.openSession();
		List list =  sql.selectList("community.readAll");
		sql.close();
		return list;
	}
	
	
	//게시글 삭제
	public boolean readdelete(int num){
		SqlSession sql = fac.openSession();
		boolean r=  sql.delete("community.delete",num)==1?true:false;
		sql.close();
		return r;
	}
	
	//게시글 수정
	public boolean updateWrite(CommunityData cd) {
		System.out.println(cd.toString());
		SqlSession sql = fac.openSession();
		boolean r = sql.update("community.updateWrite", cd)==1?true:false;
		sql.close();
		return r;
	}

	//게시글좋아요
	public List readgood(int num){
		SqlSession sql = fac.openSession();
		List list =  sql.selectList("community.upGood", num);
		sql.close();
		return list;
	}
	
	//조회수증가
	public List readclick(int num){
		SqlSession sql = fac.openSession();
		List list = sql.selectList("community.upClicks",num);
		sql.close();
		return list;
	}
	
	//페이지관리
	public List readRange(int p, int total) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
			map.put("start", (p-1)*5  +1 );
			map.put("end", p*5);
		List m = sql.selectList("community.readRange", map);
		sql.close();
		return m;
	}
	public int readtotal(){
		SqlSession sql = fac.openSession();
		int total = sql.selectOne("community.total");
		sql.close();
		return  total%5==0? total/5 : total/5+1;
	}
	
	// 댓글
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



	






















