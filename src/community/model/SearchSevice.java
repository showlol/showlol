package community.model;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SearchSevice {

	@Autowired
	SqlSessionFactory fac;
	
	/*
	public List findwrite(String title){
		SqlSession sql = fac.openSession();
		List li = sql.selectList("community.readTitle",title);
		String ti = "";
		for(int i=0; i<li.size(); i++){
			HashMap map  = (HashMap) li.get(i);
			if(li.get("readTitle").equals(title+""));
		}
			
		sql.close();
		return li;
	}
	
	
	
	*/
	
	

	public List findStartWith(String title){
		SqlSession sql = fac.openSession();
			List li =sql.selectList("community.searchSome", title+"%");
		sql.close();
		return li;
	}
	
	public List findContains(String word){
		SqlSession sql = fac.openSession();
			List li =sql.selectList("community.searchSome", "%"+word+"%");
		sql.close();
		return li;
	}
	
	public List findEndWith(String word){
		SqlSession sql = fac.openSession();
			List li =sql.selectList("community.searchSome", "%" +word);
		sql.close();
		return li;
	}

}
