package com.cloud.pt.attendance;

import java.security.Principal;
import java.sql.Date;
import java.time.LocalDate;
import java.time.YearMonth;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.pt.commons.Pager;
import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AttendanceController {
	@Autowired
	private AttendanceService attendanceService;

	@ResponseBody
	@GetMapping("/attendance/month")
	public List<Map<String, Object>> monthAttendance(@AuthenticationPrincipal EmployeeVO employeeVO) throws Exception {
		//List<Map<String, Object>>의 자료형으로 보낼시 자동으로 JSON으로 변경됨
		return attendanceService.getList(employeeVO);
	}
	
	@ResponseBody
	@GetMapping("/admin/attendance/month")
	public List<Map<String, Object>> monthAttendance() throws Exception {
		return attendanceService.getAdminList();
	}
	
	@ResponseBody
	@GetMapping("/resources")
	public List<Map<String, Object>> resources() throws Exception {
		return attendanceService.getResources();
	}
	
	@GetMapping("/attendance/info")
	public String getInfo(@AuthenticationPrincipal EmployeeVO employeeVO, Model model) throws Exception {
		AttendanceVO attendanceVO = attendanceService.getInfo(employeeVO);
		model.addAttribute("vo", attendanceVO);
		
		return "attendance/info";
	}
	
	@GetMapping("/attendance/on")
	public String setOn(Principal principal, Model model) throws Exception {
		String employeeNum = principal.getName();
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEmployeeNum(employeeNum);
		
		if(attendanceService.getInfo(employeeVO) == null) {
			model.addAttribute("result", 0);
		}else {
			model.addAttribute("result", 1);
		}
		
		return "commons/ajaxResult";
	}
	
	@PostMapping("/attendance/on")
	public String setOn(@AuthenticationPrincipal EmployeeVO employeeVO, Model model) throws Exception {
		int result = attendanceService.setOn(employeeVO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	@GetMapping("/attendance/off")
	public String setOff(Principal principal, Model model) throws Exception {
		String employeeNum = principal.getName();
		EmployeeVO employeeVO = new EmployeeVO();
		employeeVO.setEmployeeNum(employeeNum);

		if(attendanceService.getInfo(employeeVO) != null) {
			if(attendanceService.getInfo(employeeVO).getOffTime() != null)
				model.addAttribute("result", 1);
		}else {
			model.addAttribute("result", 0);
		}
		
		return "commons/ajaxResult";
	}
	
	@PostMapping("/attendance/off")
	public String setOff(@AuthenticationPrincipal EmployeeVO employeeVO, Model model) throws Exception {
		int result = attendanceService.setOff(employeeVO);
		model.addAttribute("result", result);
		
		return "commons/ajaxResult";
	}
	
	//관리자----------------------------------------------------------
	@GetMapping("/admin/attendanceModify/detail")
	public String getDetail(AttendanceModifyVO attendanceModifyVO, Model model) throws Exception {
		attendanceModifyVO = attendanceService.getRequest(attendanceModifyVO);
		model.addAttribute("vo", attendanceModifyVO);
		
		return "attendance/adminDetail";
	}
	
	@GetMapping("/admin/attendanceModify/update")
	public String setUpdate(AttendanceModifyVO attendanceModifyVO, Model model) throws Exception {
		attendanceModifyVO = attendanceService.getRequest(attendanceModifyVO);
		model.addAttribute("vo", attendanceModifyVO);
		
		return "attendance/adminForm";
	}
	
	@GetMapping("/admin/attendanceModify/list")
	public String getList(Model model, Pager pager) throws Exception {
		List<AttendanceModifyVO> ar = attendanceService.getRequestList(pager);

		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "attendance/adminList";
	}
	
	@PostMapping("/admin/attendanceModify/update")
	public String setUpdate(AttendanceVO attendanceVO, AttendanceModifyVO attendanceModifyVO) throws Exception {
//		log.info("attendanceVO: {}", attendanceVO);
//		log.info("attendanceModifyVO: {}", attendanceModifyVO);
		
		int result = attendanceService.setUpdate(attendanceVO, attendanceModifyVO);
		
		return "redirect:/admin/attendance";
	}
	
	@GetMapping("/admin/attendance")
	public String getAdminHome(Model model) throws Exception {

		return "attendance/adminInfo";
	}
	
	@GetMapping("/admin/attendance/day")
	public String getAdminDay(AttendanceVO attendanceVO, Model model, Pager pager) throws Exception {
		log.info("vo: {}", attendanceVO);
		List<AttendanceVO> ar = attendanceService.getDayList(attendanceVO, pager);
	//	long currentTimeMillis = System.currentTimeMillis();
    //  Date currentSqlDate = new Date(currentTimeMillis); //헌재 날짜 
        
    //    model.addAttribute("date", currentSqlDate);
		model.addAttribute("attendance", attendanceVO);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "attendance/adminDay";
	}
	
	//-----------------------------------------------------------
	@GetMapping("/attendanceModify/detail")
	public String getModifyDetail(AttendanceModifyVO attendanceModifyVO, Model model) throws Exception {
		attendanceModifyVO = attendanceService.getModifyDetail(attendanceModifyVO);
		model.addAttribute("vo", attendanceModifyVO);
		
		return "attendance/detail";
	}
	
	@GetMapping("/attendanceModify/list")
	public String getModifyList(@AuthenticationPrincipal EmployeeVO employeeVO, Model model, Pager pager) throws Exception {
		List<AttendanceModifyVO> ar = attendanceService.getModifyList(employeeVO, pager);
		model.addAttribute("list", ar);
		model.addAttribute("pager", pager);
		
		return "attendance/list";
	}

	@GetMapping("/attendanceModify/add")
	public String setModifyAdd() throws Exception {
		
		return "attendance/form";
	}
	
	@PostMapping("/attendanceModify/add")
	public String setModifyAdd(AttendanceModifyVO attendanceModifyVO, EmployeeVO employeeVO, Model model) throws Exception {
		int result = attendanceService.setModifyAdd(attendanceModifyVO, employeeVO);
		String message = null;
		if(result==0) {
			message="근태수정요청이 이미 존재합니다";
		}else if(result==-1){
			message="당일 근태수정요청은 퇴근이후 가능합니다";
		}else {
			message="근태수정요청이 등록되었습니다";
		}
		model.addAttribute("message", message);
		model.addAttribute("url", "/attendanceModify/list");
		
		return "commons/result";
	}
	
}
