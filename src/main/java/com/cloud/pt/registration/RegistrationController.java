package com.cloud.pt.registration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.pt.employee.EmployeeVO;

@Controller
@RequestMapping("/registration/*")
public class RegistrationController {
	@Autowired
	private RegistrationService registrationService;
	
	@PostMapping("form")
	public String setAdd(RegistrationVO registrationVO, EmployeeVO employeeVO, Model model) throws Exception {
		int result = registrationService.setAdd(registrationVO, employeeVO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
}
