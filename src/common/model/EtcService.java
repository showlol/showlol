package common.model;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class EtcService {
	
	public Map showPage(){
		RestTemplate rest = new RestTemplate();
		LinkedHashMap lhm = rest.getForObject("http://www.saramin.co.kr/zf_user/recruit/recruit-view?idx=29329453&utm_medium=mail&utm_source=person_clone_avatar&utm_campaign=20161206&utm_term=avatar_recruit",
				LinkedHashMap.class);
		
		return lhm;
	}
}
