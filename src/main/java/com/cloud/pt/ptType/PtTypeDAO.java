package com.cloud.pt.ptType;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cloud.pt.member.MemVO;

@Repository
@Mapper
public interface PtTypeDAO {

	public List<PtTypeVO> getTypeList(Map<String, Object> map) throws Exception;

	public int addType(PtTypeVO ptTypeVO) throws Exception;
	
	public int delType(PtTypeVO ptTypeVO) throws Exception;
	
	public int upType(PtTypeVO ptTypeVO) throws Exception;
	
	public int finishAll(PtTypeVO ptTypeVO) throws Exception;
	
	public int finishOne(PtTypeVO ptTypeVO) throws Exception;
	
	public void upExerciseStatusOne(PtTypeVO ptTypeVO) throws Exception;

	public int minusPt(MemVO memVO) throws Exception;
}
