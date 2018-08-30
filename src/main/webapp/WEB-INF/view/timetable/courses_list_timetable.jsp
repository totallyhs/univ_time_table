<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- https://bootsnipp.com/snippets/6X3RP -->
<h2>과목 리스트</h2>
		<c:forEach var="subject" items="${subjectList }">
			<div class='${subject.no }'>
				<input type="checkbox"/>
				학수번호 : ${subject.no } 과목 명 : ${subject.name }
				<c:forEach var="classs" items="${subject.classList }">
					<div data="${classs.no }" id='${classs.id }-${classs.day }${classs.starttime }' class='${classs.no } class' >
						수업번호 : ${classs.no } 교수님 : ${classs.professor } 수업시간 : ${classs.starttime }~${classs.endtime }
					</div>
				</c:forEach>
				
			<hr/>
			</div>
		</c:forEach>


<style>
.sanme {
	display: block;
	font-size: .50em;
	margin-top: 1em;
	margin-bottom: 1em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
}

.sno {
	display: block;
	font-size: .30em;
	margin-top: .80em;
	margin-bottom: .80em;
	margin-left: 0;
	margin-right: 0;
	font-weight: bold;
}
</style>
<!--BEGIN HEAD-->
<small>
<div id="container" style="width:40%; margin-left:5vw">
<div id="accordion" style="width:50%;">

<!--END HEAD-->

<c:forEach var="subject" items="${subjectList }">
	<div class='${subject.no }' style="min-width: 230px;">
		<div class="card border-success mb-3 text-center">
			<div class="card-header">
				<a class="collapsed card-link text-center" data-toggle="collapse" href="#${subject.no }FIRST">
					<span class="card-title text-dark sname">${subject.name }</span>
					<span class="card-subtitle mb-2 text-muted sno">학수번호 : ${subject.no }</span>
				</a>
			</div> <!-- card-header -->
			<div id="${subject.no }FIRST" class="collapse" data-parent="#accordion">
				<div class="card-body text-left" style="padding: 0px;">
					<table class="table table-hover group table-striped">
						<thead>
							<tr>
								<th>수업번호</th>
								<th>교수님</th>
								<th>시간</th>
							</tr>
						</thead>
	  					<tbody>
	  						<c:forEach var="cMap" items="${classMap }">
	  							<c:forEach var="cMap2" items="${cMap.value }">
	  								<c:forEach var="classList" items="${cMap2.value }">
	  									<c:forEach var="class" items="${classList }">
					  	  					<tr data="${class.no }" id='${classs.id }-${classs.day }${classs.starttime }' class='${classs.no } class'>
				  								<td>${class.no }</td>
				  								<td>${class.professor }</td>
				  								<td>${class.starttime }~${classs.endtime }</td>
				  	 						</tr>
	  									</c:forEach>
	  								</c:forEach>
	  	 						</c:forEach>
							</c:forEach>
					  	</tbody>
	  				</table> <!-- table -->
				</div><!-- card-body -->
				<div class="card-footer text-muted">
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
	
	
	
<div class="card border-success mb-3 text-center">
<div class="card-header">
	<a class="collapsed card-link text-center" data-toggle="collapse" href="#collapseFIRST">
		<h5 class="card-title text-dark">First Fold</h5>
		<h6 class="card-subtitle mb-2 text-muted">Subtitle</h6>
	</a>
</div>
<div id="collapseFIRST" class="collapse" data-parent="#accordion">
<div class="card-body text-left">
    
	  <table class="table table-hover group table-striped">
	  	<tbody>   
	  	  <tr>
	  		<td>Title:</td>
	  		<td>Value</td>
	  	 </tr>
	  			
	  		<tr>
	  		<td>Title:</td>
	  		<td>Value</td>
	  	 </tr>
	  
	  		<tr>
	  		<td>Title:</td>
	  		<td>Value</td>
	  	 </tr>
	  	</tbody>
	  	</table>
    </div>
	
	<div class="card-footer text-muted">
		<a role="button" target="_BLANK" href="#" class="btn btn-sm btn-info"><font style="font-size: 8px;">Link</font></a>
		<a role="button" target="_BLANK" href="#" class="btn btn-sm btn-info"><font style="font-size: 8px;">Link</font></a>
	</div>
	
   </div>
</div>



<script>
	$(this)
</script>
