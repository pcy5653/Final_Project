package com.cloud.pt.config;

import java.util.logging.SocketHandler;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSocket
@RequiredArgsConstructor
public class WebSocketConfig implements WebSocketConfigurer{

    private final ChatHandler chatHandler;

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
    
        registry
        	.addHandler(chatHandler, "/ws/chat")
        	.addInterceptors(new HttpSessionHandshakeInterceptor())
        	//(interceptor는 http통신에서 request, response를 가로채는 역할을 한다.)
        	//Httpsession에 있는 값을 가로채서 WebSocketSession에 똑같이 넣어주는 역할을 한다.
        	.setAllowedOrigins("*");
        	
    }
}
	
