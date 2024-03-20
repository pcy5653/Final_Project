package com.cloud.pt.employee;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.commons.FileManager;
import com.cloud.pt.commons.Pager;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.java_sdk.api.Message;
//import net.nurigo.sdk.message.model.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;



@Service
@Slf4j
public class EmployeeService implements UserDetailsService{
	
	@Autowired
	private EmployeeDAO employeeDAO;
	// 비밀번호 암호화
	@Autowired
	private PasswordEncoder passwordEncoder;
	@Autowired
	private FileManager fileManager;
	

	// properties 값을 java 사용. (@Value("${properties 키}"))
	@Value("${app.upload}")
	private String uploadPath;
	@Value("${app.upload.employee}")
	private String empFileName;
	
	
	
	public List<EmployeeVO> getTrainerList() throws Exception {
		return employeeDAO.getTrainerList();
	}
	
	
	// Login POST 처리 (SecurityConfig -> Service의 loadUserByUsername 메서드 실행)
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeVO employeeVO = new EmployeeVO();
		log.info(">> 로그인 시도중 <<");
		employeeVO.setEmployeeNum(username);
		log.info("num : {} ",employeeVO.getEmployeeNum());

		// passwordEncoder.encode("비밀번호");
		System.out.println(passwordEncoder.encode("a12345678*"));
		
		try {
			employeeVO = employeeDAO.getEmpLogin(employeeVO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			employeeVO = null;
		}
		return employeeVO;
	}
	 
	
	
	public boolean getEmpError(EmployeeVO employeeVO,BindingResult bindingResult)throws Exception{
		// false(오류없음) | true(오류있음)

		// annotation 검증
		boolean check = bindingResult.hasErrors();

		return check;
	}
	public boolean getEmpCaCerError(EmployeeVO employeeVO,CareerVO careerVO, CertificationVO certificationVO, BindingResult bindingResult)throws Exception{
		// false(오류없음) | true(오류있음)

		// annotation 검증
		boolean check = bindingResult.hasErrors();

		return check;
	}
	
	
//	@Transactional(readOnly=true)
//	public Map<String,String> validateHandling(Errors errors)throws Exception{
//		Map<String, String> validatorResult = new HashMap<>();
//		
//		for(FieldError error : errors.getFieldErrors()) {
//			String validKeyName = String.format("valid_%s", error.getField());
//			validatorResult.put(validKeyName, error.getDefaultMessage());
//		}
//		return validatorResult;
//	}
	
	
	public EmployeeVO getInfo(EmployeeVO employeeVO)throws Exception{
		return employeeDAO.getInfo(employeeVO);
	}
	
	public int setInfoUpdate(EmployeeVO employeeVO, MultipartFile proFile)throws Exception{
		
		// file db오류 방지를 위해(null 값 넣기);
		if(proFile.getSize() == 0) {
			employeeVO.setProFile(employeeVO.getProFile());
			employeeVO.setProOriginal(employeeVO.getProOriginal());
			
			return employeeDAO.setInfoUpdate(employeeVO);
		}
		String fileName = fileManager.save(this.uploadPath+this.empFileName, proFile);
		
		employeeVO.setProFile(fileName);
		employeeVO.setProOriginal(proFile.getOriginalFilename());
		
		return employeeDAO.setInfoUpdate(employeeVO);
		
	}
	
	public int setInfoCareerUpdate(CareerVO careerVO)throws Exception{
		return employeeDAO.setInfoCareerUpdate(careerVO);
	}
	
	public List<CareerVO> getInfoCareer(CareerVO careerVO)throws Exception{
		return employeeDAO.getInfoCareer(careerVO);
	}
	
	public int setInfoCertificationUpdate(CertificationVO certificationVO)throws Exception{
		return employeeDAO.setInfoCertificationUpdate(certificationVO);
	}
	
	public List<CertificationVO> getInfoCertification(CertificationVO certificationVO)throws Exception{
		return employeeDAO.getInfoCertification(certificationVO);
	}
	
	
	
	public int setPwUpdate(EmployeeVO employeeVO, PasswordVO passwordVO)throws Exception{
		// 비밀번호 암호화
		employeeVO.setPassword(passwordEncoder.encode(passwordVO.getNewPw()));
				
		return employeeDAO.setPwUpdate(employeeVO);
	}
	
