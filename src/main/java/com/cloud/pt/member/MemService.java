package com.cloud.pt.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.commons.Pager;

@Service
public class MemService {

	@Autowired
	private MemDAO memDAO;
	
	
	public List<MemVO> getMemberList(MemVO memVO, Pager pager)throws Exception{
		Map<String, Object> map = new HashMap<>();
		pager.makeRowNum();
		Long total = memDAO.getMemberTotal(pager);
		pager.makePageNum(total);
		map.put("pager", pager);
		map.put("member", memVO);
		
		return memDAO.getMemberList(map);
	}
	
	
	public int setMemberAdd(MemVO memVO)throws Exception{
		return memDAO.setMemberAdd(memVO);
	}
	
	
	public MemVO getMemberDetail(MemVO memVO)throws Exception{
		return memDAO.getMemberDetail(memVO);
	}
	
	
	public int setMemberUpdate(MemVO memVO)throws Exception{
		return memDAO.setMemberUpdate(memVO);
	}
	
	public int setMemberDelete(MemVO memVO)throws Exception{
		return memDAO.setMemberDelete(memVO);
	}
	
}
