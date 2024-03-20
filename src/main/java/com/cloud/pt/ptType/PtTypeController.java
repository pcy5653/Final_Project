package com.cloud.pt.ptType;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cloud.pt.member.MemVO;
import com.cloud.pt.ptLog.PtLogVO;

import lombok.extern.slf4j.Slf4j;



@Controller
@RequestMapping("/trainer/*")
@Slf4j
public class PtTypeController {
	
	@Autowired
	private PtTypeService ptTypeService;
	@GetMapping("ptType")
	public String getTypeList(@RequestParam(required = false) Long eventId,Model model,HttpSession session) throws Exception{
		
		  
		 
		  
		  PtTypeVO ptTypeVO = new PtTypeVO();
		  Long memberNum = (Long)session.getAttribute("memberNum");
		  ptTypeVO.setPtLogNum(eventId);
		  List<PtTypeVO> ar = ptTypeService.getTypeList(ptTypeVO);
		  log.info("로그번호 : {}>>>",ptTypeVO.getPtLogNum() );
		  log.info("멤버번호 : {}>>>",memberNum);
		  model.addAttribute("list", ar); 
		  model.addAttribute("ptLogNum",eventId);
		  
		  
		  return "trainer/ptType";
		 
		
	}
	
	@PostMapping("addType")
	public String addType(PtTypeVO ptTypeVO,Model model) throws Exception{
		
		
		int result = ptTypeService.addType(ptTypeVO);
		model.addAttribute("ptTypeVO", ptTypeVO);
		return "redirect:./ptLog";
	}
	
	@PostMapping("delType")
	public String delType(PtTypeVO ptTypeVO) throws Exception{
		
		int result = ptTypeService.delType(ptTypeVO);
		return "redirect:./ptLog";
	}
	
	@PostMapping("upType")
	public String upType(PtTypeVO ptTypeVO) throws Exception{
		log.info("upType에서 받은 값",ptTypeVO);
		int result = ptTypeService.upType(ptTypeVO);
		return "";
	}
	
	@PostMapping("attendPt")
	public String attendPt(MemVO memVO) throws Exception{
		
		int result = ptTypeService.minusPt(memVO);
		
		return "redirect:../ptClass/myPtList";
	}
	@PostMapping("absentPt")
	public String absentPt(MemVO memVO) throws Exception{
		int result = ptTypeService.minusPt(memVO);
		
		return "redirect:../ptClass/myPtList";
	}
	
	
	
	

	}
