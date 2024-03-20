package com.cloud.pt.myPtMember;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cloud.pt.commons.Pager;
import com.cloud.pt.member.MemVO;
@Repository
@Mapper
public interface MemberDAO {
	
	
	
	public Long getTotal(Pager pager) throws Exception;

	public List<MemVO> getPtList(Map<String, Object> map,String employeeNum) throws Exception;	

	

	
}
