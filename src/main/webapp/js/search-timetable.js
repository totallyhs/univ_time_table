/**
 * 
 */
	// getClassInfo
	var getClassInfo = function(id) {
		var subjectno = $("#" + id + "subject").val();
		var units = $("#" + id + "units").val();
		var no = $("#" + id).attr("data");
		var day = $("#"+ id + "day").html();
		var starttime = $("#" + id + "starttime").html();
		var endtime = $("#" + id + "endtime").html();
		
		
		var start = Math.floor((starttime-850)/50);
		var end = Math.floor((endtime-850)/50);
		
		var json = {
				"subjectno" : subjectno,
				"units" : units,
				"id" : id,
				"no" : no,
				"day" : day,
				"starttime" : starttime,
				"start" : start,
				"endtime" : endtime,
				"end" : end,
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
				$("#" + json.no + "checkbox").prop("disabled", true);
			}else if("rgb(0, 0, 255)"===id.css("backgroundColor")){
				id.css("backgroundColor","yellow");
				$("#" + json.no + "checkbox").prop("disabled", true);
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
		// no == class no
		var no = $(this).val();
		
		// name == subject no
		var subjectno = $(this).attr("name");
		
		var checked = $(this).is(":checked");
		
		// set disable or able checkbox
		setDisablePropOfThisSubject(subjectno, checked);
		
		var jsonList = [];
		$("." + no).each(function() {
			var id = $(this).attr("id");
			var classJson = getClassInfo(id);
			
			jsonList.push(classJson);
		});
		
		checkboxCheckedClickAjax(jsonList);
		
	});
	
	var setDisablePropOfThisSubject = function(subjectno, checked) {
		if (checked) {
			$("." + subjectno + "cl").each(function() {
				if (!$(this).is(":checked")) {
					$(this).prop("disabled", true);
				}
			});
		} else {
			$("." + subjectno + "cl").each(function() {
				$(this).prop("disabled", false);
			})
		}
	}
	
	
	// checkbox on click ajax
	var checkboxCheckedClickAjax = function(json) {
		// json is list<json> here
		$.ajax({
			"url" : "/timetable/ajax/checkboxchecked",
			"method" : "post",
			"data" : {
				"json" : JSON.stringify(json)
			}
		}).done(function(r) {
			for (var i=0; i<r.length; i++) {
				resultJson = r[i];
				// id disable mouseover and mouseout
				var id = resultJson.id;
					$("#" + id).removeClass('clrow');
					$("#" + id).off('mouseover');
					$("#" + id).off('mouseout');
				// set backgroundcolor
				var list = resultJson.boxes;
					for (var j=0; j<list.length; j++) {
						$("#" + list[j]).css("backgroundColor", "blue");
					}
			} // for
			var sumUnits = parseInt($("#sumUnits").html());
			sumUnits += resultJson.units;
			$("#sumUnits").html(sumUnits);
		});
		
	}
	
	var setBackgroundColorOnCheckboxClick = function(json, checked) {
		for (var i = json.start; i <= json.end; i++) {
			var boxId = $("#"+i +"-" + json.day);
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
	
	
	$("#cultureCombineBtn").on("click", function() {
		cultureCombinationBtnClickAction();
	});
	
	// when clicked culture combination btn
	var cultureCombinationBtnClickAction = function() {
		var units = $("#sumUnits").html();
		window.location.href = "/timetable/culture/combination?unitssum=" + units;
	}
	
	
	
	/*
	var clcheckboxOnClickAction = function(json, checked) {
		console.log("clcheckbox checked : " + checked);
		for (var i = json.start; i <= json.end; i++) {
			var boxId = $("#"+i +"-" + json.day);
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
	*/
	
	
	
	