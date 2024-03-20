package com.cloud.pt.ptLog;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cloud.pt.member.MemVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/trainer/*")
@Slf4j
public class PtLogController {
	
	@Autowired
	private PtLogService ptLogService;

	@GetMapping("ptLog")
	public String getClaendar(@RequestParam(required = false) Long memberNum,@RequestParam(required = false) String memberName,HttpSession session) throws Exception{
		
		 
		  log.info("멤버번호123 : {} >>>>>",memberNum);
		  log.info("이름: {} >>",memberName);
		 session.setAttribute("memberNum", memberNum);
		 session.setAttribute("memberName", memberName);
		return "/trainer/ptLog";
	}
	@GetMapping("addLog")
	public String addLog() throws Exception{
		log.info("2번째 컨트롤러 실행 됨");
		return "redirect:/ptClass/ptList";
	}
	
}
