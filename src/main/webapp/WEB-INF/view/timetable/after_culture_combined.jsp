<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

	<c:forEach begin="0" end="${listLength -1 }" var="page">
		<a href="/timetable/culture/combination?page=${page }">
			${page }
		</a>
	</c:forEach>

<div align="center">
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

<p id="test">

</p>
		
<script>
	// cultureCombinedTimetable instanceof Json
	var clmap = JSON.parse("${cultureCombinedTimetable}");
	console.log(clmap);
	
	/*
		<c:forEach items="${requestScope.cultureCombinedTimetable }" var="clMap">
		${clMap.key}
		<c:forEach items="${clMap.value }" var="cl">
			${cl.id} / day = ${cl.day } / prof = ${cl.professor} /  start = ${cl.starttime } / end = ${cl.endtime }<br/>	
		</c:forEach>
	</c:forEach>

	*/
</script>





