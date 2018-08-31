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
	<div class="box box-b col-sm-9">
		<h2>과목 리스트</h2>
<!--BEGIN HEAD-->
	<div id="container" style="width:40%; margin-left: 0px;">
	<div id="accordion" style="width:50%;">
<!--END HEAD-->

<c:forEach var="subject" items="${subjectList }" varStatus="subjStatus">
	<c:if test="${subjStatus.index%3 == 0 }">
		<div class="row">
	</c:if>
	<div class='${subject.no } col-sm-4' style="min-width: 200px;">
		<div class="panel panel-primary border-success mb-3 text-center">
			<div class="panel-heading">
				<a class="collapsed text-center" data-toggle="collapse" 
					href="#${subject.no }FIRST" style="text-decoration: none;">
					<span class="card-title text-dark sname">${subject.name }</span>
					<span class="card-subtitle mb-2 text-muted sno">학수번호 : ${subject.no }</span>
				</a>
			</div> <!-- card-header -->
			<div id="${subject.no }FIRST" class="collapse" data-parent="#accordion">
				<div class="panel-body text-left" style="padding: 0px;">
					<table class="table table-hover group table-striped" style="margin: 0px;">
						<thead style="color: gray;">
							<tr>
								<th style="width:40%;">수업번호</th>
								<th style="width:20%; padding-left: 0px;">교수님</th>
								<th style="width:40%;">시간</th>
							</tr>
						</thead>
	  					<tbody>
	  						<c:forEach var="cl" items="${subject.classList }" varStatus="status">
	  							<c:choose>
		  							<c:when test="${status.first }">
		  								<tr data="${cl.no }" id='${cl.id }-${cl.day }${cl.starttime }' class='${cl.no } class'>
		  									<td style="padding-left: 0; padding-right: 1.5em;"><input type="checkbox"/>&nbsp; ${cl.no }</td>
					  						<td style="padding-left: 0px; padding-right: 0px;">${cl.professor }</td>
					  						<td><span class="day">(${cl.day})</span>${cl.starttime }~${cl.endtime }</td>
					  					</tr>
	  								</c:when>
	  								<c:when test="${cl.no == subject.classList[status.index - 1].no }">
	  									<tr data="${cl.no }" id='${cl.id }-${cl.day }${cl.starttime }' class='${cl.no } class'>
		  									<td>  ${cl.no }</td>
					  						<td style="padding-left: 0px; padding-right: 0px;">${cl.professor }</td>
					  						<td><span class="day">(${cl.day})</span>${cl.starttime }~${cl.endtime }</td>
					  					</tr>
	  								</c:when>
	  								<c:when test="${cl.no != subject.classList[status.index - 1].no }">
	  									<tr data="${cl.no }" id='${cl.id }-${cl.day }${cl.starttime }' class='${cl.no } class'>
		  									<td style="padding-left: 0; padding-right: 1.5em;"><input type="checkbox"/>&nbsp; ${cl.no }</td>
					  						<td style="padding-left: 0px; padding-right: 0px;">${cl.professor }</td>
					  						<td><span class="day">(${cl.day})</span>${cl.starttime }~${cl.endtime }</td>
					  					</tr>
	  								</c:when>
	  							
	  							</c:choose>
							</c:forEach>
					  	</tbody>
	  				</table> <!-- table -->
				</div><!-- card-body -->
				<div class="panel-footer text-muted">
					<a role="button" target="_BLANK" href="#" class="btn btn-sm btn-info"><font style="font-size: 8px;">Link</font></a>
					<a role="button" target="_BLANK" href="#" class="btn btn-sm btn-info"><font style="font-size: 8px;">Link</font></a>
				</div>
			</div> <!-- collapseFIRST -->
		</div>
	</div>
	<c:if test="${subjStatus.index%3 == 2 }">
		</div>
	</c:if>
</c:forEach>
	
</div>
</div>
	</div>	<!-- col-sm-9 -->
		
	<div class="box box-c col-sm-3">
		<table border='0' cellpadding='0' cellspacing='0' style="max-height: 700; max-width: 700px; text-align: center;">
			<tr class='days' style="width: 100%;" align="center">
				<th style="width: 15%;"></th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
			</tr>
			<c:forEach var="i" begin="9" end="19" step="1">
			
			<tr>
				<td class='time'>${i }.00</td>
				<td id='1${i }00'>.</td>
				<td id='2${i }00'> </td>
				<td id='3${i }00'> </td>
				<td id='4${i }00'> </td>
				<td id='5${i }00'> </td>
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

<button id='example' >버튼</button>
<script>
	$(".class").on("mouseover",function(){
		var data=$(this).attr("data");
		
		$(".class").each(function(){
			if($(this).hasClass(data)){
				console.log($(this).attr("id"));
				$("#"+$(this).attr("id").split("-")[1]).css("backgroundColor","green");
			}
		});
		
	}).on("mouseout",function(){
var data=$(this).attr("data");
		
		$(".class").each(function(){
			if($(this).hasClass(data)){
				console.log($(this).attr("id"));
				$("#"+$(this).attr("id").split("-")[1]).css("backgroundColor","white");
			}
		});
		
	});
</script>