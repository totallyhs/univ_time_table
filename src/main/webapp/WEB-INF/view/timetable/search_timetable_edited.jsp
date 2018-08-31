<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.row {
	width: 100%;
	display: table;
}

.box {
	display: table-cell;
}

.sname {
	display: block;
	font-size: 1.30em;
	margin-top: 0em;
	margin-bottom: 0em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
	color: white;
}

.sno {
	display: block;
	font-size: .60em;
	margin-top: .1em;
	margin-bottom: .1em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
	color: white;
}
</style>
<!-- / College Timetable -->
<!-- 시간표 만들기 중앙 타이틀 -->
<div class="row">
	<div class="col-sm-4"></div>
	<div class="col-sm-4">
		<div class="box box-a">
		<h1>시간표 만들기</h1>
	</div>
	</div>
	<div class="col-sm-4"></div>
</div>

<!-- 시간표 && 과목 리스트 row -->
<div class="row">
	<div class="col-sm-8">
		<h2>과목 리스트</h2>
		<!--BEGIN HEAD-->
		<small>
			<div id="container" style="margin-left: 0px;">
			<div id="accordion">
		<!--END HEAD-->

				<c:forEach var="subject" items="${subjectList }" varStatus="subjStatus">
					<c:if test="${subjStatus.index%3 == 0 }">
						<div class="row">
					</c:if>
						<div class="col-sm-4">
							<div class='${subject.no }' style="min-width: 200px;">
								<div class="panel panel-primary border-success mb-3 text-center">
									<div class="panel-heading">
										<a class="collapsed text-center" data-toggle="collapse" 
											href="#${subject.no }FIRST" style="text-decoration: none;">
											<span class="card-title text-dark sname">${subject.name }</span>
											<span class="card-subtitle mb-2 text-muted sno">학수번호 : ${subject.no }</span>
										</a>
									</div> <!-- panel-header -->
									
								<div id="${subject.no }FIRST" class="collapse" data-parent="#accordion">
									<div class="panel-body text-left" style="padding: 0px;">
										<table class="table table-hover group table-striped" style="margin: 0px;">
											<thead style="color: gray;">
												<tr>
													<th style="width:40%; padding-left: 0; padding-right: 1.5em;">
														<input type="checkbox" class='${classs.no }' id='${classs.no }' />수업번호
													</th>
													<th style="width:20%; padding-left: 0px;">교수님</th>
													<th style="width:40%;">시간</th>
												</tr>
											</thead>
	  										<tbody>
	  											<c:forEach var="cl" items="${subject.classList }" varStatus="status">
	  												<c:choose>
		  												<c:when test="${status.first }">
		  													<tr data="${cl.no }" id='${cl.id }' class='${cl.no } class'>
		  														<td style="padding-left: 0; padding-right: 1.5em;">
		  															<input type="checkbox" class="clcheckbox" value="${cl.no }"/>&nbsp; ${cl.no }
		  														</td>
					  											<td style="padding-left: 0px; padding-right: 0px;">${cl.professor }</td>
					  											<td>
					  												(<span id="${cl.id}day" class="day">${cl.day}</span>)
					  												<span id="${cl.id}starttime">${cl.starttime }</span>~<span id="${cl.id}endtime">${cl.endtime }</span>
					  											</td>
					  										</tr>
	  													</c:when>
	  													<c:when test="${cl.no == subject.classList[status.index - 1].no }">
	  														<tr data="${cl.no }" id='${cl.id }' class='${cl.no } class'>
		  														<td>  ${cl.no }</td>
					  											<td style="padding-left: 0px; padding-right: 0px;">${cl.professor }</td>
					  											<td>
					  												(<span id="${cl.id}day" class="day">${cl.day}</span>)
					  												<span id="${cl.id}starttime">${cl.starttime }</span>~<span id="${cl.id}endtime">${cl.endtime }</span>
					  											</td>
					  										</tr>
	  													</c:when>
	  													<c:when test="${cl.no != subject.classList[status.index - 1].no }">
	  														<tr data="${cl.no }" id='${cl.id }' class='${cl.no } class'>
		  														<td style="padding-left: 0; padding-right: 1.5em;"><input type="checkbox"/>&nbsp; ${cl.no }</td>
					  											<td style="padding-left: 0px; padding-right: 0px;">${cl.professor }</td>
					  											<td>
					  												(<span id="${cl.id}day" class="day">${cl.day}</span>)
					  												<span id="${cl.id}starttime">${cl.starttime }</span>~<span id="${cl.id}endtime">${cl.endtime }</span>
					  											</td>
					  										</tr>
	  													</c:when>
	  								
	  												</c:choose>
												</c:forEach>
					  						</tbody>
	  									</table> <!-- table -->
									</div><!-- panel-body -->
								<div class="panel-footer text-muted">
									<a role="button" target="_BLANK" href="#" class="btn btn-sm btn-info"><font style="font-size: 8px;">Link</font></a>
									<a role="button" target="_BLANK" href="#" class="btn btn-sm btn-info"><font style="font-size: 8px;">Link</font></a>
								</div> <!-- panel-footer -->
							</div> <!-- collapseFIRST -->
						</div> <!-- panel primary -->
					</div> <!-- subjectno -->
				</div>	<!-- col-sm-4 -->
			<c:if test="${(subjStatus.index%3 == 2 ) or (fn:length(subjectList) - subjStatus.index == 1) }">
				</div>
			</c:if>
		</c:forEach>

		</div>	<!-- accordion -->
	</div>	<!-- container -->
	</small>
