package com.cloud.pt.attendance.modify;

import java.sql.Date;
import java.sql.Time;

import com.cloud.pt.attendance.AttendanceVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AttendanceModifyVO {
	//수정요청번호
	private Long attendanceModifyNum;
	//근태번호
	private Long attendanceNum;
	//직원번호
	private Long employeeNum;
	//작성일
	private Date regDate;
	//수정요청일
	private Date modifyDate;
	//수정요청시간
	private Time modifyTime;
	//요청사유
	private String requestContents;
	//타입
	private String type;
	//상태
	private String state;
	//수정의견
	private String modifyContents;
	
	private AttendanceVO attendanceVO;
}
