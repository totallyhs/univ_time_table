<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
#index {
	position: absolute;
	margin: 0 auto;
	min-height: 250px;
	top : 100px;
	padding: 20px;
	z-index: 9999;
}

</style>

	<div id="index">
		<h2 style="color: white;">열심히 안하면 이름 뺍니다!</h2>
		
		
		<c:choose>
			<c:when test="${sessionScope.memberVo eq null }">
				<form action="/index" method="post" autocomplete="off">	
					<select id="selectId" name="id">
						<option value="test1">test1</option>
						<option value="test2">test2</option>
					</select>
					<button type="submit">로그인</button>		
				</form> 
			</c:when>
			<c:otherwise>
				<c:out value="${sessionScope.memberVo.nickname }"/> 님 환영합니다.<br/>
				<a href="/logout"><button id="logoutBtn">로그아웃</button></a>
			</c:otherwise>
		</c:choose>
		<br/><span id="anyUse"></span>	
	</div>

