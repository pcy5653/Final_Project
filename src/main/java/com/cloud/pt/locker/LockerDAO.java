package com.cloud.pt.locker;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.cloud.pt.member.MemVO;
@Mapper
@Repository
public interface LockerDAO {

	public List<LockerVO> getLockerList(LockerVO lockerVO) throws Exception;
	
	public int addUser(LockerVO lockerVO) throws Exception;
	
	
	public List<MemVO> getUser(MemVO memVO) throws Exception;
	
	public int setRepair(LockerVO lockerVO) throws Exception;
	
	public int delUser(LockerVO lockerVO) throws Exception;
	
	public int recoverLocker(LockerVO lockerVO) throws Exception;
}
