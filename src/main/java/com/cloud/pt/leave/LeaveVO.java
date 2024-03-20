package com.cloud.pt.leave;

import java.sql.Date;

import com.cloud.pt.employee.EmployeeVO;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LeaveVO {
	private Long leaveNum;
	private String employeeNum;
	private String leaveKind;
	private Double useDate;
	private Date startDate;
	private Date endDate;
	private String reason;
	private EmployeeVO employeeVO;
	
}
