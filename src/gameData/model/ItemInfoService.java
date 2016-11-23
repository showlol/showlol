package gameData.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import gameImage.model.IconLoadService;

@Component
public class ItemInfoService {
	@Autowired
	IconLoadService ils;
	
	public List info(){
		return ils.itemList;
	}
}
