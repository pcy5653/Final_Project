package com.cloud.pt.restapi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.ClassMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.cloud.pt.myPtMember.MemberVO;
import com.cloud.pt.ptClass.PtClassVO;
import com.cloud.pt.ptLog.PtLogService;
import com.cloud.pt.ptLog.PtLogVO;
import com.cloud.pt.ptType.PtTypeService;
import com.cloud.pt.ptType.PtTypeVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/trainer/*")
@Slf4j
public class PtSecheduleRestContorller {

	@Autowired
	private PtLogService ptLogService;
	@Autowired
	PtTypeService ptTypeService;
	
	@GetMapping("myPtLog")
	public ResponseEntity<List<Map<String, Object>>> getClassList(HttpSession session) throws Exception {
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		log.info("사번번호 : {} >>>>>>>>>>>>>>>>.", b.getName()); 
		
		
		 
		String employeeNum = b.getName();
		Long memberNum = (Long)session.getAttribute("memberNum");
		  log.info("멤버번호111111111111 : {} >>>>>",memberNum); log.info("멤버 : {} >>>>>",memberNum);
		
		List<PtLogVO> classList = ptLogService.getTypeLog(Long.parseLong(employeeNum),memberNum); 
		List<Map<String, Object>> classMapList = new ArrayList<>();
		
		for (PtLogVO ptLogVO : classList) {
			Map<String, Object> classMap = new HashMap<>();
			
			classMap.put("id", ptLogVO.getPtLogNum());
			classMap.put("title", "운동");
			classMap.put("start", ptLogVO.getPtDate());
			classMap.put("end", ptLogVO.getPtDate());
			classMap.put("content", memberNum);
			classMapList.add(classMap);
		}
		
		return new ResponseEntity<>(classMapList, HttpStatus.OK);
	}
	
	/*public ResponseEntity<List<Map<String, Object >>> getClassList(HttpSession session) throws Exception{
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		log.info("사번 : {} >>>>>>>>>>>>>>>>." ,b.getName()); 
		
		String employeeNum = b.getName();
		
		List<PtLogVO> classList = ptLogService.getTypeLog(Long.parseLong(employeeNum));
		
		List<Map<String, Object>> classMap = new ArrayList<>();
		
		for(PtLogVO ptLogVO : classList) {
			Map<String,Object> m = new HashMap<>();
			
			m.put("id",ptLogVO.getPtLogNum());
			m.put("title", ptLogVO.getMemberNum());
			m.put("start", ptLogVO.getPtDate());
			m.put("end", ptLogVO.getPtDate() );
			
			classMap.add(m);
		}
		
		return new ResponseEntity<>(classMap,HttpStatus.OK);
		
	}*/
	@RequestMapping("upExerciseStatusOne")
	public ResponseEntity<HttpStatus> upExerciseStatusOne(PtTypeVO ptTypeVO) throws Exception{
		ptTypeService.upExerciseStatusOne(ptTypeVO);
		return new ResponseEntity<>(HttpStatus.OK);
	}
	@RequestMapping("finish")
	public ResponseEntity<Map<String, Object>> finishEx(PtTypeVO ptTypeVO) throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		int all = ptTypeService.finishAll(ptTypeVO);
		int finish = ptTypeService.finishOne(ptTypeVO);
		
		double o = finish;
		int result = (int)Math.round((o / all) * 100);
		resultMap.put("currProgress", result);
		return new ResponseEntity<>(resultMap,HttpStatus.OK);
		
	}
	
}
