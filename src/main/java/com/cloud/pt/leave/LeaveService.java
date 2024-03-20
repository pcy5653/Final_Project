package com.cloud.pt.leave;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.commons.Pager;

@Service
public class LeaveService {
	
	@Autowired
	private LeaveDAO leaveDAO;
	
	public List<LeaveVO> getLeaveList(Pager pager) throws Exception{
		
		pager.makeRowNum();
		Long total = leaveDAO.getLeaveCount(pager);
		pager.makePageNum(total);
		return leaveDAO.getLeaveList(pager);
	}
	
}