	public boolean getNewPwCheck(PasswordVO passwordVO, BindingResult bindingResult)throws Exception{
		// false(오류없음) | true(오류있음)
		boolean check = false;
		// 1. password 일치 검증
		if(!passwordVO.getNewPw().equals(passwordVO.getPwCheck())) {
			check = true;  //check=!check;
			
			// reject ("VO명", "properties에 적힐 키이름")
			bindingResult.rejectValue("pwCheck", "employeeVO.password.equalCheck");
		}
		
		return check;
	}
	
	
	
	public EmployeeVO getFindPw(EmployeeVO employeeVO)throws Exception{
		log.info("비번 찾기! : {}",employeeVO);
		
		return employeeDAO.getFindPw(employeeVO);
	}
	
	//임시비밀번호
	public void certifiedPhoneNumber(String userPhoneNumber, String randomStr) {
		String api_key = "NCS6Z2IHA0RLQUS1"; //쿨sms api
	    String api_secret = "MK0T5L21VZO4FXLBLRMQJBYHJIRAVOZC"; //쿨 sms 시크릿api
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호//userPhoneNumber
	    params.put("from", "01091957075");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "임시비밀번호는" + "["+randomStr+"]" + "입니다. 꼭 비밀번호 변경해주세요.(마이페이지 > 비밀번호 변경)"); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version
	    
	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	}
	
	public int setFindPwUpdate(EmployeeVO employeeVO)throws Exception{
		// 비밀번호 암호화
		employeeVO.setPassword(passwordEncoder.encode(employeeVO.getPassword()));
		
		return employeeDAO.setFindPwUpdate(employeeVO);
	}
	
	
	
	@Transactional(rollbackFor = Exception.class)
	public int setJoin(EmployeeVO employeeVO, MultipartFile proFile)throws Exception{
		// 비밀번호 암호화
		employeeVO.setPassword(passwordEncoder.encode(employeeVO.getPassword()));
		
		// file 등록
		String fileName = fileManager.save(this.uploadPath+this.empFileName, proFile);
		
		employeeVO.setProFile(fileName);
		employeeVO.setProOriginal(proFile.getOriginalFilename());
		
		int result = employeeDAO.setJoin(employeeVO);

			

		return result;
	}
	
	//직원 등록시 발송되는 SMS
	public void sendJoin(String userPhoneNumber, String employeeNum, String password) {
		String api_key = "NCS6Z2IHA0RLQUS1"; //쿨sms api
	    String api_secret = "MK0T5L21VZO4FXLBLRMQJBYHJIRAVOZC"; //쿨 sms 시크릿api
	    Message coolsms = new Message(api_key, api_secret);
	    
	    log.info("랜덤 번호 갈겨");

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", userPhoneNumber);    // 수신전화번호//userPhoneNumber
	    params.put("from", "01091957075");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "입사를 진심으로 축하드립니다!! 직원 아이디 : " + employeeNum + ", 비밀번호 : "+ password +" 입니다."); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version
	    
	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	}

	public List<EmployeeVO> getEmpList(EmployeeVO employeeVO, Pager pager)throws Exception{
		Map<String, Object> map = new HashMap<>();
		if(pager.getSearch().equals("대표")) {
			pager.setSearch("ROLE_CEO");
		}else if(pager.getSearch().equals("총괄")) {
			pager.setSearch("ROLE_GENERAL");
		}else if(pager.getSearch().equals("고객") || pager.getSearch().equals("고객관리") ) {
			pager.setSearch("ROLE_CUSTOMER");
		}else if(pager.getSearch().equals("인사")) {
			pager.setSearch("ROLE_RESOURCES");
		}else if(pager.getSearch().equals("시설")) {
			pager.setSearch("ROLE_FACILITY");
		}else if(pager.getSearch().equals("트레이너") || pager.getSearch().equals("트")) {
			pager.setSearch("ROLE_TRAINER");
		}else if(pager.getSearch().equals("가발령")) {
			pager.setSearch("ROLE_EX");
		}
		pager.makeRowNum();
		Long total = employeeDAO.getEmpTotal(pager);
		pager.makePageNum(total);
		
		map.put("pager", pager);
		map.put("emp", employeeVO);
		
		System.out.println(pager.getSearch());
	
		
		
		return employeeDAO.getEmpList(map);
	}
	
	
	public EmployeeVO getEmpDetail (EmployeeVO employeeVO)throws Exception{
		return employeeDAO.getEmpDetail(employeeVO);
	}
	
	public int setEmpUpdate (EmployeeVO employeeVO)throws Exception{
		return employeeDAO.setEmpUpdate(employeeVO);
	}
	
	public int setEmpDelete (EmployeeVO employeeVO)throws Exception{
		return employeeDAO.setEmpDelete(employeeVO);
	}
}
