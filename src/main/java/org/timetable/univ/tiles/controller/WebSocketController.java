package org.timetable.univ.tiles.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.timetable.univ.model.vo.MemberVo;
import org.timetable.univ.service.WebSocketService;

import com.google.gson.Gson;


@Controller("ws")
public class WebSocketController extends TextWebSocketHandler {

	@Autowired
	@Qualifier("wsMap")
	HashMap<String, List<WebSocketSession>> loggedSessions;
	
	@Autowired
	Gson gson;
	
	@Autowired
	WebSocketService webSocketService;
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//loggedSessions.add(session);
		// 항상 작동하진 않고 HttpSessionHandshakeInterceptor 설정을 해둬야한다.
		Map<String, Object> attrs = session.getAttributes();
		MemberVo vo = (MemberVo)attrs.get("memberVo");
		
		// adding in loggedSessions
		if (!loggedSessions.containsKey(vo.getId())) {
			List<WebSocketSession> websocketList = new ArrayList<WebSocketSession>();
			loggedSessions.put(vo.getId(), websocketList);
		}
		
		loggedSessions.get(vo.getId()).add(session);
		
		
		System.out.println("afterConectionEs=/loggedSession=" +loggedSessions );
	}
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String msg = message.getPayload();
		MemberVo vo = (MemberVo)session.getAttributes().get("memberVo");
		
		Map req = gson.fromJson(msg, Map.class);
		switch ((String)req.get("mode")) {
		case "mail":
			
			String receiver = (String)req.get("receiver");
			webSocketService.sendToOne(req, receiver);
			break;
		}
	}
	
	
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		Map<String, Object> attrs = session.getAttributes();
		
		System.out.println("afterConnectionClosed : " + (attrs.containsKey("memberVo") && attrs.get("memberVo") != null));
		
		if (attrs.containsKey("memberVo") && attrs.get("memberVo") != null) {
			MemberVo vo = (MemberVo)attrs.get("memberVo");
						
			List<WebSocketSession> websocketList = loggedSessions.get(vo.getId());
			
			for (int i=0; i < websocketList.size(); i++) {
				if (websocketList.get(i).getId().equals(session.getId())) {
					websocketList.remove(websocketList.get(i));
				}
			}
			
			System.out.println("afterconnectionclose: websocketList contains session? " + (websocketList.contains(session)));
			
		}
	}
}
