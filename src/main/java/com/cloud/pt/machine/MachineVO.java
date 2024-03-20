package com.cloud.pt.machine;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MachineVO {
	
	private Integer machineNum;
	private String name;
	private Date buyDate;
	private String fileName;
	private String originalName;
}
