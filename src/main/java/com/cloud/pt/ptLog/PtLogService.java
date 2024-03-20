package com.cloud.pt.ptLog;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.member.MemVO;

@Service
public class PtLogService {
	
	@Autowired
	private PtLogDAO ptLogDAO;

	public ArrayList<PtLogVO> getTypeLog(Long employeeNum,Long memberNum) throws Exception{
		return ptLogDAO.getTypeLog(employeeNum,memberNum);
	}
	
	public int addLog(PtLogVO ptLogVO) throws Exception{
		return ptLogDAO.addLog(ptLogVO);
	}
	public int delLog(PtLogVO ptLogVO) throws Exception{
		return ptLogDAO.delLog(ptLogVO);
	}
	
}


