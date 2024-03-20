package com.cloud.pt.locker;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cloud.pt.member.MemVO;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/locker/*")
@Controller
@Slf4j
public class LockerController {
	@Autowired
	private LockerService lockerService;
	
	@GetMapping("lockerList2")
	public ModelAndView getLockerList(LockerVO lockerVO,MemVO memVO,Model model) throws Exception{
		
		ModelAndView mv = new ModelAndView();
		List<LockerVO> ar = lockerService.getLockerList(lockerVO);
		
		List<MemVO> memberList = lockerService.getUser(memVO);
		mv.addObject("memberList", memberList);
		
		lockerVO.setMemberNum(memVO.getMemberNum()); 
		
		mv.addObject("ar", ar);
		model.addAttribute("memberNum", lockerVO.getMemberNum());
		log.info("리ㅡ스트 : {} >>>>",ar);
		
		mv.setViewName("locker/lockerList2");
		
		return mv;
	}
	
	@PostMapping("addUser")
	public String addUser(LockerVO lockerVO) throws Exception{
		int result = lockerService.addUser(lockerVO);
		log.info("멤버번호: {} >>> " , lockerVO.getMemberNum());
		return "redirect:./lockerList2";
	}
	
	@PostMapping("setRepair")
	public String setRepair(LockerVO lockerVO) throws Exception{
		int result = lockerService.setRepair(lockerVO);
		return "redirect:./lockerList2";
	}
	
	@PostMapping("recoverLocker")
	public String recoverLocker(LockerVO lockerVO) throws Exception{
		int result = lockerService.recoverLocker(lockerVO);
		return "redirect:./lockerList2";
	}
	
	@PostMapping("delUser")
	public String delUser(LockerVO lockerVO) throws Exception{
		
		int result = lockerService.delUser(lockerVO);
		log.info("멤버번호 : {} >>>" ,lockerVO.getMemberNum());
		return "redirect:./lockerList2";
	}
}
