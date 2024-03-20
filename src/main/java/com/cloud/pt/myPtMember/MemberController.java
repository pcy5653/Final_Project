package com.cloud.pt.myPtMember;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cloud.pt.commons.Pager;
import com.cloud.pt.employee.EmployeeVO;
import com.cloud.pt.member.MemVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/ptClass/*")
@Slf4j
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	
	/*
	 * @GetMapping("myPtList") public void getPtList(Model model,MemVO memberVO)
	 * throws Exception{
	 * 
	 * List<MemVO> ar = memberService.getPtList(memberVO);
	 * model.addAttribute("list", ar);
	 * 
	 * }
	 */
	@GetMapping("myPtList")
	public ModelAndView getList(HttpSession session, Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		log.info("사번 : {} >>>>>>>>>>>>>>>>." ,b.getName());
		
		

			EmployeeVO employeeVO = new EmployeeVO();
			employeeVO.setEmployeeNum(b.getName());
			List<MemVO> ar = memberService.getPtList(employeeVO, pager);
			log.info("startRow: {} >>",pager.getStartRow());
			
			mv.addObject("list", ar);
			mv.addObject("pager", pager);
			
			mv.setViewName("ptClass/myPtList");
			

		
		return mv;
	    
			
		
		
	}
}
