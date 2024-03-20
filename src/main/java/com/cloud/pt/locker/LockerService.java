package com.cloud.pt.locker;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloud.pt.member.MemVO;
@Service
public class LockerService {

	@Autowired
	private LockerDAO lockerDAO;
	
	public List<LockerVO> getLockerList(LockerVO lockerVO) throws Exception{
		
		return lockerDAO.getLockerList(lockerVO);
	}
	
	public int addUser(LockerVO lockerVO) throws Exception{
		return lockerDAO.addUser(lockerVO);
	}
	
	public List<MemVO> getUser(MemVO memVO) throws Exception{
		return lockerDAO.getUser(memVO);
	}
	
	public int setRepair(LockerVO lockerVO) throws Exception{
		return lockerDAO.setRepair(lockerVO);
	}
	
	public int delUser(LockerVO lockerVO) throws Exception{
		return lockerDAO.delUser(lockerVO);
	}
	
	public int recoverLocker(LockerVO lockerVO) throws Exception{
		return lockerDAO.recoverLocker(lockerVO);
	}
}
