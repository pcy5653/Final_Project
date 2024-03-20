package com.cloud.pt.attendance;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cloud.pt.commons.Pager;
import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AttendanceService {
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	//해당 직원의 근태정보 리스트(json)
	public List<Map<String, Object>> getList(EmployeeVO employeeVO) throws Exception {
		List<Map<String, Object>> list = attendanceDAO.getList(employeeVO);
		
		JSONObject jsonObj; 
		JSONArray jsonArr = new JSONArray(); //대괄호
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).get("STATE")==null) {
				continue;
			}
			map.put("title", list.get(i).get("STATE"));
			map.put("start", list.get(i).get("WORKDATE"));
			map.put("onTime", list.get(i).get("ONTIME"));
			map.put("offTime", list.get(i).get("OFFTIME"));
			
			if(list.get(i).get("STATE").equals("조퇴")) {
				map.put("color", "#F5D0A9");
			}else if(list.get(i).get("STATE").equals("정상")) {
				map.put("color", "#BCF5A9");
			}else if(list.get(i).get("STATE").equals("결근")) {
				map.put("color", "#F6CECE");
			}else if(list.get(i).get("STATE").equals("지각")) {
				map.put("color", "#F3F781");
			}else {
				map.put("color", "#CEE3F6");
			}
			
			map.put("textColor", "#000000");
			
			jsonObj = new JSONObject(map); //중괄호 {key:value, key:value}
			jsonArr.add(jsonObj); //대괄호 안에 넣어주기[{key:value, key:value},{key:value, key:value}]
		}
		
