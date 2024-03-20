package com.cloud.pt.main;

import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cloud.pt.approval.ApprovalVO;
import com.cloud.pt.attendance.AttendanceVO;
import com.cloud.pt.employee.EmployeeService;
import com.cloud.pt.employee.EmployeeVO;
import com.cloud.pt.employee.PasswordVO;
import com.cloud.pt.member.MemVO;
import com.cloud.pt.notice.NoticeVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/")
public class HomeController {
	
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private HomeService homeService;
	
	
	
	@GetMapping("home")
	public String getIndex(Model model) throws Exception {
		
		SecurityContext context = SecurityContextHolder.getContext();
		Authentication a = context.getAuthentication();
		
		boolean check = a.getPrincipal().toString().contains("재직");
		if(!check) {
			model.addAttribute("message", "퇴직처리 되었습니다. 그동안 수고 많으셨습니다!");
			model.addAttribute("url", "/");
			return "/commons/result";
		}
		// profile
		System.out.println(a.getPrincipal());
		Object principal = a.getPrincipal();

		if (principal instanceof EmployeeVO) {
		    EmployeeVO employeeVO = (EmployeeVO) principal;
		    
		    String proFileValue = employeeVO.getProFile();
		    System.out.println("proFile value: " + proFileValue);
		    model.addAttribute("emp", proFileValue);
		} else {
		    System.out.println("Principal is not an instance of EmployeeVO");
		}
		
		//공지
		List<NoticeVO> list = homeService.getNoticeList();
		model.addAttribute("list", list);
		
		//차트
		List<HomeVO> chartList = homeService.getMember();
		model.addAttribute("chart", chartList);
		
		//결재관리
		List<ApprovalVO> appList = homeService.getApprovalList(a.getName());
		model.addAttribute("app", appList);
		
		return "home";
	}
	
	@GetMapping("/")
	public String getEmpLogin(@ModelAttribute EmployeeVO employeeVO)throws Exception{
		log.info("{}", passwordEncoder.encode("a12345678*"));
		return "/employee/login";
	}
	
	
	
	@GetMapping("findPw")
	public String getFindPw(@ModelAttribute EmployeeVO employeeVO)throws Exception{
		Authentication con = SecurityContextHolder.getContext().getAuthentication();
		
		return "/employee/findPw";
	}
	
	@PostMapping("/employee/findPw")
	public String getFindPw(EmployeeVO employeeVO,PasswordVO passwordVO, Model model)throws Exception{
		model.addAttribute("phone", employeeVO.getPhone());
		model.addAttribute("employeeNum", employeeVO.getEmployeeNum());
		model.addAttribute("name", employeeVO.getName());
		
		employeeVO = employeeService.getFindPw(employeeVO);
		
		if(employeeVO == null) {
			model.addAttribute("check", 1);
			
			return "/employee/findPw";
		} else {
			model.addAttribute("check", 0);
			//model.addAttribute("pw", employeeVO.getPassword());
			model.addAttribute("phone", employeeVO.getPhone());
			model.addAttribute("employeeNum", employeeVO.getEmployeeNum());
			model.addAttribute("name", employeeVO.getName());
		}
		
		
		return "/employee/findPw";
	}
	
	//비밀번호 변경시 랜덤비밀번호 문자전송
	@GetMapping("phonePw")
	public String phoneFw(@RequestParam("phone") String userPhoneNumber,String employeeNum,@RequestParam("name") String name, EmployeeVO employeeVO,Model model) throws Exception { // 휴대폰 문자보내기
		log.info("phonePw get 들어옴");
		Random random = new Random();
		
		int length = 8;
		log.info("random 찍으러 간다?");
		String randomStr = generateRandomString(length);
		log.info("랜덤 배정!");
		employeeVO.setEmployeeNum(employeeVO.getEmployeeNum());
		employeeVO.setPassword(randomStr);
		employeeVO.setName(employeeVO.getName());
		//System.out.println(randomStr);
		employeeVO.setPassword(randomStr); employeeService.certifiedPhoneNumber(userPhoneNumber, randomStr);
		int result = employeeService.setFindPwUpdate(employeeVO);
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
	
	@GetMapping("attendanceTime")
	@ResponseBody
	public Object getOnOffTime(AttendanceVO attendanceVO)throws Exception{
		attendanceVO = homeService.getOnOffTime(attendanceVO);
		Map<String, Object> map = new HashMap<>();
		
		map.put("time", attendanceVO);
		
		return map;
	}
	
	// 임시비밀번호 랜덤생성
	public static String generateRandomString(int length) {
	    String lowercaseChars = "abcdefghijklmnopqrstuvwxyz";
	    String digitChars = "0123456789";
	    String specialChars = "*@#$%^&+=";
	    
	    SecureRandom random = new SecureRandom(); 
	    StringBuilder randomString = new StringBuilder();
	    
	    // 각각 하나씩 무작위로 추가
	    randomString.append(lowercaseChars.charAt(random.nextInt(lowercaseChars.length())));
	    randomString.append(digitChars.charAt(random.nextInt(digitChars.length())));
	    randomString.append(specialChars.charAt(random.nextInt(specialChars.length())));
	    
	    // 나머지 길이만큼 남은 문자들을 추가
	    for (int i = 3; i < length; i++) {
	        String allChars = lowercaseChars + digitChars + specialChars;
	        randomString.append(allChars.charAt(random.nextInt(allChars.length())));
	    }
	    
	    return randomString.toString();
	}
	
	
	
	// 권한처리 page 이동
	@GetMapping("/accessDenied")
	public String accessDenied()throws Exception{
		return "accessDenied";
	}
	
}
