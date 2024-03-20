package com.cloud.pt.employee;


import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CareerVO {
	private Long careerNum;
	private String employeeNum;
	private String caTitle;
	private Date caPassDate;
}
