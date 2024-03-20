package com.cloud.pt.commons;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error/*")
public class Error {

	
	@GetMapping("denied")
	public String showAccessDeniedPage()throws Exception{
		return "redirect:/home";
	}
}
