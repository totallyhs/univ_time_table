<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
	<head>
		<title>Welcome</title>
	</head> 
	<body>
		<h2>열심히 안하면 이름 뺍니다!</h2>
		
		
		<form action="index" method="post" autocomplete="off">
			<select id="selectId" name="id">
				<option>test1</option>
				<option>test2</option>
			</select>
			<button type="submit">로그인</button>		
		</form> 
	</body>
</html>


<script>
	
</script>