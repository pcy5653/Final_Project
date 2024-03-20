package com.cloud.pt.employee;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.apache.ibatis.plugin.Intercepts;
import org.hibernate.validator.constraints.Length;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PasswordVO {
	
	// 기존비번 check
	private String inputPw;
	
	// 새로운 비밀번호
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[*@#$%^&+=])(?=\\S+$).{8,12}$",message="비밀번호는 8자에서 12자 사이이며, 소문자+숫자+특수문자(*,@,#,$,%,^,&,+,=)를 포함해야 합니다.")
	@Size(min=8, max=12,  message="다시 시도해주세요." )
	private String newPw;
	private String pwCheck;
}
