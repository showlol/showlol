package common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GateController {
	@RequestMapping({"/","index"})
	public String gate() {
		return "cm:layout";
	}
}
