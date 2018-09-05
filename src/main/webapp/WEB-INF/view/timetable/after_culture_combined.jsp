<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<c:forEach items="${requestScope.cultureCombinedTimetable }" var="clMap">
		${clMap.key}
		<c:forEach items="${clMap.value }" var="cl">
			${cl.id} / day = ${cl.day } / prof = ${cl.professor} /  start = ${cl.starttime } / end = ${cl.endtime }<br/>	
		</c:forEach>
	</c:forEach>
	<br/>
	
	<c:forEach begin="0" end="${listLength -1 }" var="page">
		<a href="/timetable/culture/combination?page=${page }">
			${page }
		</a>
	</c:forEach>
