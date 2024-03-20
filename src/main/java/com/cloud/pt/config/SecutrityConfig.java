package com.cloud.pt.config;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

// WebSecurity 설정 클래스 생성
@Configuration // springBoot 실행 시, 가장 먼저 읽히는 파일 -> **-context.xml 파일 역할
@EnableWebSecurity // security 활성화를 통해 아래 설정한 보안을 사용할 수 있음
public class SecutrityConfig {
	
	@Autowired
	private SecuritySuccessHandler successHandler;
	@Autowired
	private SecurityFailHandler failHandler;
	@Autowired
	private SecurityLogoutAdd logoutAdd;
	@Autowired
	private SecurityLogoutHandler logoutHandler;
	
	
	@Bean // API이 객체생성
	WebSecurityCustomizer webSecurityCustomizer() {
		// Security에서 무시해야하는 URL 패턴 등록
		
		return web -> web
				.ignoring()
				.antMatchers("/assets/**")
				.antMatchers("/fonts/**")
				.antMatchers("/fullcalendar-6.1.9/**")
				.antMatchers("/html/**")
				.antMatchers("/js/**")
				.antMatchers("/libs/**")
				.antMatchers("/scss/**")
				.antMatchers("/tasks/**");
	}
	
	
	// Security Filter 설정
	@Bean
	SecurityFilterChain securityFilteChain(HttpSecurity httpSecurity)throws Exception{
		
		httpSecurity
			.cors()	
			.and()
			.csrf()
			.disable()
			.authorizeHttpRequests()
				.antMatchers("/employee/join").hasRole("GENERAL")	
				.antMatchers("/admin/attendance").hasRole("RESOURCES")
				.antMatchers("/notice/add").hasAnyRole("CEO", "GENERAL")
				.antMatchers("/notice/update").hasAnyRole("CEO", "GENERAL")
				.antMatchers("/notice/delete").hasAnyRole("CEO", "GENERAL")
				.antMatchers("/membership/form").hasAnyRole("CUSTOMER","GENERAL")
				.antMatchers("/membership/delete").hasAnyRole("CUSTOMER","GENERAL")
				.antMatchers("/registration/form").hasAnyRole("CUSTOMER","GENERAL")
				.antMatchers("/machine/add").hasAnyRole("GENERAL", "FACILITY")
				.antMatchers("/locker/lockerList2").hasAnyRole("GENERAL","FACILITY")
				.antMatchers("/").permitAll()
				.and()
				
			// login form 방식 인증
			.formLogin()
				.loginPage("/employee/login")       // login post 처리 경로 (개발자가 만든 폼 요청)
				.usernameParameter("employeeNum")   // 기본 : username / 개발자 다른 파라미터이름 사용시, 꼭 작성
				//.passwordParameter("password")
				.successHandler(successHandler)     // 인증 성공후 실행
				.failureHandler(failHandler)        // 인증 실패후 실행
				.permitAll()
				.and()
				
			// logout
			.logout()
				.logoutUrl("/employee/logout")      // logout post 처리 경로 (기본적으로 POST요청)
				.addLogoutHandler(logoutAdd)        // logout 처리 (세션 무효화 처리)
				.logoutSuccessHandler(logoutHandler)// logout 성공 처리 메서드 (리다이렉트 처리)
				.invalidateHttpSession(true)        // logout 시 session 만료
				.deleteCookies("JSESSIONID")		// logout 쿠키 삭제
				.permitAll()
				.and()
				
			// 403 예외처리 (권한에 따른 페이지 처리)
			.exceptionHandling()
				.accessDeniedPage("/accessDenied")
			
				;
		
		return httpSecurity.build();
	}
	
	
	
}
