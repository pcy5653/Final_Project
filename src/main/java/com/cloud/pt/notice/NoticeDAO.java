package com.cloud.pt.notice;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.commons.Pager;

@Mapper
public interface NoticeDAO {
	
	public int setNoticeAdd(NoticeVO noticeVO)throws Exception;
	
	public int fileAdd(NoticeFileVO noticefileVO)throws Exception;
	
	public NoticeVO getNoticeDetail(NoticeVO noticeVO)throws Exception;
	
	public List<NoticeVO> getNoticeList(Pager pager)throws Exception;
	
	public NoticeFileVO getFile(NoticeFileVO noticeFileVO)throws Exception;
	
	public int setNoticeDelete(NoticeVO noticeVO)throws Exception;
	
	public List<NoticeFileVO> getFileDelete(NoticeVO noticeVO)throws Exception;
	
	public int FileUpdateDelete(NoticeFileVO noticeFileVO)throws Exception;
	
	public int setNoticeUpdate(NoticeVO noticeVO)throws Exception;
	
	public Long getTotal(Pager pager)throws Exception;
	
	public Long getCatTotal(NoticeVO noticeVO)throws Exception;
	
	public List<NoticeVO> getCatList(Map<String, Object> map)throws Exception;
	
	public int setHitUpdate(NoticeVO noticeVO)throws Exception;
	
	public List<NoticeVO> getPinList()throws Exception;
}
