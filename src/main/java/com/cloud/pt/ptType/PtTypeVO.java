package com.cloud.pt.ptType;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PtTypeVO {
	
	private Long ptTypeNum;
	private Long ptLogNum;
	private String name;
	private String weight;
	private Long exCount;
	private Long ptSet;
	private int finish;
}
