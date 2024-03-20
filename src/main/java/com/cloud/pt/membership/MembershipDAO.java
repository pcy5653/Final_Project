package com.cloud.pt.membership;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cloud.pt.commons.Pager;

@Mapper
public interface MembershipDAO {
	public int setAdd(MembershipVO membershipVO) throws Exception;
	public List<Long> getReg(MembershipVO membershipVO) throws Exception;
 	public int setDelete(MembershipVO membershipVO) throws Exception;
	public Long getTotal() throws Exception;
	public List<MembershipVO> getListForPager(Pager pager) throws Exception;
	public List<MembershipVO> getList() throws Exception;	
}