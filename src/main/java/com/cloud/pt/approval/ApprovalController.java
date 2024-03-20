package com.cloud.pt.approval;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.commons.Pager;
import com.cloud.pt.employee.EmployeeVO;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/approval/*")
public class ApprovalController {

	@Autowired
	private ApprovalService approvalService;

	
	@GetMapping("list")
	public void getApprovalList(Model model,Pager pager,ApprovalVO approvalVO,Principal principal) throws Exception{
		approvalVO.setEmployeeNum(principal.getName());
		List<ApprovalVO> al = approvalService.getApprovalAllList(pager,approvalVO);
		model.addAttribute("list", al);
		model.addAttribute("pager", pager);
		Pager pager1 = new Pager();
		List<ApprovalVO> wl = approvalService.getApprovalWatingList(pager1,approvalVO);
		model.addAttribute("wl",wl);
		model.addAttribute("wp",pager1);
		Pager pager2 = new Pager();
		List<ApprovalVO> pl = approvalService.getApprovalProceedingList(pager2,approvalVO);
		model.addAttribute("pl",pl);
		model.addAttribute("pp",pager2);
		Pager pager3 = new Pager();
		List<ApprovalVO> rl = approvalService.getApprovalRejectList(pager3,approvalVO);
		model.addAttribute("rl",rl);
		model.addAttribute("rp",pager3);
		Pager pager4 = new Pager();
		List<ApprovalVO> cl = approvalService.getApprovalCompleteList(pager4,approvalVO);
		model.addAttribute("cl",cl);
		model.addAttribute("cp",pager4);
;	}
	
	@GetMapping("add")
	public void getAdd(Model model) throws Exception{
		List<EmployeeVO> el = approvalService.getAnnualLine();
		model.addAttribute("employeeVO", el);
	}
	@PostMapping("add")
	public String setAdd(ApprovalVO approvalVO) throws Exception{
		int result=approvalService.setAdd(approvalVO);
		return "redirect:./list";
	}
	
	
	@GetMapping("approverList")
	public void getApproverList(Model model,Pager pager,ApprovalVO approvalVO,Principal principal) throws Exception{
		approvalVO.setEmployeeNum(principal.getName());
		List<ApprovalVO> abl = approvalService.getApproverAllBeforeList(pager,approvalVO);
		model.addAttribute("abl", abl);
		model.addAttribute("abpager", pager);
		Pager pager1 = new Pager();
		List<ApprovalVO> aal = approvalService.getApproverAllAfterList(pager1,approvalVO);
		model.addAttribute("aal", aal);
		model.addAttribute("aapager", pager1);
		
		
	}
	
	@GetMapping("tempList")
	public void getTemporaryList(Pager pager,ApprovalVO approvalVO,Principal principal,Model model) throws Exception{
		approvalVO.setEmployeeNum(principal.getName());
		List<ApprovalVO> al = approvalService.getTemporaryList(pager,approvalVO);
		model.addAttribute("list", al);
		model.addAttribute("pager",pager);
		
	}
	
	@GetMapping("detail")
	public void getMyDetail(ApprovalVO approvalVO,Model model)throws Exception{
		
		approvalVO=approvalService.getMyDetail(approvalVO);
		EmployeeVO empVO = new EmployeeVO();
		empVO=approvalService.getMiddleEmployee(approvalVO);
		model.addAttribute("middle", empVO);
		empVO=approvalService.getLastEmployee(approvalVO);
		model.addAttribute("last", empVO);
		model.addAttribute("approvalVO", approvalVO);
	}
	
	@GetMapping("approverDetail")
	public void getApproverDetail(ApprovalVO approvalVO,Model model)throws Exception{
		
		approvalVO=approvalService.getMyDetail(approvalVO);
		EmployeeVO empVO = new EmployeeVO();
		empVO=approvalService.getMiddleEmployee(approvalVO);
		model.addAttribute("middle", empVO);
		empVO=approvalService.getLastEmployee(approvalVO);
		model.addAttribute("last", empVO);
		model.addAttribute("approvalVO", approvalVO);
	}
	
	@PostMapping("tempAdd")
	public String setTempAdd(ApprovalVO approvalVO,Model model)throws Exception{
		int result=approvalService.setTempAdd(approvalVO);
		if(result==1) {
			model.addAttribute("message", "임시저장 되었습니다.");
			model.addAttribute("url", "./list");
		}else {
			model.addAttribute("message", "임시저장 실패");
			model.addAttribute("url", "./list");
		}
		return "commons/result";
		
	}
	@GetMapping("tempDetail")
	public void getTempDetail(ApprovalVO approvalVO,Model model)throws Exception{
		List<EmployeeVO> el = approvalService.getAnnualLine();
		model.addAttribute("employeeVO", el);
		approvalVO=approvalService.getMyDetail(approvalVO);
		EmployeeVO empVO = new EmployeeVO();
		empVO=approvalService.getMiddleEmployee(approvalVO);
		model.addAttribute("middle", empVO);
		empVO=approvalService.getLastEmployee(approvalVO);
		model.addAttribute("last", empVO);
		model.addAttribute("approvalVO", approvalVO);
	}
	@PostMapping("tempUpdate")
	public String setTempUpdate(ApprovalVO approvalVO) throws Exception {
		approvalService.setAdd(approvalVO);
		approvalService.setDelete(approvalVO);
		
		return "redirect:./list";
	}
	@GetMapping("tempDelete")
	public void setTempDelete(@RequestParam(value="results[]")List<String> results,ApprovalVO approvalVO,Model model) throws Exception{
		for(int i=0;i<results.size();i++) {
			approvalVO.setApprovalNum(Long.parseLong(results.get(i)));
			approvalService.setDelete(approvalVO);
		}
	
	}
	
	@GetMapping("signMain")
	public void getSignMain() throws Exception{
		
	}
	@GetMapping("sign")
	public void setSign() throws Exception{
		
	}
	@GetMapping("mySign")
	public void setMySign(EmployeeVO employeeVO,Principal principal,Model model) throws Exception{
		employeeVO.setEmployeeNum(principal.getName());
		EmployeeVO empVO=approvalService.getMySignImage(employeeVO);
		model.addAttribute("file", empVO);
	}
	@PostMapping("signUpload")
	public String setSignUpload(MultipartFile signImage,Principal principal,Model model) throws Exception{
		String empNum=principal.getName();
		int result=approvalService.setSignUpload(signImage,empNum);
		
		model.addAttribute("url", "./mySign");
		model.addAttribute("message", "사인등록완료");
		return "commons/result";
	}
	@PostMapping("middleApproval")
	public String setMiddleApproval(ApprovalVO approvalVO) throws Exception{
		int result=approvalService.setMiddleApproval(approvalVO);
		
		return "redirect:./approverList";
	}
	
	@PostMapping("finalApproval")
	public String setFinalApproval(ApprovalVO approvalVO) throws Exception{
		int result=approvalService.setFinalApproval(approvalVO);
		
		return "redirect:./approverList";
	}
	
	

}
