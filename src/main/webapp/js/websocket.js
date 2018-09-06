/**
 * 
 */

ws.onmessage = function(ret) {
	var obj = JSON.parse(ret.data);
	console.log(obj.mode);
	switch (obj.mode) {
	case "mail":
		mailHandle(obj);
		break;
	}
}

var mailHandle = function(obj) {
	var mailVo = obj.mail;
	if (mailVo != null) {
		var alarm = "<img src='/images/alarm.png' alt='NEW' style='width:10px;height:10px;'/>";
		$("#mailAlarm").html(alarm);
	}
}

var messageHandle = function(obj) {
	var user = obj.user;
	var str = "<small>" + user.name + "으로부터 메세지 도착</small>";

	console.log("messageHandle");

	document.getElementById("mb").innerHTML = str;

	window.setInterval(function() {
		document.getElementById("mb").innerHTML = "";
	}, 3000);
}
