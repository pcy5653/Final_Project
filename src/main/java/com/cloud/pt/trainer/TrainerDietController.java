package com.cloud.pt.trainer;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/trainer/*")
public class TrainerDietController {

	@GetMapping("diet")
	public void getDiet() throws Exception{
		
	}
}
