package com.cloud.pt.restapi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.cloud.pt.employee.EmployeeVO;
import com.cloud.pt.ptClass.PtClassService;
import com.cloud.pt.ptClass.PtClassVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/ptClass/*")
@Slf4j
public class SecheduleRestController {
	
	@Autowired
	private PtClassService ptClassService;
	
	@GetMapping("myClassList")
	public ResponseEntity<List<Map<String, Object >>> getClassList(HttpSession session) throws Exception{
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		log.info("사번 : {} >>>>>>>>>>>>>>>>." ,b.getName()); 
		
		String employeeNum = b.getName();
		
		List<PtClassVO> classList = ptClassService.getMyList(Long.parseLong(employeeNum));
		
		List<Map<String, Object>> classMap = new ArrayList<>();
		
		for(PtClassVO ptClassVO : classList) {
			Map<String,Object> m = new HashMap<>();
			
			m.put("id",ptClassVO.getPtNum());
			m.put("title", ptClassVO.getMemberName());
			m.put("start", ptClassVO.getStartTime());
			m.put("end", ptClassVO.getFinishTime() );
			log.info("멤버번호 : {} >>>>",ptClassVO.getMemberNum());
			classMap.add(m);
		}
		
		return new ResponseEntity<>(classMap,HttpStatus.OK);
		
	}
}
