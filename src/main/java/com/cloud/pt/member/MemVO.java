package com.cloud.pt.member;

import java.sql.Date;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.cloud.pt.employee.EmployeeVO;
import com.cloud.pt.membership.MembershipVO;
import com.cloud.pt.registration.RegistrationVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MemVO implements UserDetails {
	
	private Long memberNum;
	private String employeeNum;
	@NotBlank
	private String memberName;
	@NotBlank
	private String phone;
	@NotNull
	private Character gender;
	@Past
	private Date birth;
	private Date joinDate;
	private Date expirationDate;
	private Long ptCount;
	private String address;
	
	private EmployeeVO employeeVO;
	private List<MembershipVO> membershipVO;
	private List<RegistrationVO> registrationVO;
	
	
	
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}
}
