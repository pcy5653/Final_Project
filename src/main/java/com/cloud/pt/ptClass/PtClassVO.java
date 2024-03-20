package com.cloud.pt.ptClass;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PtClassVO {
	
	private Long ptNum;
	private Long memberNum;
	private String employeeNum;
	private String startTime;
	private String finishTime;
	private String memberName;
	
}
