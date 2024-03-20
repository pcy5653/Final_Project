package com.cloud.pt.config;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.cloud.pt.chat.ChatMessageVO;
import com.cloud.pt.chat.ChatService;
import com.cloud.pt.chat.RoomVO;
import com.fasterxml.jackson.core.sym.Name;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

//웹소캣 핸들러를 정의함
@Component
@Log4j2
public class ChatHandler extends TextWebSocketHandler{
	
	@Autowired
	private ChatService chatService;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	private static Map<Long, WebSocketSession> sessions = new HashMap<>();
	
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
      String payload = message.getPayload();
      log.info("payload : {}", payload);
      
      ChatMessageVO chatMessage = objectMapper.readValue(payload, ChatMessageVO.class);
      
      RoomVO room = chatService.findRoomById(chatMessage.getRoomNum());
      log.info("방 번호 : {}", room.getRoomNum());
      
      Long name = Long.valueOf(session.getPrincipal().getName());//sender
      chatMessage.setSender(String.valueOf(name));
      
      log.info("sender1 : {}",chatMessage.getSender());

      if (chatMessage.getType().equals(ChatMessageVO.MessageType.ENTER)) {
    	  // 방에 유저가 맞는지 확인
    	  if(room.getUser1().equals(name)) {
    		  
    		  log.info("user1 맵에 담음:"+room.getUser1());
    		  sessions.put(name, session);
    		  
    	  }else {
    		  if(room.getUser2().equals(name)) {
    			  
    			  log.info("user2 맵에 담음:"+room.getUser2());
    			  sessions.put(name, session);
    		  }else {
    			  log.info("방에 들어올 수 없는 회원 입니다.");
    		  }
    	  }
    	  
    	  chatMessage.setMessage("채팅방에 입장했습니다.");  //TALK일 경우 msg가 있을 거고, 실제 보이지는 않게함
    	  sendToEachSocket(chatMessage, new TextMessage(objectMapper.writeValueAsString(chatMessage)), room, name);
    	  
    	  //이전 메세지들을 list에 넣음
    	  List<ChatMessageVO> list = new ArrayList<>();
    	  list = chatService.chatMessageList(room);
    	  
    	  //반복문으로 이전 메세지 뿌려줌
    	  for(ChatMessageVO c : list) {
    		  c.setType(ChatMessageVO.MessageType.ENTER);
    		  sendToEachSocket(c, new TextMessage(objectMapper.writeValueAsString(c)), room, name);
    	  }
    	  
      }else if (chatMessage.getType().equals(ChatMessageVO.MessageType.QUIT)) {
          sessions.remove(name);

          chatMessage.setMessage(chatMessage.getSender() + "님이 퇴장했습니다..");
          sendToEachSocket(chatMessage, new TextMessage(objectMapper.writeValueAsString(chatMessage)), room, name);
      
      }else {
    	  
          sendToEachSocket(chatMessage, new TextMessage(objectMapper.writeValueAsString(chatMessage)), room, name); //입장,퇴장 아닐 때는 클라이언트로부터 온 메세지 그대로 전달.
      }
      
  }

	private void sendToEachSocket(ChatMessageVO chatMessageVO, TextMessage textMessage,RoomVO room, Long name) throws Exception {
		//set에 넣어 주기 (enter 타입일 경우 자신한테만 보내줌)
		Set<WebSocketSession> chatMember = new HashSet<>();
		
		//보낼때 DB에 바로 저장
		if(chatMessageVO.getType().equals(ChatMessageVO.MessageType.ENTER)){
			//자신만 set에 넣음 (sender이 자신)
				log.info("sender2 : ",name);
			if(room.getUser1().equals(name)){
				chatMember.add(sessions.get(name));
				log.info("set에 {}가 담김", room.getUser1());
			}else {
				chatMember.add(sessions.get(name));
				log.info("set에 {}가 담김", room.getUser2());
			}
			
		}else {
			//맵에 세션이 있는지 확인 후 set에 넣음(없는데 넣으면 널포인트에러 발생)
			if(sessions.get(room.getUser1())==null) {
				
			}else {
				
				chatMember.add(sessions.get(room.getUser1()));
				log.info("User1:"+room.getUser1());
			}
			
			if(sessions.get(room.getUser2())==null) {
				
			}else {
				
				chatMember.add(sessions.get(room.getUser2()));
				log.info("User2:"+room.getUser2());
			}
			
			int result = chatService.messageAdd(chatMessageVO);
			
			if(result>0) {
				log.info("DB 저장 성공");
			}else{
				log.info("DB 저장 실패");
			}
		}
		
		
		
        chatMember.parallelStream().forEach(a -> {
  		try {
  			
  			a.sendMessage(textMessage);
  			
  		} catch (Exception e) {
  			// TODO Auto-generated catch block
  			e.printStackTrace();
  		}
  	  });
}

/* Client가 접속 시 호출되는 메서드 */
  @Override
  public void afterConnectionEstablished(WebSocketSession session) throws Exception {
	  log.info(session + " 클라이언트 접속");
      Long name = Long.valueOf(session.getPrincipal().getName());// config에 써준 코드 때문에 http세션을 가져옴
      
      sessions.put(name, session);
  }

  /* Client가 접속 해제 시 호출되는 메서드드 */

  @Override
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
	  String name = session.getPrincipal().getName();
      log.info(session + name + " 클라이언트 접속 해제");
      sessions.remove(name);
      
  }
}

