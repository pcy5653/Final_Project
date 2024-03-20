package com.cloud.pt.registration;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RegistrationVO {
	//등록번호
	private Long registrationNum;
	//회원번호
	private Long memberNum;
	//이용권번호
	private Long membershipNum;
	//등록일
	private Date regDate;
	//피티횟수
	private Integer ptCount;
	//이용개월
	private Integer month;
}
