package com.cloud.pt.employee;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.commons.Pager;

@Mapper
public interface EmployeeDAO {

	public EmployeeVO getEmpLogin(EmployeeVO employeeVO)throws Exception;
	
	public int setFindPwUpdate(EmployeeVO employeeVO)throws Exception;
	
	public EmployeeVO getInfo(EmployeeVO employeeVO)throws Exception;
	
	public int setInfoUpdate(EmployeeVO employeeVO)throws Exception;
	
	public int setInfoCareerUpdate(CareerVO careerVO)throws Exception;
	
	public List<CareerVO> getInfoCareer(CareerVO careerVO)throws Exception;
	
	public int setInfoCertificationUpdate(CertificationVO certificationVO)throws Exception;
	
	public List<CertificationVO> getInfoCertification(CertificationVO certificationVO)throws Exception;
	
	public int setInfoFileDelete(EmployeeVO employeeVO)throws Exception;
	
	public int setPwUpdate(EmployeeVO employeeVO)throws Exception; 
	
	public int setJoin(EmployeeVO employeeVO)throws Exception;
	
	public Long getEmpTotal(Pager pager)throws Exception;
	
	public List<EmployeeVO> getTrainerList() throws Exception;
	
	public List<EmployeeVO> getEmpList(Map<String, Object> map)throws Exception;
	
	public EmployeeVO getEmpDetail(EmployeeVO employeeVO)throws Exception;
	
	public int setEmpUpdate(EmployeeVO employeeVO)throws Exception;
	
	public int setEmpDelete(EmployeeVO employeeVO)throws Exception;
	
	public EmployeeVO getFindPw(EmployeeVO employeeVO)throws Exception;
	
}
