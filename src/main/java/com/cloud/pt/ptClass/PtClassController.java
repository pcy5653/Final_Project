package com.cloud.pt.ptClass;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.cloud.pt.employee.EmployeeVO;
import com.cloud.pt.myPtMember.MemberVO;
import com.cloud.pt.ptLog.PtLogService;
import com.cloud.pt.ptLog.PtLogVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/ptClass/*")
@Slf4j
public class PtClassController {
	
	@Autowired
	private PtClassService ptClassService;
	
	@Autowired
	private PtLogService ptLogService;
	
	@GetMapping("ptList") 
	  public String getCalendar() throws Exception{
		
	
		
		return "ptClass/ptList";
	  }
	
		/*
		 * @ResponseBody
		 * 
		 * @PostMapping("addClass") public String addClass(PtClassVO ptClassVO )throws
		 * Exception{
		 * 
		 * ptClassService.addClass(ptClassVO);
		 * 
		 * String st = "ptClass/ptList"; return st;
		 * 
		 * }
		 */
	  @GetMapping("addClass")
	  public ModelAndView addClass(
			  @RequestParam("memberNum") String memberNum, 
              @RequestParam("employeeNum") String employeeNum, 
              @RequestParam("memberName") String memberName, 
              HttpSession session) throws Exception{
		  
		  ModelAndView mv = new ModelAndView();
		  log.info("사번 : {} >>>>>" , employeeNum);
		  log.info("멤버번호 : {} >>>>", memberNum);
		  log.info("멤버이름 : {} >>>" , memberName);
		  mv.addObject("memberNum", memberNum);
	      mv.addObject("employeeNum", employeeNum);
	      mv.addObject("memberName", memberName);
		  mv.setViewName("ptClass/addClass");
		  return mv;
	  }
	
	  @PostMapping("addClass") 
	  public ModelAndView addClass(PtClassVO ptClassVO,HttpSession session,PtLogVO ptLogVO) throws Exception{
		  ModelAndView mv = new ModelAndView();
			
			/*
			 * log.info("사번 : {} >>>>>" , ptClassVO.getEmployeeNum());
			 * log.info("멤버번호 : {} >>>>", ptClassVO.getMemberNum());
			 * log.info("멤버이름 : {} >>>" , ptClassVO.getName());
			 */
			 
		  
		  int result = ptClassService.addClass(ptClassVO);
		  
		  ptLogVO.setEmployeeNum(ptClassVO.getEmployeeNum());
		  ptLogVO.setMemberNum(ptClassVO.getMemberNum());
		  ptLogVO.setPtDate(ptClassVO.getStartTime());
		  
		  int result2 = ptLogService.addLog(ptLogVO); 
		  mv.addObject("ptClassVO", ptClassVO);
		  mv.setViewName("redirect:./ptList");
		  
		  log.info("수업시간 : {} >>" , ptClassVO.getStartTime());
		  log.info("운동시간 : {} >>>", ptLogVO.getPtDate());
			/*
			 * String addLogUrl = "http://localhost:82/trainer/addLog"; HttpHeaders headers
			 * = new HttpHeaders(); headers.setContentType(MediaType.APPLICATION_JSON);
			 * HttpEntity<PtClassVO> requestEntity = new HttpEntity<>(ptClassVO, headers);
			 * 
			 * RestTemplate restTemplate = new RestTemplate(); ResponseEntity<String>
			 * response = restTemplate.exchange(addLogUrl, HttpMethod.POST, requestEntity,
			 * String.class);
			 * 
			 * // 성공적으로 요청이 수행되었는지 확인 if (response.getStatusCode() == HttpStatus.OK) { // 요청
			 * 성공 시 처리할 코드 작성 // ... log.info("addLog 컨트롤러 호출에 성공했습니다."); }
			 */
		  //addLog컨트롤러 호출
		  
			/*
			 * HttpHeaders headers = new HttpHeaders();
			 * headers.setContentType(MediaType.APPLICATION_JSON);
			 * 
			 * HttpEntity<String> requestEntity = new HttpEntity<>(headers);
			 * 
			 * String addLogUrl = "http://localhost:82/trainer/addLog"; RestTemplate
			 * restTemplate = new RestTemplate(); ResponseEntity<String> response =
			 * restTemplate.exchange(addLogUrl, HttpMethod.POST, requestEntity,
			 * String.class);
			 * 
			 * if (response.getStatusCode() == HttpStatus.OK) { // 두 번째 컨트롤러가 성공적으로 호출되었을 때
			 * 실행할 코드 // ... log.info("성공");
			 * 
			 * }
			 */
		 
	  return mv; 
	  
	  }
	  @PostMapping("delClass")
	  public String delClass(PtClassVO ptClassVO,PtLogVO ptLogVO) throws Exception{
		  
		  
		  
		  ptClassService.delClass(ptClassVO);
		 
		  log.info("수업시간1 : {} >>" , ptClassVO.getStartTime());
		  log.info("운동시간1 : {} >>>", ptLogVO.getPtDate());
		  return "redirect:./ptList";
	  }
	  
	  
	 

}