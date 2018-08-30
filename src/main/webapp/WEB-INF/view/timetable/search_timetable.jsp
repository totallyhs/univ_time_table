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
	<div class="box box-b col-sm-7">
		<h2>과목 리스트</h2>
		<c:forEach var="subject" items="${subjectList }">
			<div class='${subject.no }'>
				<input type="checkbox" id='${subject.no }' /> 학수번호 : ${subject.no }
				과목 명 : ${subject.name }
				<c:forEach var="classs" items="${subject.classList }">
					<div data="${classs.no }"
						id='${classs.id }-${classs.day }${classs.starttime }-${classs.day }${classs.endtime }'
						class='${classs.no } class'>
						<input type="checkbox" data="${classs.id }-${classs.day }${classs.starttime }-${classs.day }${classs.endtime }" class='${classs.no }' id='${classs.no }' />수업번호
						: ${classs.no } 교수님 : ${classs.professor } 수업시간 :
						${classs.starttime }~${classs.endtime }
					</div>
				</c:forEach>

				<hr />
			</div>
		</c:forEach>
	</div>
	<!-- 중간 공백 -->
	<div class="col-sm-1"></div>
	<h2></h2>

	<div class="box box-c col-sm-4">
		<table border='0' cellpadding='0' cellspacing='0'
			style="max-height: 700; max-width: 700px; text-align: center;">
			<tr class='days' style="width: 100%;" align="center">
				<th style="width: 15%;"></th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
			</tr>
			<tr>
				<td class='time'>09.00</td>
				<td id='10900'>.</td>
				<td id='20900'></td>
				<td id='30900'></td>
				<td id='40900'></td>
				<td id='50900' style="background-color: green;"></td>
			</tr>
			<tr>
				<td class='time'>09.30</td>
				<td id='10950'></td>
				<td id='20950'></td>
				<td id='30950'></td>
				<td id='40950'></td>
				<td id='50950'></td>
			</tr>
			<c:forEach var="i" begin="10" end="19" step="1">

				<tr>
					<td class='time'>${i }.00</td>
					<td id='1${i }00'>.</td>
					<td id='2${i }00'></td>
					<td id='3${i }00'></td>
					<td id='4${i }00'></td>
					<td id='5${i }00'></td>
				</tr>
				<tr>
					<td class='time'>${i }.30</td>
					<td id='1${i }50'></td>
					<td id='2${i }50'></td>
					<td id='3${i }50'></td>
					<td id='4${i }50'></td>
					<td id='5${i }50'></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<button id='example'>버튼</button>
<script>
	$(".class").on("mouseover",function() {

		var data = $(this).attr("data");
				
		$(".class").each(function() {
					
							if ($(this).hasClass(data)) {
								var start = parseInt($(this).attr("id").split("-")[1]);
								var end = parseInt($(this).attr("id").split("-")[2]);
								var cid = parseInt($(this).attr("id").split("-")[0]);
								console.log(start+"/"+end);
								if(start===1900||start===2900||start===3900||start===4900||start===5900){
									start=(start%1000)+parseInt((start/1000))*10000;
									
									for (var i = start; i < end; i=i + 50) {
										
										if("rgb(0, 128, 0)"===$("#"+i).css("backgroundColor")){
											console.log($("#"+i).css("backgroundColor"));
											$("#"+i).css("backgroundColor","red");
											
										}else if("rgb(0, 0, 255)"===$("#"+i).css("backgroundColor")){
											$("#"+i).css("backgroundColor","yellow");
											console.log($("#"+i).css("backgroundColor"));
										}else{
										$("#" + i).css("backgroundColor", "green");
										}
									}
									
								}else{
									for (var i = start; i < end; i=i + 50) {
										if("rgb(0, 128, 0)"===$("#"+i).css("backgroundColor")){
											$("#"+i).css("backgroundColor","red");											
										}else if("rgb(0, 0, 255)"===$("#"+i).css("backgroundColor")){
											$("#"+i).css("backgroundColor","yellow");
											console.log($("#"+i).css("backgroundColor"));
										}else{
										$("#" + i).css("backgroundColor", "green");
										}
									}
								}
								
							}	
							
						});

			}).on("mouseout",function() {
				var data = $(this).attr("data");

				$(".class").each(
						function() {
							if ($(this).hasClass(data)) {
								var start = parseInt($(this).attr("id").split("-")[1]);
								var end = parseInt($(this).attr("id").split("-")[2]);
								console.log(start+"/"+end);
								if(start===1900||start===2900||start===3900||start===4900||start===5900){
									start=(start%1000)+parseInt((start/1000))*10000;
									for (var i = start; i < end; i=i + 50) {
										if("rgb(255, 0, 0)"===$("#"+i).css("backgroundColor")){
											$("#"+i).css("backgroundColor","green");											
										}else if("rgb(0, 0, 255)"===$("#"+i).css("backgroundColor")){
											$("#"+i).css("backgroundColor","blue");
											console.log($("#"+i).css("backgroundColor"));
										}else if("rgb(255, 255, 0)"===$("#"+i).css("backgroundColor")){
											$("#"+i).css("backgroundColor","blue");
											console.log($("#"+i).css("backgroundColor"));
										}else{
											$("#" + i).css("backgroundColor", "white");
										}
									}
								}else{
									for (var i = start; i < end; i=i + 50) {
										if("rgb(255, 0, 0)"===$("#"+i).css("backgroundColor")){
											$("#"+i).css("backgroundColor","green");											
										}else if("rgb(0, 0, 255)"===$("#"+i).css("backgroundColor")){
											$("#"+i).css("backgroundColor","blue");
										}else if("rgb(255, 255, 0)"===$("#"+i).css("backgroundColor")){
											$("#"+i).css("backgroundColor","blue");
											console.log($("#"+i).css("backgroundColor"));
										}else{
											$("#" + i).css("backgroundColor", "white");
										}
									}
								}
							}
						});
			});
	$(":checkbox").on("click", function() {
		var val = $(this).attr("id");
		console.log(val);
		console.log($(this).attr("data"));
		var start=parseInt($(this).attr("data").split("-")[1]);
		var end=parseInt($(this).attr("data").split("-")[2]);
		if ($(this).is(":checked")) {
			$("." + val).attr("checked",true);
			if(start===1900||start===2900||start===3900||start===4900||start===5900){
				start=(start%1000)+parseInt((start/1000))*10000;				
				for (var i = start; i < end; i=i + 50) {
					$("#" + i).css("backgroundColor", "blue");
				}
				
			}else{
				for (var i = start; i < end; i=i + 50) {
					$("#" + i).css("backgroundColor", "blue");
					console.log($("#"+i).css("backgroundColor"));
				}
			}
		} else {
			$("." + val).prop("checked", false);
		}
	});
</script>