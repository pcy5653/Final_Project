package com.cloud.pt.myPtMember;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.cloud.pt.commons.Pager;
import com.cloud.pt.employee.EmployeeVO;
import com.cloud.pt.member.MemVO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private HttpSession httpSession;
	
	/*
	 * public List<MemVO> getPtList(MemVO memberVO) throws Exception{ Long
	 * employee = (Long) httpSession.getAttribute("employee");
	 * 
	 * memberVO.setEmployeeNum(employee.getEmployeeNum()); return
	 * memberDAO.getPtList(memberVO); }
	 */
	
	public Long getTotal(Pager pager) throws Exception{
		return memberDAO.getTotal(pager);
	}
	
	public List<MemVO> getPtList(EmployeeVO employeeVO , Pager pager) throws Exception{
		Map<String,Object> map = new HashMap<>();
		
		pager.makeRowNum();
		Long total = memberDAO.getTotal(pager);
		pager.makePageNum(total);
		
		SecurityContext context = SecurityContextHolder.getContext();
	    org.springframework.security.core.Authentication b = context.getAuthentication();
	    
	    String employeeNum = b.getName();
		
		
		map.put("employeeNum", employeeVO.getEmployeeNum());
		map.put("pager", pager);
		
		return memberDAO.getPtList(map,employeeNum);
	}
	
	
}
