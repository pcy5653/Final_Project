package com.cloud.pt.leave;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.commons.Pager;

@Mapper
public interface LeaveDAO {
	
	public List<LeaveVO> getLeaveList(Pager pager) throws Exception;
	
	public Long getLeaveCount(Pager pager) throws Exception;
	
}
