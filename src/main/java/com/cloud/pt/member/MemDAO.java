package com.cloud.pt.member;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.commons.Pager;

@Mapper
public interface MemDAO {
	
	
	public List<MemVO> getMemberList(Map<String, Object> map)throws Exception;
	
	public Long getMemberTotal(Pager pager)throws Exception;
	
	public int setMemberAdd(MemVO memVO)throws Exception;
	
	public MemVO getMemberDetail(MemVO memVO)throws Exception;
	
	public int setMemberUpdate(MemVO memVO)throws Exception;
	
	public int setMemberDelete(MemVO memVO)throws Exception;

}
