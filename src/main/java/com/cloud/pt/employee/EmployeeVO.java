package com.cloud.pt.employee;


import java.sql.Date;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.validation.constraints.Future;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import com.cloud.pt.attendance.AttendanceVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmployeeVO implements UserDetails {
	
	
	private String employeeNum;
	@NotBlank(message="이름을 입력하세요.")
	private String name;
	
	@Length(min=8, max=12)
	//@Pattern(regexp = "(?=.*[0-9])(?=.*[a-z])(?=.*\\\\W)(?=\\\\S+$)")
	private String password;
	@Pattern(regexp="01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})", message="'-'를 빼고 010으로 시작하는 번호 8자리를 입력해주세요.")
	private String phone;
	@NotBlank(message="주소를 입력해주세요.")
	private String address;
	@NotNull
	private Character gender;
	@Past(message="생일을 입력해주세요.")
	private Date birth;
	private Date joinDate;
	@Null
	private String quitDate;
	@NotBlank
	private String state;
	@NotBlank
	private String position;
	private Long leaveDate;
	private String signFile;
	private String signOriginal;
	private String proFile;
	private String proOriginal;
	
	// attendance
	private List<AttendanceVO> list;
	
	// career
	private List<CareerVO> careers;
	
	// certification
	private List<CertificationVO> certifications;
	
	
	
    // UserDetails의 override	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// 사용자 권한을 Security에서 사용할 수 있도록 변환
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(this.getPosition()));
		return authorities;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return employeeNum;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}
}
