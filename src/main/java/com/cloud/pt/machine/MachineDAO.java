package com.cloud.pt.machine;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface MachineDAO {

	public List<MachineVO> getList(MachineVO machineVO)throws Exception;
	
	public int setMachineAdd(MachineVO machineVO)throws Exception;
	
	public int setMachineDelete(List<Integer> machineNumInts)throws Exception;
}
