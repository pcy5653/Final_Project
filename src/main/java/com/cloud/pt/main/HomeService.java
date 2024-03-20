package com.cloud.pt.main;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.approval.ApprovalVO;
import com.cloud.pt.attendance.AttendanceVO;
import com.cloud.pt.notice.NoticeVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class HomeService {
	
	@Autowired
	private HomeDAO homeDAO;
	
	public List<NoticeVO> getNoticeList()throws Exception{
		return homeDAO.getNoticeList();
	}
	
	public AttendanceVO getOnOffTime(AttendanceVO attendanceVO)throws Exception{
		
		log.info("오늘날짜2{}",attendanceVO.getWorkDate());
		log.info("사번{}",attendanceVO.getEmployeeNum());
		return homeDAO.getOnOffTime(attendanceVO);
	}
	
	public List<HomeVO> getMember()throws Exception{
		return homeDAO.getMember();
	}
	
	public List<ApprovalVO> getApprovalList(String employeeNum)throws Exception{
		return homeDAO.getApprovalList(employeeNum);
	}
}
