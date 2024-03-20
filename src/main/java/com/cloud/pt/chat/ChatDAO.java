package com.cloud.pt.chat;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.employee.EmployeeVO;

@Mapper
public interface ChatDAO {
	
	public List<EmployeeVO> getChatList(String employeeNum)throws Exception;
	
	public List<EmployeeVO> getSearch(EmployeeVO employeeVO)throws Exception;
	
	public RoomVO roomCheck(RoomVO roomVO)throws Exception;
	
	public int createRoom(RoomVO roomVO)throws Exception;
	
	public int messageAdd(ChatMessageVO chatMessageVO)throws Exception;
	
	public List<ChatMessageVO> chatMessageList(RoomVO roomVO)throws Exception;
	
	public EmployeeVO getSomeone(EmployeeVO employeeVO)throws Exception;
	
}
