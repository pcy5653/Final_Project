
package com.cloud.pt.employee;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cloud.pt.commons.Pager;

import lombok.extern.slf4j.Slf4j;
//import net.nurigo.sdk.NurigoApp;
//import net.nurigo.sdk.message.service.DefaultMessageService;

@Slf4j
@Controller
@RequestMapping("/employee/*")
public class EmployeeController {
	
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
	
	@GetMapping("info")
	public void getInfo(Principal principal, EmployeeVO employeeVO,PasswordVO passwordVO, Model model)throws Exception{	
		employeeVO.setEmployeeNum(principal.getName());
		
		employeeVO = employeeService.getInfo(employeeVO);
		
		model.addAttribute("employeeVO", employeeVO);
		model.addAttribute("passwordVO", passwordVO);
	}
	
	
	// 마이페이지 본인 정보 수정
	@GetMapping("infoUpdate")
	public void setInfoUpdate(@AuthenticationPrincipal EmployeeVO employeeVO, CareerVO careerVO, CertificationVO certificationVO, Model model)throws Exception{
		// update 전 검증 정보
		employeeVO = employeeService.getInfo(employeeVO);
		
		model.addAttribute("employeeVO", employeeVO);
	}
	
	@PostMapping("infoUpdate")
	public String setInfoUpdate
	(@Valid EmployeeVO employeeVO,BindingResult bindingResult, RedirectAttributes attributes, MultipartFile empfile, CareerVO careerVO, CertificationVO certificationVO)
					throws Exception{
		// update 후 검증 진행
		boolean check = employeeService.getEmpCaCerError(employeeVO,careerVO, certificationVO, bindingResult);
		if(check) {
			log.info("==========================검증 에러 ===================");
			attributes.addAttribute("employeeNum", employeeVO.getEmployeeNum());
			return "/employee/infoUpdate";
		}	

		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO emp = (EmployeeVO)obj;
		employeeVO.setEmployeeNum(emp.getEmployeeNum());
	
		int result = employeeService.setInfoUpdate(employeeVO, empfile);

		attributes.addAttribute("employeeNum", employeeVO.getEmployeeNum());
		return "redirect:/employee/info";
	}
	
	
	// 마이페이지 (경력 업데이트)
	@GetMapping("infoCareerUpdate")
	@ResponseBody
	public List<CareerVO> getInfoCareer(CareerVO careerVO, @AuthenticationPrincipal EmployeeVO employeeVO, Model model)throws Exception{
		log.info("get으로 들어옴");
		careerVO.setEmployeeNum(employeeVO.getEmployeeNum());
		log.info("NUM : {}", careerVO.getEmployeeNum());
		List<CareerVO> ar = employeeService.getInfoCareer(careerVO);
		//model.addAttribute("career", ar);
		//log.info("career List : {}", ar);
		return ar;
	}
	
	@PostMapping("infoCareerUpdate")
	public String setInfoCareerUpdate(CareerVO careerVO, @AuthenticationPrincipal EmployeeVO employeeVO, Model model)throws Exception{
		careerVO.setEmployeeNum(employeeVO.getEmployeeNum());
		
		log.info("title : {}", careerVO.getCaTitle());
		log.info("date : {}", careerVO.getCaPassDate());
		log.info("num : {}", careerVO.getEmployeeNum());
		
		int result = employeeService.setInfoCareerUpdate(careerVO);
		
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}
	
	
	// 마이페이지 (자격증 업데이트)
	@GetMapping("infoCertificationUpdate")
	@ResponseBody
	public List<CertificationVO> getInfoCertification(CertificationVO certificationVO, @AuthenticationPrincipal EmployeeVO employeeVO, Model model)throws Exception{
		log.info("get으로 들어옴");
		certificationVO.setEmployeeNum(employeeVO.getEmployeeNum());
		log.info("NUM : {}", certificationVO.getEmployeeNum());
		List<CertificationVO> ar = employeeService.getInfoCertification(certificationVO);
		//model.addAttribute("career", ar);
		//log.info("career List : {}", ar);
		return ar;
	}
	
