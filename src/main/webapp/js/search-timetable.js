/**
 * 
 */
	// getClassInfo
	var getClassInfo = function(id) {
		var no = $("#" + id).attr("data");
		var day = $("#"+ id + "day").html();
		var starttime = $("#" + id + "starttime").html();
		var endtime = $("#" + id + "endtime").html();
		
		
		var start = Math.floor((starttime-850)/50);
		var end = Math.floor((endtime-850)/50);
		
		var json = {
				"id" : id,
				"no" : no,
				"day" : day,
				"start" : start,
				"end" : end,
				"box" : "[" + start + "," + end + "]"
		};
		return json;
	}
	
	// mouseover and mouseout on class .clrow
	$(".clrow").on("mouseover", function() {
		console.log("onmouseover");
		var no = $(this).attr("data");
		
		$("." + no).each(function() {
			var id = $(this).attr("id");
			var classJson = getClassInfo(id);
			
			onMouseOverAction(classJson);
		});
	}).on("mouseout", function() {
		console.log("onmouseout")
		var no = $(this).attr("data");
		
		$("." + no).each(function() {
			var id = $(this).attr("id");
			var classJson = getClassInfo(id);
			
			onMouseOutAction(classJson);
		});
	});	// mouseover and mouseout on class .clrow


	// on mouse over
	var onMouseOverAction = function(json) {
		console.log("mouseover..." + json);
		for (var i=json.start; i<=json.end; i++) {
			var id = $("#"+i +"-" + json.day);
			if("rgb(0, 128, 0)"===id.css("backgroundColor")){
				id.css("backgroundColor","red");
			}else if("rgb(0, 0, 255)"===id.css("backgroundColor")){
				id.css("backgroundColor","yellow");
			}else{
				id.css("backgroundColor", "green");
			}
		}
	}
	
	// on mouse out
	var onMouseOutAction = function(json) {
		console.log("mouseout..." + json);
		for (var i=json.start; i<=json.end; i++) {
			// rgb(255, 0, 0) == red
			// rgb(0, 0, 255) == blue
			// rgb(0, 255, 0) == green
			// rgb(255, 255, 0) == yellow
			var id = $("#"+i +"-" + json.day);
			if("rgb(255, 0, 0)"===id.css("backgroundColor")){
				id.css("backgroundColor","green");											
			}else if("rgb(0, 0, 255)"===id.css("backgroundColor")){
				id.css("backgroundColor","blue");
			}else if("rgb(255, 255, 0)"===id.css("backgroundColor")){
				id.css("backgroundColor","blue");
			}else{
				id.css("backgroundColor", "white");
			}
		}
	}
	
	// checkbox on click
	$(".clcheckbox").on("click", function() {
		console.log("clcheckbox clicked");
		var no = $(this).val();
		var checked = $(this).is(":checked");
		
		
		
		$("." + no).each(function() {
			console.log(".no each");
			var id = $(this).attr("id");
			var classJson = getClassInfo(id);
			
			clcheckboxOnClickAction(classJson, checked);
		});
	});
	
	// checkbox on click ajax
	var checkboxclickajax = function(json) {
		$.ajax({
			"url" : "/timetable/ajax/checkbox",
			"method" : "post",
			"data" : {
				"info" : JSON.stringify(json)
			}
		}).done(function(r) {
			
		});
		
	}
	
	
	var clcheckboxOnClickAction = function(start, end, day, checked, id) {
		console.log("clcheckbox checked : " + checked);
		for (var i = start; i <= end; i++) {
			var boxId = $("#"+i +"-" + day);
			if (checked) {
				boxId.css("backgroundColor", "blue");
				$("#" + id).removeClass('clrow');
				$("#" + id).off('mouseover');
				$("#" + id).off('mouseout');
			} else {
				boxId.css("backgroundColor", "green");
				$("#" + id).addClass('clrow');
				$("#" + id).on('mouseover');
				$("#" + id).on('mouseout');
			}
		}
	}
	
	
	
	
	var setBackgroundColorOnRadioClick = function(json, checked) {
		for (var i = json.start; i <= json.end; i++) {
			var boxId = $("#"+i +"-" + day);
			if (checked) {
				boxId.css("backgroundColor", "blue");
				$("#" + id).removeClass('clrow');
				$("#" + id).off('mouseover');
				$("#" + id).off('mouseout');
			} else {
				boxId.css("backgroundColor", "green");
				$("#" + id).addClass('clrow');
				$("#" + id).on('mouseover');
				$("#" + id).on('mouseout');
			}
		}
	}
	
	var ifCheckedRadio = function(json) {
		var boxId = $("#" + i + "-" + day);
		boxId.css("backgroundColor", "blue");
		$("#" + id).removeClass('clrow');
		$("#" + id).off('mouseover');
		$("#" + id).off('mouseout');
		
		$("." + no).each(function() {
			var otherId = $(this).attr("id");
			if (otherId != boxId) {
				$("#" + otherId).addClass('clrow');
				$("#" + otherId).on('mouseover');
				$("#" + otherId).on('mouseout');
			}
		});
	}
	
	
	
	
	
	