package com.cloud.pt.approval;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.commons.Pager;
import com.cloud.pt.employee.EmployeeVO;

@Mapper
public interface ApprovalDAO {
	
	public Long getMyCount(Map<String,Object> map)throws Exception;
	public Long getMyWatingCount(Map<String,Object> map)throws Exception;
	public Long getMyProceedingCount(Map<String,Object> map)throws Exception;
	public Long getMyRejectCount(Map<String,Object> map)throws Exception;
	public Long getMyCompleteCount(Map<String,Object> map)throws Exception;
	
	public Long getAllBeforeCount(Map<String,Object> map) throws Exception;
	public Long getAllAfterCount(Map<String,Object> map) throws Exception;
//	public Long getLeaveBeforeCount(Map<String,Object> map) throws Exception;
//	public Long getLeaveAfterCount(Map<String,Object> map) throws Exception;
//	public Long getStopBeforeCount(Map<String,Object> map) throws Exception;
//	public Long getStopAfterCount(Map<String,Object> map) throws Exception;
	
	public Long getTemporaryCount(Map<String,Object> map) throws Exception;
	
	public List<ApprovalVO> getApprovalAllList(Map<String, Object> mapp) throws Exception;
	public List<ApprovalVO> getApprovalWatingList(Map<String, Object>map) throws Exception;
	public List<ApprovalVO> getApprovalProceedingList(Map<String, Object>map) throws Exception;
	public List<ApprovalVO> getApprovalRejectList(Map<String, Object>map) throws Exception;
	public List<ApprovalVO> getApprovalCompleteList(Map<String, Object>map) throws Exception;
	
	public List<EmployeeVO> getAnnualLine() throws Exception;
	
	public int setAdd(ApprovalVO approvalVO)throws Exception;
	
	public List<ApprovalVO> getApproverAllBeforeList(Map<String,Object> map) throws Exception;
	public List<ApprovalVO> getApproverAllAfterList(Map<String,Object> map) throws Exception;
	
	public ApprovalVO getMyDetail(ApprovalVO approvalVO) throws Exception;
	
	public EmployeeVO getMiddleEmployee(ApprovalVO approvalVO) throws Exception;
	
	public EmployeeVO getLastEmployee(ApprovalVO approvalVO) throws Exception;
	
	public int setTempAdd(ApprovalVO approvalVO)throws Exception;
	
	public List<ApprovalVO> getTemporaryList(Map<String, Object> map) throws Exception;
	
	public int setTempUpdate(ApprovalVO approvalVO)throws Exception;
	
	public int setDelete(ApprovalVO approvalVO)throws Exception;
	
	public int setSignUpload(EmployeeVO employeeVO)throws Exception;
	
	public EmployeeVO getMySignImage(EmployeeVO employeeVO) throws Exception;
	
	public int setMiddleApproval(ApprovalVO approvalVO) throws Exception;
	
	public int setFinalApproval(ApprovalVO approvalVO) throws Exception;
	
	public EmployeeVO getFileCheck(EmployeeVO employeeVO) throws Exception;
	
	public int setLeave(ApprovalVO approvalVO) throws Exception;
	public int setLeaveDate(ApprovalVO approvalVO) throws Exception;
	
	public ApprovalVO getState(ApprovalVO approvalVO) throws Exception;
}
