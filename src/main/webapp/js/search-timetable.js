/**
 * 
 */
	var classnoBoxesMap = new Map();
	
	// getClassInfo
	var getClassInfo = function(id) {
		var subjectno = $("#" + id + "subject").val();
		var subjectname = $("#" + id + "subjectName").val();
		var units = $("#" + id + "units").val();
		var no = $("#" + id).attr("data");
		var professor = $("#" + id + "professor").html();
		var day = $("#"+ id + "day").html();
		var starttime = $("#" + id + "starttime").html();
		var endtime = $("#" + id + "endtime").html();
		
		
		var start = Math.floor((starttime-850)/50);
		var end = Math.floor((endtime-850)/50);
		
		var json = {
				"subjectno" : subjectno,
				"subjectname" : subjectname,
				"units" : units,
				"id" : id,
				"no" : no,
				"professor" : professor,
				"day" : day,
				"starttime" : starttime,
				"start" : start,
				"endtime" : endtime,
				"end" : end,
		};
		return json;
	}
	
	// mouseover and mouseout on class .clrow
	$(".clrow").on("mouseover", onMouseOverEvent
			).on("mouseout", onMouseOutEvent);	// mouseover and mouseout on class .clrow


	// on mouse over
	function onMouseOverEvent() {
		console.log("onmouseover");
		var no = $(this).attr("data");
		
		$("." + no).each(function() {
			var id = $(this).attr("id");
			var classJson = getClassInfo(id);
			
			onMouseOverAction(classJson);
		});
	}
	
	var onMouseOverAction = function(json) {
		console.log("mouseover..." + json);
		for (var i=json.start; i<json.end; i++) {
			var id = $("#"+i +"-" + json.day);
			// 하얀색이거나
			if ("rgb(255, 255, 255)"===id.css("backgroundColor")) {
				id.css("backgroundColor", "green");
			} else {
				id.css("backgroundColor","red");
				$("#" + json.no + "checkbox").prop("disabled", true);
			}
		}
	}
	
	// on mouse out
	function onMouseOutEvent() {
		console.log("onmouseout")
		var no = $(this).attr("data");
		
		$("." + no).each(function() {
			var id = $(this).attr("id");
			var classJson = getClassInfo(id);
			
			onMouseOutAction(classJson);
		});
	}
	
	var onMouseOutAction = function(json) {
		console.log("mouseout..." + json);
		for (var i=json.start; i<json.end; i++) {
			// rgb(255, 0, 0) == red
			// rgb(0, 0, 255) == blue
			// rgb(0, 128, 0) == green
			// rgb(255, 255, 0) == yellow
			var boxid = i + "-" + json.day
			var id = $("#" + boxid);
			if ("rgb(0, 128, 0)"===id.css("backgroundColor")) {
				id.css("backgroundColor", "white");
			}
			// 겹치면 무조건 빨간색
			else {
				var color = classnoBoxesMap.get(boxid);
				id.css("backgroundColor", color);
			}
			
		}
	}
	
	
	
	// checkbox on click
	$(".clcheckbox").on("click", function() {
		// no == class no
		var no = $(this).val();
		
		// name == subject no
		var subjectno = $(this).attr("name");
		
		var checked = $(this).is(":checked");
		console.log("clcheckbox clicked checked? " + checked);
		
		// set disable or able checkbox
		setDisablePropOfThisSubject(subjectno, checked);
		
		var jsonList = [];
		$("." + no).each(function() {
			var id = $(this).attr("id");
			var classJson = getClassInfo(id);
			
			jsonList.push(classJson);
		});
		if (checked) {
			checkboxCheckedClickAjax(jsonList);			
		} else {
			checkboxUncheckedClickAjax(jsonList);
		}
		
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
			console.log(r);
			console.log(r[r.length-1]);
			var colorMap = r[r.length-1];
			var color = "";
			var classNo = 0;
			for (var i=0; i<r.length-1; i++) {
				resultJson = r[i];
				// id disable mouseover and mouseout
				var id = resultJson.id;
					$("#" + id).removeClass('clrow');
					$("#" + id).off('mouseover');
					$("#" + id).off('mouseout');
				// get color and classNo
				color = colorMap[resultJson.no];
				classNo = resultJson.no;
				// set backgroundcolor and classnoBoxesMap
				var list = resultJson.boxes;
					for (var j=0; j<list.length; j++) {
						$("#" + list[j]).css("backgroundColor", color);
						classnoBoxesMap.set(list[j], color);
						
						// for subject name and classno
						if (j == Math.floor((list.length)/2)) {
							var subjectname = resultJson.subjectname;
							var str = "<span style='color: white;'>" + subjectname + 
									"<br/>" + classNo + "</span>";
							$("#" + list[j]).html(str);
						}
					}
			} // for
			console.log(classnoBoxesMap);
			
			var sumUnits = parseInt($("#sumUnits").html());
			sumUnits += resultJson.units;
			$("#sumUnits").html(sumUnits);
		});
		
	}
	
	var checkboxUncheckedClickAjax = function(json) {
		// json is list<json> here
		$.ajax({
			"url" : "/timetable/ajax/checkboxunchecked",
			"method" : "post",
			"data" : {
				"json" : JSON.stringify(json)
			}
		}).done(function(r) {
			var classNo = 0;
			for (var i=0; i<r.length; i++) {
				resultJson = r[i];
				// set backgroundcolor
				var list = resultJson.boxes;
				for (var j=0; j<list.length; j++) {
					$("#" + list[j]).css("backgroundColor", "white");
					$("#" + list[j]).html("");
					classnoBoxesMap.delete(list[j]);
				}
				// id disable mouseover and mouseout
				var id = resultJson.id;
					$("#" + id).addClass('clrow');
					$("#" + id).on('mouseout', onMouseOutEvent);
					$("#" + id).on('mouseover', onMouseOverEvent);
			} // for
			
			var sumUnits = parseInt($("#sumUnits").html());
			sumUnits -= resultJson.units;
			$("#sumUnits").html(sumUnits);
		});
		
	}
	
	
	$("#cultureCombineBtn").on("click", function() {
		console.log("#cultureCombineBtn clicked");
		cultureCombinationBtnClickAction();
	});

	// when clicked culture combination btn
	var cultureCombinationBtnClickAction = function() {
		var units = $("#sumUnits").html();
		$.ajax({
			"url" : "/timetable/culture/combination",
			"method" : "post",
			"data" : {
				"unitssum" : units
			}
		}).done(function(r) {
			var empty = r.empty;
			if (!empty) {
				window.location = "/timetable/culture/combination?page=0";
			} else {
				$("#sumUnits").html($("#sumUnits").html() + "       combi not possible");
			}
		})
	}
	
	
	
	
	
	
	