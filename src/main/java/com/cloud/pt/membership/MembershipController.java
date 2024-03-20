package com.cloud.pt.membership;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cloud.pt.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/membership/*")
public class MembershipController {
	@Autowired
	private MembershipService membershipService;
	
	//등록 폼으로 이동
	@GetMapping("form")
	public void setAdd() throws Exception {
	}
	//이용권 등록
	@PostMapping("form")
	public String setAdd(MembershipVO membershipVO) throws Exception {
		int result = membershipService.setAdd(membershipVO);
		
		return "redirect:./list"; 
	}
	
	//이용권 삭제 
	@GetMapping("delete")
	public String setDelete(MembershipVO membershipVO, Model model) throws Exception {
		int result = membershipService.setDelete(membershipVO);
		System.out.println(result);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	//이용권 목록
	@GetMapping("list")
	public String getList(Model model, Pager pager) throws Exception {
		List<MembershipVO> ar = membershipService.getList(pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "membership/list";
	}
}