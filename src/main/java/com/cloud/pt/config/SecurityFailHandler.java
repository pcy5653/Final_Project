package com.cloud.pt.config;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

//<로그인 실패>
@Component // 객체생성. Bean 역할
@Slf4j
public class SecurityFailHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// 실패 시 message 작성
		
		log.info("==>> Exception : {} ", exception);
		
		String message = "로그인 실패하셨습니다. 다시 접속해 주세요.";
		
		if(exception instanceof InternalAuthenticationServiceException) {
			// 아이디 여부 확인 : exception이 아이디가 없는 경우
			message = "login.fail.noemployeenum";
		}
		
		if(exception instanceof BadCredentialsException) {
			// 비번 확인 : exception이 틀린 비번일 경우
			message = "login.fail.notpassword";
		}
		
		message = URLEncoder.encode(message, "UTF-8");
		response.sendRedirect("/?message="+message);
		
	}
	
}
