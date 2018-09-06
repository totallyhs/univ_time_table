package org.timetable.univ.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

@Service
public class WebSocketService {

	@Autowired
	@Qualifier("wsMap")
	HashMap<String, List<WebSocketSession>> loggedSessions;
	
	@Autowired
	Gson gson;
	
	public void sendToOne(Map data, String target) {
		TextMessage msg = new TextMessage(gson.toJson(data));
		if (loggedSessions.containsKey(target)) {
			List<WebSocketSession> websocketList = (List<WebSocketSession>)loggedSessions.get(target);
			for (int i=0; i<websocketList.size(); i++) {
				try {
					websocketList.get(i).sendMessage(msg);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	
	
}
