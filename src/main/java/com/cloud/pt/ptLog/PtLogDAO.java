package com.cloud.pt.ptLog;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cloud.pt.member.MemVO;

@Repository
@Mapper
public interface PtLogDAO {

	public ArrayList<PtLogVO> getTypeLog(Long employeeNum,Long memberNum) throws Exception;
	
	public int addLog(PtLogVO ptLogVO) throws Exception;
	
	public int delLog(PtLogVO ptLogVO) throws Exception;
	
	
}
