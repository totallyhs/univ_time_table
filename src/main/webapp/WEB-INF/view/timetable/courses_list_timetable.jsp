<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- https://bootsnipp.com/snippets/6X3RP -->

<style>
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
<!--BEGIN HEAD-->
<small>
<div id="container" style="width:40%; margin-left:5vw">
<div id="accordion" style="width:50%;">

<!--END HEAD-->

<c:forEach var="subject" items="${subjectList }">
	<div class='${subject.no }' style="min-width: 230px;">
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
								<th>수업번호</th>
								<th>교수님</th>
								<th>시간</th>
							</tr>
						</thead>
	  					<tbody>
	  						<c:forEach var="cl" items="${subject.classList }" varStatus="status">
	  							<c:choose>
		  							<c:when test="${status.first }">
		  								<tr data="${cl.no }" id='${cl.id }-${cl.day }${cl.starttime }' class='${cl.no } class'>
		  									<td style="padding-left: 0; padding-right: 1.5em;"><input type="checkbox"/>&nbsp; ${cl.no }</td>
					  						<td>${cl.professor }</td>
					  						<td><span class="day">(${cl.day})</span>${cl.starttime }~${cl.endtime }</td>
					  					</tr>
	  								</c:when>
	  								<c:when test="${cl.no == subject.classList[status.index - 1].no }">
	  									<tr data="${cl.no }" id='${cl.id }-${cl.day }${cl.starttime }' class='${cl.no } class'>
		  									<td>  ${cl.no }</td>
					  						<td>${cl.professor }</td>
					  						<td><span class="day">(${cl.day})</span>${cl.starttime }~${cl.endtime }</td>
					  					</tr>
	  								</c:when>
	  								<c:when test="${cl.no != subject.classList[status.index - 1].no }">
	  									<tr data="${cl.no }" id='${cl.id }-${cl.day }${cl.starttime }' class='${cl.no } class'>
		  									<td style="padding-left: 0; padding-right: 1.5em;"><input type="checkbox"/>&nbsp; ${cl.no }</td>
					  						<td>${cl.professor }</td>
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
</c:forEach>
</div>
</div>
</small>
