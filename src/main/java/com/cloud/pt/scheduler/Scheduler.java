package com.cloud.pt.scheduler;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.cloud.pt.attendance.AttendanceDAO;
import com.cloud.pt.attendance.AttendanceVO;
import com.cloud.pt.employee.EmployeeVO;

@Component
public class Scheduler {
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	//매일 12시 5분마다 실행
	@Scheduled(cron = "0 5 0 * * *", zone = "Asia/Seoul") //timezone 설정 
	public void setEnd() throws Exception {
		//전체 직원 목록
		List<EmployeeVO> ar = attendanceDAO.getEmployeeList();
		
		for(int i=0; i<ar.size(); i++) {
			EmployeeVO employeeVO = ar.get(i);
			
			//현재 날짜 가져오기
	        LocalDate currentDate = LocalDate.now();
	        //어제 날짜 계산
	        LocalDate yesterday = currentDate.minusDays(1);
	        //LocalDate를 java.sql.Date로 변환
	        Date sqlDate = Date.valueOf(yesterday);
	        
	        Map<String, Object> map = new HashMap<>();
	        map.put("vo", employeeVO);
	        map.put("date", sqlDate);
			
	        //전날 직원의 근태정보
			AttendanceVO attendanceVO = attendanceDAO.getInfo(map);
			if(attendanceVO==null || attendanceVO.getOffTime()==null) {//근태정보가 없거나 퇴근기록이 없을 때
				attendanceDAO.setEnd(map); //상태를 결근으로 처리
			}
		}
	}
}
