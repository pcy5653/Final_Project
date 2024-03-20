package com.cloud.pt.notice;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class NoticeFileVO {
	
	private Long fileNum;
	private Long noticeNum;
	private String fileName;
	private String oriName;

}
