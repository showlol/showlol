package staticData.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import gameImage.model.IconLoadService;
import staticJSON.model.RuneJSON;

@Component
public class RuneDetailService {
	@Autowired
	IconLoadService ils;
	@Autowired
	RuneJSON runeJSON;
	
	public String runeAbility(){
		List<RuneData> list = ils.runeListTier3;
		
		return null;
	}
}
