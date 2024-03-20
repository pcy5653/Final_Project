package com.cloud.pt.registration;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RegistrationDAO {
	public int setAdd(RegistrationVO registrationVO) throws Exception;
	public int setUpdate(Map<String, Object> map) throws Exception;
}
