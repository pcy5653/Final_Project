package com.cloud.pt.registration;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cloud.pt.employee.EmployeeService;
import com.cloud.pt.employee.EmployeeVO;

@Service
public class RegistrationService {
	@Autowired
	private RegistrationDAO registrationDAO;
	
	@Transactional(rollbackFor = Exception.class)
	public int setAdd(RegistrationVO registrationVO, EmployeeVO employeeVO) throws Exception {
		int result = registrationDAO.setAdd(registrationVO);
		
		if(result>0) {
			Map<String, Object> map = new HashMap<>();
			map.put("registration", registrationVO);
			map.put("employee", employeeVO);
			
			result = registrationDAO.setUpdate(map);
		}
		
		return result;
	}
}