//		log.info("jsonArr: {}", jsonArr);
		
		return jsonArr;
	}
	//전체직원의 근태리스트(json)
	public List<Map<String, Object>> getAdminList() throws Exception {
		List<Map<String, Object>> list = attendanceDAO.getAdminList();
//		System.out.println(list);
		
		JSONObject jsonObj; 
		JSONArray jsonArr = new JSONArray(); //대괄호
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).get("STATE")==null) {
				continue;
			}
			JSONArray resourceIds1 = new JSONArray();
			resourceIds1.add(list.get(i).get("EMPLOYEENUM"));
			map.put("title", list.get(i).get("STATE"));
			map.put("resourceIds", resourceIds1);
			map.put("start", list.get(i).get("WORKDATE"));
			map.put("onTime", list.get(i).get("ONTIME"));
			map.put("offTime", list.get(i).get("OFFTIME"));
			map.put("name", list.get(i).get("NAME"));
			
			if(list.get(i).get("STATE").equals("조퇴")) {
				map.put("color", "#F5D0A9");
			}else if(list.get(i).get("STATE").equals("정상")) {
				map.put("color", "#BCF5A9");
			}else if(list.get(i).get("STATE").equals("결근")) {
				map.put("color", "#F6CECE");
			}else if(list.get(i).get("STATE").equals("지각")) {
				map.put("color", "#F3F781");
			}else {
				map.put("color", "#CEE3F6");
			}
			
			map.put("textColor", "#000000");
			
			jsonObj = new JSONObject(map); //중괄호 {key:value, key:value}
			jsonArr.add(jsonObj); //대괄호 안에 넣어주기[{key:value, key:value},{key:value, key:value}]
		}
		
		log.info("jsonArr: {}", jsonArr);
		
		return jsonArr;
	}
	//전체직원리스트(json)
	public List<Map<String, Object>> getResources() throws Exception {
		List<Map<String, Object>> list = attendanceDAO.getResources();
//		System.out.println(list);
		
		JSONObject jsonObj; 
		JSONArray jsonArr = new JSONArray(); //대괄호
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		for(int i=0; i<list.size(); i++) {
			map.put("id", list.get(i).get("EMPLOYEENUM"));
			map.put("title", list.get(i).get("NAME"));
			
			jsonObj = new JSONObject(map); //중괄호 {key:value, key:value}
			jsonArr.add(jsonObj); //대괄호 안에 넣어주기[{key:value, key:value},{key:value, key:value}]
		}
		
//		log.info("jsonArr: {}", jsonArr);
		
		return jsonArr;
	}
	
	//해당 직원의 당일근태조회
	public AttendanceVO getInfo(EmployeeVO employeeVO) throws Exception {
		long currentTimeMillis = System.currentTimeMillis();
        Date currentSqlDate = new Date(currentTimeMillis); //헌재 날짜 
        
        Map<String, Object> map = new HashMap<>();
        map.put("vo", employeeVO);
        map.put("date", currentSqlDate);
		
		return attendanceDAO.getInfo(map);
	}
	
	//출근기록 추가
	public int setOn(EmployeeVO employeeVO) throws Exception {
		return attendanceDAO.setOn(employeeVO);
	}
	//퇴근기록 추가 
	@Transactional(rollbackFor = Exception.class)
	public int setOff(EmployeeVO employeeVO) throws Exception {
		int result = attendanceDAO.setOff(employeeVO); //퇴근기록
		
		if(result>0) {
			AttendanceVO attendanceVO = getInfo(employeeVO); //당일근태정보 가져오기
			setState(attendanceVO); //상태 설정 
		}
		return result;
	}
	//근태상태 설정
	public int setState(AttendanceVO attendanceVO) throws Exception {
		String on = "09:01:00";
		String off = "18:00:00";
		Time standardOn = Time.valueOf(on); //출근시간 기준
		Time standardOff = Time.valueOf(off); //퇴근시간 기준 
		
		Map<String, Object> map = new HashMap<>();
		map.put("vo", attendanceVO);
		map.put("on", standardOn);
		map.put("off", standardOff);
		
		return attendanceDAO.setState(map);
	}
	//전체직원의 당일근태조회
	public List<AttendanceVO> getDayList(AttendanceVO attendanceVO, Pager pager) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("attendance", attendanceVO);
		map.put("pager", pager);
		
		pager.makeRowNum();
		Long total = attendanceDAO.getDayTotal(map);
		pager.makePageNum(total);
		
		return attendanceDAO.getDayList(map);
	}
	
	//---------------------------------------------------
	
	//근태 수정 
	@Transactional(rollbackFor = Exception.class)
	public int setUpdate(AttendanceVO attendanceVO, AttendanceModifyVO attendanceModifyVO) throws Exception {
		String status = attendanceModifyVO.getStatus(); //해당 근태수정요청안의 상태
		
		Map<String, Object> map = new HashMap<>();
		map.put("attendance", attendanceVO);
		map.put("modify", attendanceModifyVO);
		
//		log.info("attendance: {}", attendanceVO);
		
		int result = 0;
		
		if(status.equals("승인")) { //승인일 때
			//attendance 수정
			result = attendanceDAO.setUpdateA(map); 
			
			Time time = Time.valueOf(attendanceModifyVO.getModifyTime()); //변경요청시간
			if(attendanceModifyVO.getType().equals("출근")) { //출근시간수정요청일 때
				attendanceVO.setOnTime(time); //출근시간설정
			}else { //퇴근시간수정요청일 때
				attendanceVO.setOffTime(time); //퇴근시간설정
			}
//			log.info("attendance: {}", attendanceVO);
			result = setState(attendanceVO); //근태상태 수정
			
			if(result>0) {
				result = attendanceDAO.setUpdateAM(attendanceModifyVO); //attendanceModify 수정
			}
		}else { //반려일 때 
			attendanceDAO.setUpdateAM(attendanceModifyVO); //attendanceModify 수정
		}
		
		return result;
	}
	
	//근태수정요청안
	public AttendanceModifyVO getRequest(AttendanceModifyVO attendanceModifyVO) throws Exception {
		return attendanceDAO.getRequest(attendanceModifyVO);
	}
	
	//근태수정요청 목록(관리자)
	public List<AttendanceModifyVO> getRequestList(Pager pager) throws Exception {
		pager.makeRowNum();
		Long total = attendanceDAO.getRequestTotal(pager);
		pager.makePageNum(total);
				
		return attendanceDAO.getRequestList(pager);
	}
	
	//---------------------------------------------------
	
	//근태수정요청서
	public AttendanceModifyVO getModifyDetail(AttendanceModifyVO attendanceModifyVO) throws Exception {
		return attendanceDAO.getModifyDetail(attendanceModifyVO);
	}
	
	//내 근태수정요청 목록
	public List<AttendanceModifyVO> getModifyList(EmployeeVO employeeVO, Pager pager) throws Exception {
		pager.makeRowNum();
		Long total = attendanceDAO.getModifyTotal(employeeVO);
		pager.makePageNum(total);
		
		Map<String, Object> map = new HashMap<>();
		map.put("vo", employeeVO);
		map.put("pager", pager);
		
		return attendanceDAO.getModifyList(map);
	}
	
	//근태수정요청서 제출 
	public int setModifyAdd(AttendanceModifyVO attendanceModifyVO, EmployeeVO employeeVO) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("modify", attendanceModifyVO); //수정요청일
		map.put("emp", employeeVO); //직원번호
		
		//근태번호 찾기
		Long num = attendanceDAO.getNum(map);
		AttendanceVO attendanceVO = attendanceDAO.getDetail(num); //근태정보 가져오기
		
		if(attendanceVO.getState()==null) { //당일 퇴근 전 요청 시 
			return -1;
		}
		
		attendanceModifyVO.setAttendanceNum(num); //근태번호 추가
		
		if(attendanceDAO.getModify(attendanceModifyVO)==null || attendanceDAO.getModify(attendanceModifyVO).getStatus().equals("반려")) { //근태요청기록이 없거나 반려상태일 때
			if(attendanceModifyVO.getType().equals("출근")) { //출근시간 수정요청
				attendanceModifyVO.setOriginalTime(attendanceVO.getOnTime());
			}else { //퇴근시간 수정요청
				attendanceModifyVO.setOriginalTime(attendanceVO.getOffTime());
			}
			attendanceModifyVO.setOriginalState(attendanceVO.getState());
			
			return attendanceDAO.setModifyAdd(attendanceModifyVO);
		}else { //승인이나 요청상태일 때 
			return 0;
		}
	}
}
