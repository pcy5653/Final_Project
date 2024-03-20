package com.cloud.pt.leave;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cloud.pt.commons.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/leave/*")
public class LeaveController {
	@Autowired
	private LeaveService leaveService;
	
	@GetMapping("list")
	public void getLeaveList(LeaveVO leaveVO,Model model,Pager pager)throws Exception{
		List<LeaveVO> ll = leaveService.getLeaveList(pager);
		model.addAttribute("pager", pager);
		model.addAttribute("ll", ll);
	}
}
