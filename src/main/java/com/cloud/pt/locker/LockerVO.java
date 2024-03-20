package com.cloud.pt.locker;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
public class LockerVO {

	private Long lockerNum;
	private Long memberNum;
	private Date startDate;
	private Date finishDate;
	private String state;
	private String memberName;
	
}
