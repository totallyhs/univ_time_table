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
		<div class="row">
			<div class="col-sm-4">
				<h2>과목 리스트</h2>
			</div>
			<div class="col-sm-4"></div>
			<div class="col-sm-4">
				<button type="button" class="btn btn-success" id="cultureCombineBtn" style="margin-top: 17px;">교양 자동</button>
			</div>
		</div>
		<!--BEGIN HEAD-->
		<small>
			<div id="container" style="margin-right: 0px;margin-left: 0px;">
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
											<span class="card-title text-dark sname">${subject.name } <small>(${subject.units })</small></span>
											<span class="card-subtitle mb-2 text-muted sno">학수번호 : ${subject.no }</span>
										</a>
									</div> <!-- panel-header -->
									
								<div id="${subject.no }FIRST" class="collapse" data-parent="#accordion">
									<div class="panel-body text-left" style="padding: 0px;">
										<table class="table table-hover group table-striped" style="margin: 0px;">
											<thead style="color: gray;">
												<tr>
													<th style="width:40%; padding-left: 0; padding-right: 1.5em;">
														<input type="checkbox" class='${classs.no } subjcheckbox' id='${classs.no }' />수업번호
													</th>
													<th style="width:20%; padding-left: 0px;">교수님</th>
													<th style="width:40%;">시간</th>
												</tr>
											</thead>
	  										<tbody>
	  											<c:forEach var="cl" items="${subject.classList }" varStatus="status">
	  												<c:choose>
		  												<c:when test="${status.first }">
		  													<tr data="${cl.no }" id='${cl.id }' class='${cl.no } clrow'>
		  														<td style="padding-left: 0; padding-right: 1.5em;">
		  															<input type="checkbox" id="${cl.no }checkbox" name="${subject.no }" class="clcheckbox ${subject.no }cl" value="${cl.no }"/>&nbsp; ${cl.no }
		  														</td>
					  											<td id="${cl.id }professor" style="padding-left: 0px; padding-right: 0px;">${cl.professor }</td>
					  											<td>
					  												(<span id="${cl.id}day" class="day">${cl.day}</span>)
					  												<span id="${cl.id}starttime">${cl.starttime }</span>~<span id="${cl.id}endtime">${cl.endtime }</span>
					  												<input type="hidden" id="${cl.id }subjectName" value="${subject.name}"/>
					  												<input type="hidden" id="${cl.id }subject" value="${subject.no}"/>
					  												<input type="hidden" id="${cl.id }units" value="${subject.units }"/>
					  											</td>
					  										</tr>
	  													</c:when>
	  													<c:when test="${cl.no == subject.classList[status.index - 1].no }">
	  														<tr data="${cl.no }" id='${cl.id }' class='${cl.no } clrow'>
		  														<td>  ${cl.no }</td>
					  											<td id="${cl.id }professor" style="padding-left: 0px; padding-right: 0px;">${cl.professor }</td>
					  											<td>
					  												(<span id="${cl.id}day" class="day">${cl.day}</span>)
					  												<span id="${cl.id}starttime">${cl.starttime }</span>~<span id="${cl.id}endtime">${cl.endtime }</span>
					  												<input type="hidden" id="${cl.id }subjectName" value="${subject.name}"/>
					  												<input type="hidden" id="${cl.id }subject" value="${subject.no}"/>
					  												<input type="hidden" id="${cl.id }units" value="${subject.units }"/>
					  											</td>
					  										</tr>
	  													</c:when>
	  													<c:when test="${cl.no != subject.classList[status.index - 1].no }">
	  														<tr data="${cl.no }" id='${cl.id }' class='${cl.no } clrow'>
		  														<td style="padding-left: 0; padding-right: 1.5em;">
		  															<input type="checkbox" id="${cl.no }checkbox" name="${subject.no }" class="clcheckbox ${subject.no }cl" value="${cl.no }"/>&nbsp; ${cl.no }
		  														</td>
					  											<td id="${cl.id }professor" style="padding-left: 0px; padding-right: 0px;">${cl.professor }</td>
					  											<td>
					  												(<span id="${cl.id}day" class="day">${cl.day}</span>)
					  												<span id="${cl.id}starttime">${cl.starttime }</span>~<span id="${cl.id}endtime">${cl.endtime }</span>
					  												<input type="hidden" id="${cl.id }subjectName" value="${subject.name}"/>
					  												<input type="hidden" id="${cl.id }subject" value="${subject.no}"/>
					  												<input type="hidden" id="${cl.id }units" value="${subject.units }"/>
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
		<p>총 학점 : <span id="sumUnits">0</span> </p>
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
				<td id='${i+1}-1' style="background-color: white;"></td>
				<td id='${i+1}-2' style="background-color: white;"></td>
				<td id='${i+1}-3' style="background-color: white;"></td>
				<td id='${i+1}-4' style="background-color: white;"></td>
				<td id='${i+1}-5' style="background-color: white;"></td>
			</tr>
			<tr>
				<td class='time'>${9+(i/2) }.30</td>
				<td id='${i+2}-1' style="background-color: white;"></td>
				<td id='${i+2}-2' style="background-color: white;"></td>
				<td id='${i+2}-3' style="background-color: white;"></td>
				<td id='${i+2}-4' style="background-color: white;"></td>
				<td id='${i+2}-5' style="background-color: white;"></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<span id="listOfColor">
	
	</span>

<script src="/js/search-timetable.js"></script>



















