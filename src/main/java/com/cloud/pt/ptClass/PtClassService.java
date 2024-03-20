package com.cloud.pt.ptClass;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PtClassService {
	@Autowired
	private PtClassDAO ptClassDAO;
	
	public ArrayList<PtClassVO> getMyList(Long employeeNum) throws Exception{
		return ptClassDAO.getMyList(employeeNum);
	}
	
	public int addClass(PtClassVO ptClassVO) throws Exception{
		return ptClassDAO.addClass(ptClassVO);
		
	}
	
	public int delClass(PtClassVO ptClassVO) throws Exception{
		return ptClassDAO.delClass(ptClassVO);
	}
	
	
}
