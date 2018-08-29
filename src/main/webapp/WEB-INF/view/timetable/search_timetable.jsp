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

.box-a {
	width: 20%;
}

.box-b {
	width: 20%
}

.box-c {
	
}
</style>
<!-- / College Timetable -->
<div class="row">
	<div class="box box-a">
		<h1>시간표 만들기</h1>
	</div>
	<div class="box box-b">
		<table border='0' cellpadding='0' cellspacing='0'>
			<tr class='days'>
				<th></th>
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
				<td id='1${i }30'></td>
				<td id='2${i }30'></td>
				<td id='3${i }30'></td>
				<td id='4${i }30'></td>
				<td id='5${i }30'></td>
			</tr>
			</c:forEach>
		</table>
	</div>
	<div class="box box-c">
		<h1>과목 리스트</h1>
		<c:forEach var="subject" items="${subjectList }">
			<tr>
				<input id='${subject.no }' type="checkbox"/>
				<td>학수번호 : ${subject.no }</td>
				<td>과목 명 : ${subject.name }</td>
				
			</tr>
			<hr/>
		</c:forEach>

	</div>
</div>
<button id='example'>버튼</button>
<script>
	var ex = document.getElementById('COE3052');
	var ex2 = document.getElementById('1900');
	ex.addEventListener('mouseover', function() {
		ex2.style.backgroundColor = 'green';
	});
</script>