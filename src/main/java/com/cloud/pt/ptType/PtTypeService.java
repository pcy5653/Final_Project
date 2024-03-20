package com.cloud.pt.ptType;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;

import com.cloud.pt.member.MemVO;
import com.cloud.pt.ptClass.PtClassVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PtTypeService {
	
	@Autowired
	private PtTypeDAO ptTypeDAO;
	
	public List<PtTypeVO> getTypeList(PtTypeVO ptTypeVO) throws Exception{
		
		
	    
	    Map<String,Object> map = new HashMap<>();
	    map.put("ptLogNum",ptTypeVO.getPtLogNum());
	    
		return ptTypeDAO.getTypeList(map);
	}
	
	public int addType(PtTypeVO ptTypeVO) throws Exception{
		
		return ptTypeDAO.addType(ptTypeVO);
	}
	
	public int delType(PtTypeVO ptTypeVO) throws Exception{
		
		return ptTypeDAO.delType(ptTypeVO);
	}
	
	public int upType(PtTypeVO ptTypeVO) throws Exception{
		
		return ptTypeDAO.upType(ptTypeVO);
	}
	
	public int finishAll(PtTypeVO ptTypeVO) throws Exception{
		return ptTypeDAO.finishAll(ptTypeVO);
	}
	
	public int finishOne(PtTypeVO ptTypeVO) throws Exception{
		return ptTypeDAO.finishOne(ptTypeVO);
	}
	
	public void upExerciseStatusOne(PtTypeVO ptTypeVO) throws Exception{
		ptTypeDAO.upExerciseStatusOne(ptTypeVO);
	}
	public int minusPt(MemVO memVO) throws Exception{
		return ptTypeDAO.minusPt(memVO);
	}
}
