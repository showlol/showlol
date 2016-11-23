package gameImage.model;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import gameData.model.pojo.ImprovedRuneData;
import staticData.model.ChampData;
import staticData.model.ItemData;
import staticData.model.MasteryData;
import staticData.model.RuneData;

@Component
public class IconLoadService {
	@Autowired
	SqlSessionFactory fac;
	
	public List<ChampData> champList;
	public List<RuneData>  runeList;
	public List<RuneData> runeListTier3;
	public List<MasteryData> masteryList;
	public List<ItemData> itemList;
	
	@PostConstruct
	public void init(){
		System.out.print("게임 아이콘 로딩중....");
		SqlSession sql = fac.openSession();
		champList = sql.selectList("staticData.showChampAll");
		runeList = sql.selectList("staticData.showRuneAll");
		masteryList = sql.selectList("staticData.showMasteryAll");
		runeListTier3 = sql.selectList("staticData.showRuneTier3");
		itemList = sql.selectList("staticData.showItemAll");
		sql.close();
		System.out.println("완료");
	}
	
	
}
