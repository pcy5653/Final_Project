package com.cloud.pt.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloud.pt.commons.Pager;
import com.cloud.pt.employee.EmployeeService;
import com.cloud.pt.employee.EmployeeVO;
import com.cloud.pt.membership.MembershipService;
import com.cloud.pt.membership.MembershipVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemController {

	@Autowired
	private MemService memService;
	@Autowired
	private MembershipService membershipService;
	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping("list")
	public String getMemberList(MemVO memVO,Pager pager , Model model)throws Exception{
		List<MemVO> ar = memService.getMemberList(memVO, pager);
		List<MembershipVO> msList = membershipService.getList();
		List<EmployeeVO> empList = employeeService.getTrainerList();
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		model.addAttribute("membership", msList);
		model.addAttribute("employee", empList);
		
		return "/member/list";
	}
	
	
	
	@GetMapping("add")
	public void setMemberAdd(MemVO memVO)throws Exception {
		
	}
	
	@PostMapping("add")
	public String setMemberAdd(MemVO memVO,Model model)throws Exception{
		int result = memService.setMemberAdd(memVO);
		
		return "redirect:/member/list";
	}
	
	
	@GetMapping("detail")
	public String getMemberDetail(MemVO memVO, Model model)throws Exception{
		memVO = memService.getMemberDetail(memVO);
		model.addAttribute("member", memVO);
		
		return "/member/detail";
	}
	
	
	@GetMapping("update")
	public void setMemberUpdate(MemVO memVO, Model model)throws Exception{
		memVO = memService.getMemberDetail(memVO);
		model.addAttribute("member", memVO);
	}
	
	@PostMapping("update")
	public String setMemberUpdate(MemVO memVO, RedirectAttributes attributes)throws Exception {
		memVO.setMemberNum(memVO.getMemberNum());
		
		int result = memService.setMemberUpdate(memVO);
		attributes.addAttribute("memberNum", memVO.getMemberNum());
		
		return "redirect:/member/detail";
	}
	
	
	@PostMapping("delete")
	public String setMemberDelete(MemVO memVO)throws Exception{
		
		int result = memService.setMemberDelete(memVO);
		
		return "redirect:/member/list";
	}
}
