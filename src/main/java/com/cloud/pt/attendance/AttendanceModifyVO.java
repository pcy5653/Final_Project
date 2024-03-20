package com.cloud.pt.attendance;

import java.sql.Date;
import java.sql.Time;

import org.springframework.format.annotation.DateTimeFormat;

import com.cloud.pt.employee.EmployeeVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AttendanceModifyVO {
	//수정요청번호
	private Long attendanceModifyNum;
	//근태번호
	private Long attendanceNum;
	//작성일
	private Date regDate;
	//수정요청일
	private Date modifyDate;
	//수정요청시간
	private String modifyTime;
	//요청사유
	private String requestContents;
	//타입
	private String type;
	//상태
	private String status;
	//수정의견
	private String modifyContents;
	//수정 전 시간
	private Time originalTime;
	//수정 전 상태
	private String originalState;
	
	private AttendanceVO attendanceVO;
	private EmployeeVO employeeVO;
}
