package com.cloud.pt.chat;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ChatMessageVO {
	// 메시지 타입 : 입장, 채팅, 나감
    public enum MessageType {
        ENTER, TALK, QUIT
    }
    private MessageType type; // 메시지 타입
    private Long roomNum; // 방번호
    private String sender; // 메시지 보낸사람
    private String receiver; // 메시지 받는사람
    private String message; // 메시지
    private String chatDate; //보낸 날짜시간
    private String name;

}
