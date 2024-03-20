package com.cloud.pt.chat;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.WebSocketSession;

import com.cloud.pt.employee.EmployeeVO;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/chat/*")
@Log4j2
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@GetMapping("chat")
    public String chatRoom(Model model, @RequestParam Long roomNum){
        RoomVO room = chatService.findRoomById(roomNum);
        model.addAttribute("room",room);   //현재 방에 들어오기위해서 필요한데...... 접속자 수 등등은 실시간으로 보여줘야 돼서 여기서는 못함
        return "chat/chat";
    }
	
	@GetMapping("room")
	public String chatList(Model model) throws Exception{
		log.info("메신저 시작");
		
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		
		//직원 테이블에서 이름과 직급을 리스트로 가져옴 (자신 제외)
		List<EmployeeVO> list = chatService.getChatList(b.getName());
		
		model.addAttribute("list", list);
		return "chat/room";
	}
	
	@PostMapping("createRoom")  //방을 만들었으면 해당 방으로 가야지.
    public String createRoom(Model model, RoomVO roomVO) throws Exception{
		log.info("방생성 중");
		
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		roomVO.setUser1(Long.valueOf(b.getName()));
		log.info("user1 : {}", roomVO.getUser1());
		log.info("user2 : {}", roomVO.getUser2());
		
		//방 db 저장하기 위해 서비스로
		int result = chatService.createRoom(roomVO);
		
        model.addAttribute("result",result);
        
        return "commons/ajaxResult";  //만든사람이 채팅방 1빠로 들어가게 됩니다
    }
	
	@GetMapping("roomCheck")
	public String roomCheck(Model model, RoomVO roomVO)throws Exception{
		//자신의 아이디도 넣어줌
		
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		roomVO.setUser1(Long.valueOf(b.getName()));
		
		roomVO=chatService.roomCheck(roomVO);
		
		//방이 있을때 없을때
		if(roomVO==null) {//getRoomNum이 아닌 roomVO 자체가 null이 나오므로 roomVO로 넣어줌
			model.addAttribute("result",0);		
		}else {
			model.addAttribute("result",roomVO.getRoomNum());
		}
		
		return "commons/ajaxResult";
		
	}
	
	@GetMapping("search")
	@ResponseBody
	public Object getString(EmployeeVO employeeVO) throws Exception{
		log.info("search");
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		employeeVO.setEmployeeNum(b.getName());
		List<EmployeeVO> list = chatService.getSearch(employeeVO);
		
		Map<String, Object> listMap = new HashMap<>();
		listMap.put("list", list);

		return listMap;
	}
	
	@GetMapping("totalsearch")
	
	public String getString(EmployeeVO employeeVO, Model model) throws Exception{
		log.info("totalsearch");
		SecurityContext context = SecurityContextHolder.getContext();
		org.springframework.security.core.Authentication b = context.getAuthentication();
		employeeVO.setEmployeeNum(b.getName());
		List<EmployeeVO> list = chatService.getSearch(employeeVO);
		
		model.addAttribute("list", list);

		return "chat/chatList";
	}
	
	@GetMapping("getsomeone")
	@ResponseBody
	public Object getSomeone(EmployeeVO employeeVO) throws Exception{
		log.info("someone");
		employeeVO = chatService.getSomeone(employeeVO);
		
		Map<String, Object> map = new HashMap<>();
		map.put("one", employeeVO);

		return map;
	}
}