</div>	<!-- col-sm-9 -->
		
	<div class="col-sm-4">
		<table border='0' cellpadding='0' cellspacing='0' style="max-height: 700; max-width: 700px; text-align: center;">
			<tr class='days' style="width: 100%;" align="center">
				<th style="width: 15%;"></th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
			</tr>
			<c:forEach var="i" begin="0" end="20" step="2">
			<tr>
				<td class='time'>${Math.floor(9+(i/2)) }.00</td>
				<td id='${i+1}-1'></td>
				<td id='${i+1}-2'></td>
				<td id='${i+1}-3'></td>
				<td id='${i+1}-4'></td>
				<td id='${i+1}-5'></td>
			</tr>
			<tr>
				<td class='time'>${9+(i/2) }.30</td>
				<td id='${i+2}-1'></td>
				<td id='${i+2}-2'></td>
				<td id='${i+2}-3'></td>
				<td id='${i+2}-4'></td>
				<td id='${i+2}-5'></td>
			</tr>
			</c:forEach>
		</table>
	</div>

<script>
	var getClassInfo = function(id) {
		var no = $("#" + id).attr("data");
		var day = $("#"+ id + "day").html();
		var starttime = $("#" + id + "starttime").html();
		var endtime = $("#" + id + "endtime").html();
		
		
		var start = Math.floor((starttime-850)/50);
		var end = Math.floor((endtime-850)/50);
		
		var json = {
				"no" : no,
				"day" : day,
				"start" : start,
				"end" : end,
				"box" : "[" + start + "," + end + "]"
		};
		console.log(json);
		return json;
	}
	
	var onMouseOverAction = function(start, end, day) {
		for (var i=start; i<=end; i++) {
			var id = $("#"+i +"-" + day);
			if("rgb(0, 128, 0)"===id.css("backgroundColor")){
				id.css("backgroundColor","red");
			}else if("rgb(0, 0, 255)"===id.css("backgroundColor")){
				id.css("backgroundColor","yellow");
			}else{
				id.css("backgroundColor", "green");
			}
		}
	}
	
	var onMouseOutAction = function(start, end, day) {
		for (var i=start; i<=end; i++) {
			var id = $("#"+i +"-" + day);
			if("rgb(255, 0, 0)"===id.css("backgroundColor")){
				id.css("backgroundColor","green");											
			}else if("rgb(0, 0, 255)"===id.css("backgroundColor")){
				id.css("backgroundColor","blue");
			}else if("rgb(255, 255, 0)"===$("#"+i).css("backgroundColor")){
				id.css("backgroundColor","blue");
			}else{
				id.css("backgroundColor", "white");
			}
		}
	}
	
	$(".class").on("mouseover", function() {
		var no = $(this).attr("data");
		
		$("." + no).each(function() {
			var id = $(this).attr("id");
			var classJson = getClassInfo(id);
			
			onMouseOverAction(classJson.start, classJson.end, classJson.day);
		});
	}).on("mouseout", function() {
		var no = $(this).attr("data");
			
		$("." + no).each(function() {
			var id = $(this).attr("id");
			var classJson = getClassInfo(id);
				
			onMouseOutAction(classJson.start, classJson.end, classJson.day);
		});
	});
	
	
	
	/*
	$(":checkbox").on("click", function() {
		var val = $(this).attr("class");
		console.log("class val : " +  val);
		console.log($(this).attr("data"));
		var start=parseInt($(this).attr("data").split("-")[1]);
		var end=parseInt($(this).attr("data").split("-")[2]);
		if ($(this).is(":checked")) {
			$("." + val).attr("checked",true);
			if(start===1900||start===2900||start===3900||start===4900||start===5900){
				start=(start%1000)+parseInt((start/1000))*10000;				
				
			}
			for (var i = start; i < end; i=i + 50) {
				$("#" + i).css("backgroundColor", "blue");
			}
		} else {
			$("." + val).prop("checked", false);
			for (var i = start; i < end; i=i + 50) {
				$("#" + i).css("backgroundColor", "green");
			}
		}
	});
	*/
	
	/*
	$(".clcheckbox").on("click", function() {
		var val = $(this).val();
		$.ajax(function() {
			"url":"",
			"method":"post",
			"data" : {
				"no" : $(this).val();
			}
		}).done(function(r) {
			
		});
	});
	*/
	
</script>







