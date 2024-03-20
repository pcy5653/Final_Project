package com.cloud.pt.ptClass;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface PtClassDAO {
	
	public ArrayList<PtClassVO> getMyList(Long employeeNum) throws Exception;
	
	public int addClass(PtClassVO ptClassVO) throws Exception;
	
	public int delClass(PtClassVO ptClassVO) throws Exception;
	
}
