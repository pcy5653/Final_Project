package com.cloud.pt.ptLog;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PtLogVO {

	private Long ptLogNum;
	private Long memberNum;
	private String employeeNum;
	private String ptDate;
}
