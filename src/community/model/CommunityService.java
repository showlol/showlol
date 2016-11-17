package community.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
	//리스트 읽어오기
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
	
}






