	@PostMapping("infoCertificationUpdate")
	public String setInfoCertificationUpdate(CertificationVO certificationVO, @AuthenticationPrincipal EmployeeVO employeeVO, Model model)throws Exception{
		certificationVO.setEmployeeNum(employeeVO.getEmployeeNum());
		
		log.info("title : {}", certificationVO.getCerTitle());
		log.info("date : {}", certificationVO.getCerPassDate());
		log.info("num : {}", certificationVO.getEmployeeNum());
		
		int result = employeeService.setInfoCertificationUpdate(certificationVO);
		
		model.addAttribute("result", result);
		return "commons/ajaxResult";
	}

	
	// 비밀번호 수정
	@PostMapping("updatePw")
	public String setPwUpdate(@Valid PasswordVO passwordVO, BindingResult bindingResult, @AuthenticationPrincipal EmployeeVO employeeVO, Model model)throws Exception{
		
		String inputPw = passwordVO.getInputPw(); //JSP로부터 넘겨받은 입력한 기존비밀번호
			
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();	
		
		if(encoder.matches(inputPw, employeeVO.getPassword())) {//넘겨받은 비밀번호와 EMP의 암호화된 비밀번호와 비교
			
			boolean check = employeeService.getNewPwCheck(passwordVO, bindingResult);
			if(bindingResult.hasErrors() || check) {
				// 파라미터로 error 넣어 Front에서 tab 전환 js 사용
				model.addAttribute("error", "true");
				return "/employee/info";
			}

			int result = employeeService.setPwUpdate(employeeVO, passwordVO);
		}else {
			bindingResult.rejectValue("inputPw", "employeeVO.password.inputPw");
			
			model.addAttribute("error", "true");
			return "/employee/info";
		}
		model.addAttribute("employeeVO", employeeVO);
		model.addAttribute("message","새로운 비밀번호로 다시 로그인해주세요!");
		model.addAttribute("url","/");
		return	"commons/result"; 
	}
	
	
	
	// 직원 회원가입
	@GetMapping("join")
	public void setJoin(@ModelAttribute EmployeeVO employeeVO)throws Exception{
		
	}
	
	@PostMapping("join")
	public String setJoin(@Valid EmployeeVO employeeVO,BindingResult bindingResult,Errors errors ,Model model, MultipartFile empfile)throws Exception{
		employeeVO.setPassword("a12345678*");
		
		boolean check = employeeService.getEmpError(employeeVO, bindingResult);
		if(check) {
			log.info("==========================검증 에러 ===================");
			return "employee/join";
		}
		
		// 성공되는 검증
//		if(errors.hasErrors()) {
//			model.addAttribute("employeeVO", employeeVO);
//			
//			Map<String,String> validatorResult = employeeService.validateHandling(errors);
//			for(String key : validatorResult.keySet()) {
//				model.addAttribute(key, validatorResult.get(key));
//			}
//			return "/employee/join";
//		}
		
		int result = employeeService.setJoin(employeeVO,empfile);
		
		employeeVO.setEmployeeNum(employeeVO.getEmployeeNum());
		
		String userPhoneNumber = employeeVO.getPhone();
		String employeeNum = employeeVO.getEmployeeNum();
		String password = "a12345678*";
		
		log.info(userPhoneNumber);
		log.info(employeeNum);
		
		employeeService.sendJoin(userPhoneNumber, employeeNum, password);
		
		return "redirect:/employee/list";
	}
	
	
	// 직원 CRUD
	@GetMapping("list")
	public String getEmpList(EmployeeVO employeeVO, Pager pager, Model model)throws Exception{
		List<EmployeeVO> ar = employeeService.getEmpList(employeeVO, pager);
		model.addAttribute("list", ar);
		
		if(pager.getSearch().equals("ROLE_CEO")) {
			pager.setSearch("대표");
		}else if(pager.getSearch().equals("ROLE_GENERAL")) {
			pager.setSearch("총괄");
		}else if(pager.getSearch().equals("ROLE_CUSTOMER")) {
			pager.setSearch("고객");
		}else if(pager.getSearch().equals("ROLE_RESOURCES")) {
			pager.setSearch("인사");
		}else if(pager.getSearch().equals("ROLE_FACILITY")) {
			pager.setSearch("시설");
		}else if(pager.getSearch().equals("ROLE_TRAINER")) {
			pager.setSearch("트레이너");
		}else if(pager.getSearch().equals("ROLE_EX")) {
			pager.setSearch("가발령");
		}
		model.addAttribute("pager", pager);
		return "/employee/list";
	}
	
	
	@GetMapping("detail")
	public String getEmpDetail(EmployeeVO employeeVO, Model model)throws Exception{
		employeeVO = employeeService.getEmpDetail(employeeVO);
		model.addAttribute("employeeVO", employeeVO);
		
		return "employee/detail";
	}
	
	
	@GetMapping("update")
	public String setEmpUpdate(EmployeeVO employeeVO, Model model)throws Exception{
		employeeVO = employeeService.getEmpDetail(employeeVO);
		model.addAttribute("employeeVO", employeeVO);
		
		return "employee/update";
	}
	
	@PostMapping("update")
	public String setEmpUpdate(EmployeeVO employeeVO, MultipartFile  photo, RedirectAttributes attributes)throws Exception{
		String quit = employeeVO.getQuitDate();
		// 퇴직 -> 재직('' 값)
		if(quit==null || quit.equals("")) {
			
			employeeVO.setQuitDate(null);
			log.info(">>>>>>quitdate : {} ", employeeVO.getQuitDate());
		}
		
		int result = employeeService.setEmpUpdate(employeeVO);
		
		attributes.addAttribute("employeeNum", employeeVO.getEmployeeNum());
		
		return "redirect:/employee/detail";
	}
	
	
	@PostMapping("delete")
	public String setEmpDelete(EmployeeVO employeeVO)throws Exception{
		int result = employeeService.setEmpDelete(employeeVO);
		
		return "redirect:./list";
	}
}