package com.cloud.pt.machine;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.commons.FileManager;

import java.io.File;
import java.util.List;

@Service
public class MachineService {

	@Autowired
	private MachineDAO machineDAO;
	@Autowired
	private FileManager fileManager;
	
	
	@Value("${app.upload}")
	private String uploadPath;
	@Value("${app.upload.machine}")
	private String machineFileName;
	
	
	public List<MachineVO> getList(MachineVO machineVO)throws Exception{
		return machineDAO.getList(machineVO);
	}
	
	public int setMachineAdd(MachineVO machineVO, MultipartFile fileName)throws Exception{
		
		// file 등록
		String file = fileManager.save(this.uploadPath+this.machineFileName, fileName);
		machineVO.setFileName(file);
		machineVO.setOriginalName(fileName.getOriginalFilename());
		
		return machineDAO.setMachineAdd(machineVO);

	}
	
	public int setMachineDelete(List<Integer> machineNumInts)throws Exception {
		return machineDAO.setMachineDelete(machineNumInts);
	}

}
