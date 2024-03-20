package com.cloud.pt.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

// <로그인 성공>
@Component // 객체생성. Bean 역할
@Slf4j
public class SecuritySuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		// Authentication : 로그인 성공 시, 사용자 정보 가져옴.
		// 비로그인 접속을 막기위함. 어느 페이지에서 로그인해도 "/" 이동.
		
		log.info("==>>>>>>>> Authentication : {}", authentication);
		
		response.sendRedirect("/home");
	}

	
}
